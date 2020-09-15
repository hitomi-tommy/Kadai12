require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do

  describe '新規作成機能' do
    context 'ユーザーを新規作成した場合' do
      it '作成したユーザーが表示される' do
        visit new_user_path
        fill_in 'user[name]', with: 'test1'
        fill_in 'user[email]', with: 'test1@power.com'
        fill_in 'user[password]', with: 'testest'
        fill_in 'user[password_confirmation]', with: 'testest'
        click_on "Create my account"
        expect(page).to have_content 'test1'
        expect(page).to have_content 'test1@power.com'

      end
      it 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する' do
        visit root_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe "セッション機能のテスト" do
    before do
      @user = FactoryBot.create(:user)
    end
    context "ユーザのデータがあってログインしていない場合" do
      it "ログインできること" do
        visit new_session_path
        fill_in 'session[email]', with: "test1@power.com"
        fill_in 'session[password]', with: "testest"
        click_on ('Log in')
        expect(page).to have_content 'test1@power.com'
      end
    end

    context "ユーザのデータがあってログインしている場合" do
      before do
        visit new_session_path
        fill_in "session[email]", with: "test1@power.com"
        fill_in "session[password]", with: "testest"
        click_on ('Log in')
      end

      it "自分の詳細画面に飛べること" do
        expect(page).to have_content 'test1'
      end

      it "一般ユーザが他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
        @admin_user = FactoryBot.create(:admin_user)
        visit user_path(@admin_user.id)
        expect(page).to have_content "タスク一覧"
      end

      it "ログアウトができること" do
        visit user_path(id: @user.id)
        click_on ('Logout')
        # expect(current_path).to eq new_session_path
        expect(page).to have_content "ログアウトしました"
      end
    end
  end
end
