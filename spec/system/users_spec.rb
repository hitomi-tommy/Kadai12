require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do

  describe '新規作成機能' do
    context 'ユーザーを新規作成した場合' do
      it '作成したユーザーが表示される' do
        visit tasks_path
        click_link 'Sign up'
        fill_in 'user[name]', with: '桃太郎'
        fill_in 'user[email]', with: 'test_user@test.com'
        fill_in 'user[password]', with: 'frompeach'
        fill_in 'user[password_confirmation]', with: 'frompeach'
        click_on "Create account"
        expect(page).to have_content '桃太郎'
        expect(page).to have_content 'test_user@test.com'
      end
      it 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する' do
        visit tasks_path
        expect(page). to have_content 'ログインが必要です'
      end
    end
  end
