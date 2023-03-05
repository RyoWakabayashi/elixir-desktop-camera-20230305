defmodule TodoWeb.TodoLive do
  @moduledoc """
    Main live view of our TodoApp. Just allows adding, removing and checking off
    todo items
  """
  use TodoWeb, :live_view

  @impl true
  def mount(_args, _session, socket) do
    todos = TodoApp.Todo.all_todos()
    TodoApp.Todo.subscribe()
    {:ok, assign(socket, todos: todos)}
  end

  @impl true
  def handle_info(:changed, socket) do
    todos = TodoApp.Todo.all_todos()
    {:noreply, assign(socket, todos: todos)}
  end

  # 写真撮影時の処理
  # 画像をグレースケールに変換する
  def handle_event("take", %{"pixel" => pixel}, socket) do
    width = 400

    # ピクセルデータをテンソルに変換
    pixel_tensor =
      "<<#{pixel}>>"
      |> Code.eval_string()
      |> elem(0)
      |> Nx.from_binary({:u, 8})

    {length} = Nx.shape(pixel_tensor)
    height = div(length, width * 4)

    pixel_tensor = Nx.reshape(pixel_tensor, {width, height, 4})
    alpha_tensor = Nx.slice_along_axis(pixel_tensor, 3, 1, axis: -1)

    # グレースケールに変換
    gray_tensor =
      pixel_tensor
      |> Nx.slice_along_axis(0, 3, axis: -1)
      |> Nx.mean(axes: [-1], keep_axes: true)
      |> Nx.as_type({:u, 8})

    # ピクセルデータに変換
    gray_pixel =
      [gray_tensor, gray_tensor, gray_tensor, alpha_tensor]
      |> Nx.concatenate(axis: -1)
      |> Nx.to_flat_list()

    {:reply, %{image: gray_pixel}, socket}
  end

  @impl true
  def handle_event("add", %{"text" => ""}, socket) do
    {:noreply, socket}
  end

  def handle_event("add", %{"text" => text}, socket) do
    TodoApp.Todo.add_todo(text, "todo")

    Desktop.Window.show_notification(TodoWindow, "Added todo: #{text}",
      callback: &notification_event/1
    )

    {:noreply, socket}
  end

  def handle_event("toggle", %{"id" => id}, socket) do
    id = String.to_integer(id)
    TodoApp.Todo.toggle_todo(id)
    {:noreply, socket}
  end

  def handle_event("drop", %{"id" => id}, socket) do
    id = String.to_integer(id)
    TodoApp.Todo.drop_todo(id)
    {:noreply, socket}
  end

  def notification_event(action) do
    Desktop.Window.show_notification(TodoWindow, "You did '#{inspect(action)}' me!",
      id: :click,
      type: :warning
    )
  end
end
