# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    name { 'Totoro' }
    description { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { Date.new(2020, 9, 15) }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  # factory :second_task, class: Task do
  #   name { 'Kiki' }
  #   description { 'Factoryで作ったデフォルトのコンテント２' }
  #   deadline { '2020-09-25' }
  # end
end
