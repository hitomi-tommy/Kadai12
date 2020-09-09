require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  # before do
  #   # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
  #   FactoryBot.create(:task)
  #   FactoryBot.create(:second_task)
  #   FactoryBot.create(:third_task)
  # end

  # describe '新規作成機能' do
  #   # context 'タスクを新規作成した場合' do
  #     it '作成したタスクが表示される' do
  #       # 1. new_task_pathに遷移する（新規作成ページに遷移する）
  #       visit new_task_path
  #       # 2. 新規登録内容を入力する
  #       # 「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
  #       fill_in 'task[name]', with: 'task'
  #       fill_in 'task[description]', with: 'task'
  #       fill_in 'task[deadline]', with: Date.new(2020, 9, 30)
  #       select (I18n.t('view.not_yet_started')), from: 'task_status'
  #       # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
  #       click_on('登録する')#ここに「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
  #       # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
  #       # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
  #       # visit tasks_path
  #       sleep(100)
  #       expect(page).to have_content 'task'#ここにタスク詳細ページに、テストコードで作成したデータがタスク詳細画面にhave_contentされているか（含まれているか）を確認（期待）するコードを書く
  #     end
  #   end
  #
  #   context '複数のタスクを作成した場合' do
  #     it 'タスクが終了期限の昇順に並んでいる' do
  #       visit new_task_path
  #       fill_in 'task[name]', with: 'task'
  #       fill_in 'task[description]', with: 'task'
  #       fill_in 'task[deadline]', with: Date.new(2020, 9, 30)
  #
  #       click_on('登録する')
  #       visit tasks_path
  #       click_on ('終了期限でソートする')
  #       task_list = all('.deadline_row') # タスク一覧を配列として取得するため、View側でidを振っておく
  #       expect(task_list[0]).to have_content Date.new(2020, 9, 15)
  #       expect(task_list[1]).to have_content Date.new(2020, 9, 30)
  #     end
  #   end
  # end

  describe '検索機能' do
    before do
      FactoryBot.create(:task)
      FactoryBot.create(:second_task, name: "happiness", description: 'in giving', status: '未着手')
      FactoryBot.create(:third_task, name: "test", description: 'will happen in the end.', status: '完了')
    end
  #
  #   context 'タイトルであいまい検索をした場合' do
  #     it "検索キーワードを含むタスクで絞り込まれる" do
  #       visit tasks_path
  #       # タスクの検索欄に検索ワードを入力する (例: task)
  #       fill_in 'name_search', with: 'ta'
  #       # 検索ボタンを押す
  #       click_on (I18n.t('helpers.submit.search'))
  #       expect(page).to have_content 'task'
  #
  #     end
  #   end
  # end
  #
  #   context 'ステータス検索をした場合' do
  #     it "ステータスに完全一致するタスクが絞り込まれる" do
  #       visit tasks_path
  #       select (I18n.t('view.not_yet_started')), from: 'status_search'
  #       click_on (I18n.t('helpers.submit.search'))
  #       expect(page).to have_content '未着手'
  #     end
  #   end

    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in 'name_search', with: 'ta'
        select (I18n.t('view.not_yet_started')), from: 'status_search'
        click_on (I18n.t('helpers.submit.search'))
        expect(page).to have_content 'task'
        expect(page).to have_content '未着手'
      end
    end
  end

  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みのタスク一覧が表示される' do
  #       # テストで使用するためのタスクを作成
  #       task = FactoryBot.create(:task, name: 'task')
  #       # タスク一覧ページに遷移
  #       visit tasks_path
  #       # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
  #       # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
  #       expect(page).to have_content 'task'
  #       # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
  #     end
  #   end
  #
  #   context 'タスクが作成日時の降順に並んでいる場合' do
  #     it '新しいタスクが一番上に表示される' do
  #       new_task = FactoryBot.create(:task, name: 'new_task')
  #       visit tasks_path
  #       task_list = all('.task_row')
  #       expect(task_list[0]).to have_content 'new_task'
  #       expect(task_list[1]).to have_content 'Kiki'
  #     end
  #   end
  # end
  #
  # describe '詳細表示機能' do
  #   context '任意のタスク詳細画面に遷移した場合' do
  #     it '該当タスクの内容が表示される' do
  #       visit tasks_path
  #       visit task_path(1)
  #       expect(page).to have_content 'task'
  #
  #     end
  #   end
  # end
end
