require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do
    let!(:user) { FactoryBot.create(:user) }
    let!(:label) { FactoryBot.create(:label) }
    let!(:second_label) { FactoryBot.create(:second_label) }
    let!(:task) { FactoryBot.create(:task, user: user) }
    let!(:second_task) { FactoryBot.create(:task, name: 'second_task', user: user) }

    before do
    visit new_session_path
    fill_in 'session[email]', with: "test1@power.com"
    fill_in 'session[password]', with: "testest"
    click_on 'Log in'
    visit tasks_path
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it 'タスクと一緒にラベルを登録できる' do
        click_on '新規作成'
        visit new_task_path
        fill_in 'task[name]', with: 'task_name'
        fill_in 'task[description]', with: 'task'
        fill_in 'task[deadline]', with: Date.new(2020, 9, 30)
        select '未着手', from: 'task_status'
        select '高', from: 'task_priority'
        check 'Monday'
        sleep 1
        #find('label[for="Monday"]').click
        # find(:label, for: 'Monday').click
        click_on '登録する'
        # expect(page).to have_content 'task_name'
        # expect(page).to have_content '2020'
        # expect(page).to have_content '未着手'
        expect(page).to have_checked_field('Monday')
        # expect(page).to have_content '高'
      end
    end
  end

  describe '表示機能' do
    context '一覧画面に遷移した場合' do
      it 'タスク一覧とそれぞれのタスクに紐づくラベルが表示される' do
        visit new_task_path
        fill_in 'task[name]', with: 'second_task_name'
        fill_in 'task[description]', with: 'task2'
        fill_in 'task[deadline]', with: Date.new(2021, 9, 30)
        select '着手中', from: 'task_status'
        select '低', from: 'task_priority'
        check 'Friday'
        sleep 1
        # find('label[for="Friday"]').click
        # find(:label, for: 'Friday').click
        click_on '登録する'
        expect(page).to have_content 'Friday'
      end
    end
    # context '任意のタスク詳細画面に遷移した場合' do
    #   it '該当タスクの内容とラベルが表示される' do
    #     visit new_task_path
    #     fill_in :task_task_name, with: 'task_name'
    #     fill_in :task_content, with: 'task'
    #     select '2021', from: :task_deadline_1i
    #     select '着手中', from: 'task_status'
    #     select '高', from: 'task_priority'
    #     check 'work'
    #     click_on "Post task"
    #     sleep 0.5
    #     tds = page.all('td')
    #     tds[6].click
    #     expect(page).to have_content 'work'
    #   end
    # end
  end

  # describe '検索機能' do
  #   let!(:user) { FactoryBot.create(:user) }
  #   before do
  #     visit new_task_path
  #     fill_in :task_task_name, with: 'task_name'
  #     fill_in :task_content, with: 'task'
  #     select '2021', from: :task_deadline_1i
  #     select '着手中', from: 'task_status'
  #     select '高', from: 'task_priority'
  #     check 'work'
  #     click_on "Post task"
  #     visit tasks_path
  #   end
  #  context 'ラベルのみで検索した場合' do
  #    it 'ラベルで検索した場合' do
  #      select 'work', from: 'label_id'
  #      click_on '検索'
  #      task = all('tbody tr')
  #      expect(task[0]).to have_content 'work'
  #     end
  #   end
  # end

end
