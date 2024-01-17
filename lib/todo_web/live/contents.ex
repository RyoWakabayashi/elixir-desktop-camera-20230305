defmodule TodoWeb.Contents do
  use Phoenix.Component

  def contents(assigns) do
    templates = [
      ~H"""
      <div class="leading-relaxed">
        <div class="flex items-center mb-4">
          <img
            src="https://media.connpass.com/thumbs/73/ac/73ac4e4721d74b114cc53015c537c44c.png"
            class="w-2/3"
          />
          <div class="block">
            <p class="text-6xl sm:text-8xl">#38</p>
            <p class="text-6xl sm:text-8xl">#6</p>
          </div>
        </div>
        <div>
          Elixirでスマホネイティブアプリ開発の今
        </div>
      </div>
      """,
      ~H"""
      <div class="leading-relaxed">
        <p class="mb-2">Elixirでスマホネイティブアプリ開発をしよう</p>
        <ul class="list-disc list-outside pl-8 mb-8">
          <li>React Native や Flutter のように</li>
          <li>iOS でも</li>
          <li>Android でも</li>
          <li>Web やデスクトップも同時に</li>
        </ul>
        <p class="mb-2">隔月 第1水曜日開催</p>
      </div>
      """,
      ~H"""
      <div class="h-full leading-relaxed">
        <div>
          <p class="mb-2">@the_haigo さん作</p>
        </div>
        <img src="https://camo.qiitausercontent.com/664e5afd7c567a58f7a797af8c646ebc22846d11/68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f36343139382f38323832666234652d343962392d616335362d623563642d3465353366346436663131382e676966" class="w-64" />
      </div>
      """,
      ~H"""
      <div class="leading-relaxed">
        <div>
          <p class="mb-2">@RyoWakabayashi 作</p>
        </div>
        <img src="https://qiita-user-contents.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F1485835%2Fbb1f4bb5-18b5-b1ed-f493-30f617889675.gif?ixlib=rb-4.0.0&auto=format&gif-q=60&q=75&w=1400&fit=max&s=9a08481a0af844f003dea275246384b7" class="w-64" />
      </div>
      """
    ]

    if assigns.index < Enum.count(templates) do
      Enum.at(templates, assigns.index)
    else
      ~H"""
      <p>Out Of Index</p>
      """
    end
  end
end
