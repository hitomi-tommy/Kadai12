require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  #
  # describe '新規作成機能' do
  #   context 'ユーザーを新規作成した場合' do
  #     it '作成したユーザーが表示される' do
  #       visit new_user_path
  #       fill_in 'user[name]', with: 'test1'
  #       fill_in 'user[email]', with: 'test1@power.com'
  #       fill_in 'user[password]', with: 'testest'
  #       fill_in 'user[password_confirmation]', with: 'testest'
  #       click_on "Create my account"
  #       expect(page).to have_content 'test1'
  #       expect(page).to have_content 'test1@power.com'
  #     end
  #     #
  #     # it 'ユーザがログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する' do
  #     #   visit root_path
  #     #   expect(current_path).to eq new_session_path
  #     # end
  #   end
  # end

  # describe "セッション機能のテスト" do
  #   before do
  #     @user = FactoryBot.create(:user)
  #   end
  #   context "ユーザのデータがあってログインしていない場合" do
  #     it "ログインできること" do
  #       visit new_session_path
  #       fill_in 'session[email]', with: "test1@power.com"
  #       fill_in 'session[password]', with: "testest"
  #       click_on ('Log in')
  #       expect(page).to have_content 'test1@power.com'
  #     end
  #   end
  #
  #   context "ユーザのデータがあってログインしている場合" do
  #     before do
  #       visit new_session_path
  #       fill_in "session[email]", with: "test1@power.com"
  #       fill_in "session[password]", with: "testest"
  #       click_on ('Log in')
  #     end
  #
  #     it "自分の詳細画面に飛べること" do
  #       expect(page).to have_content 'test1'
  #     end
  #
  #     it "一般ユーザが他人の詳細画面に飛ぶとタスク一覧ページに遷移すること" do
  #       @admin_user = FactoryBot.create(:admin_user)
  #       visit user_path(@admin_user.id)
  #       expect(page).to have_content "タスク一覧"
  #     end
  #
  #     it "ログアウトができること" do
  #       visit user_path(id: @user.id)
  #       click_on ('Logout')
  #       # expect(current_path).to eq new_session_path
  #       expect(page).to have_content "ログアウトしました"
  #     end
  #   end
  # end
  #
  describe "管理画面のテスト" do
    context "管理者がログインしている場合" do
      it "管理者は管理画面にアクセスできること" do
        FactoryBot.create(:admin_user)
        visit new_session_path
        fill_in "session_email", with: "admin1@power.com"
        fill_in "session_password", with: "adminmin"
        click_on ('Log in')
        visit admin_users_path
        expect(page).to have_content "ユーザー一覧"
      end
    end

    context "一般ユーザでログインしている場合" do
      it "一般ユーザは管理画面にアクセスできないこと" do
        FactoryBot.create(:user)
        visit new_session_path
        fill_in "session_email", with: "test1@power.com"
        fill_in "session_password", with: "testest"
        click_on ('Log in')
        visit admin_users_path
        expect(page).to have_content "タスク一覧"
      end
    end

    context "管理者でログインしている場合" do
      before do
        FactoryBot.create(:admin_user)
        visit new_session_path
        fill_in "session_email", with: "admin1@power.com"
        fill_in "session_password", with: "adminmin"
        click_on ('Log in')
        visit admin_users_path
      end

      it "管理者はユーザを新規登録できること" do
        click_on "ユーザーの作成"
        fill_in "user_name", with: "user2"
        fill_in "user_email", with: "user2@power.com"
        fill_in "user_password", with: "userser"
        fill_in "user_password_confirmation", with: "userser"
        click_on '登録する'
        expect(page).to have_content "user2"
      end

      it "管理者はユーザ詳細画面にアクセスできること" do
        @user = FactoryBot.create(:user)
        click_on '詳細'
        visit admin_user_path(id: @user.id)
        expect(page).to have_content "test1"
      end

      it "管理者はユーザの編集画面からユーザを編集できること" do
        @user = FactoryBot.create(:user)
        visit edit_admin_user_path(id: @user.id)
        fill_in 'user_name', with: 'edit'
        fill_in 'user_email', with: 'edit@power.com'
        fill_in 'user_password', with: 'editdit'
        fill_in 'user_password_confirmation', with: 'editdit'
        click_on '更新する'
        expect(page).to have_content "edit"
      end

      it "管理者はユーザの削除をできること" do
        @user = FactoryBot.create(:user)
        visit admin_users_path
        click_on "ユーザーの削除", match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "ユーザーを削除しました"
      end
    end
  end
end
