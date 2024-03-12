defmodule TodoWeb.Contents do
  use Phoenix.Component

  def contents(assigns) do
    templates = [
      ~H"""
      <div class="leading-relaxed">
        <div class="flex items-center mb-4">
          <img
            src="https://media.connpass.com/thumbs/ee/a6/eea62c5f806564da291f16a636db96e2.png"
            class="w-2/3"
          />
          <div class="block">
            <p class="text-6xl sm:text-8xl">#7</p>
          </div>
        </div>
        <div>
          ジェネレータ作ったよ+ ハンズオン会
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
      <div class="leading-relaxed">
        <p class="mb-2">録画します</p>
        <ul class="list-disc list-outside pl-8">
          <li>顔出しNGの方はビデオOFFにしてください</li>
          <li>後程、 Youtube チャンネルに投稿します</li>
          <li class="break-all">
            <a href="https://www.youtube.com/@piacerex">
              https://www.youtube.com/@piacerex
            </a>
          </li>
        </ul>
        <img src="images/qr-youtube.png" class="w-40"/>
      </div>
      """,
      ~H"""
      <div class="leading-relaxed">
        <p class="mb-2">乾杯します</p>
        <ul class="list-disc list-outside pl-8">
          <li>お手元にお飲み物をご用意ください</li>
          <li>乾杯の様子を撮影します</li>
          <li>可能な方はビデオON、マイクONお願いします</li>
        </ul>
      </div>
      """,
      ~H"""
      <div class="leading-relaxed">
        <p class="mb-2">Discordで自己紹介</p>
        <ul class="list-disc list-outside pl-8">
          <li>elixir と見習い錬金術師</li>
          <li>#elixir スマホ開発</li>
          <li>「○○です。○○に興味があります」</li>
          <li class="break-all">
            <a href="https://discord.com/channels/1028556271881818113/1028567372119937074">
              https://discord.com/channels/1028556271881818113/1028567372119937074
            </a>
          </li>
        </ul>
        <img src="images/qr-discord.png" class="w-40"/>
      </div>
      """,
      ~H"""
      <div class="leading-relaxed">
        <p class="mb-2">本日の進行表</p>
        <div class="break-all text-blue-500">
          <a href="https://docs.google.com/spreadsheets/d/1GVK_1bVgndpdvNRYZu4fY-0De3rxDMqI5c6MhSD6vbQ/edit?usp=sharing">
          https://docs.google.com/spreadsheets/d/1GVK_1bVgndpdvNRYZu4fY-0De3rxDMqI5c6MhSD6vbQ/edit?usp=sharing
          </a>
        </div>
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
