# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    name { 'task' }
    description { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { Date.new(2020, 9, 15) }
    status { '未着手' } #(I18n.t('view.in_progress'))}
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    name { 'more happiness' }
    description { 'in giving' }
    deadline { Date.new(2020, 10, 5) }
    status { '未着手' } #(I18n.t('view.not_yet_started'))}
  end

  factory :third_task, class: Task do
    name { 'test' }
    description { 'will happen in the end.' }
    deadline { Date.new(2020, 10, 15) }
    status { '完了' } #(I18n.t('view.completed'))}
  end

end
