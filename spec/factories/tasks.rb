# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    name { 'task_name' }
    description { 'task' }
    deadline { Date.new(2020, 9, 30) }
    status { '未着手' } #(I18n.t('view.in_progress'))}
    priority { '高' }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    name { 'second_task_name' }
    description { 'task2' }
    deadline { Date.new(2021, 9, 30) }
    status { '着手中' } #(I18n.t('view.not_yet_started'))}
    priority { '低' }
  end

  # factory :third_task, class: Task do
  #   name { 'test' }
  #   description { 'will happen in the end.' }
  #   deadline { Date.new(2020, 10, 15) }
  #   status { '完了' } #(I18n.t('view.completed'))}
  #   priority { '低' }
  # end

end
