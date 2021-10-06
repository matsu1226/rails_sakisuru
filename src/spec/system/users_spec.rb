require 'rails_helper'

RSpec.describe "Users", type: :system do
  subject { page }

  describe "新規登録" do
    before do
      ActionMailer::Base.deliveries = [] 
      visit new_user_registration_path
    end

    describe "登録フォーム(users/sign_up)" do
      describe "新規ユーザー" do
        it "正常な新規登録" do
          fill_in '名前', with: "テスト"
          fill_in 'Eメール', with: "test@example.com"
          fill_in 'パスワード', with: "example01"
          fill_in 'パスワード（確認用）', with: "example01"
          find("#user_birthday_1i").find("option[value='1991']").select_option
          find("#user_birthday_2i").find("option[value='11']").select_option
          find("#user_birthday_3i").find("option[value='26']").select_option
          click_button '仮登録メール送信'
          expect(page).to have_content '仮登録のメールを送信しました。メール内のリンクからアカウントを本登録させてください。' 
          expect(ActionMailer::Base.deliveries.count).to eq 1
          test_user = User.find_by(email: "test@example.com")
          expect( test_user.name ).to eq "テスト" 
          expect( test_user.email ).to eq "test@example.com" 
          expect( test_user.birthday.to_s ).to eq  "1991-11-26"
          expect( test_user.encrypted_password ).to be_a_kind_of(String) 
          expect( BCrypt::Password.new(test_user.encrypted_password).is_password?("example01") ).to eq true
        end

        it "nameの空欄" do
          fill_in '名前', with: ""
          fill_in 'Eメール', with: "test@example.com"
          fill_in 'パスワード', with: "example01"
          fill_in 'パスワード（確認用）', with: "example01"
          find("#user_birthday_1i").find("option[value='1991']").select_option
          find("#user_birthday_2i").find("option[value='11']").select_option
          find("#user_birthday_3i").find("option[value='26']").select_option
          click_button '仮登録メール送信'
          expect(page).to have_content '名前を入力してください' 
          expect(page).to have_selector 'h1', text:'会員登録' 
        end

        it "emailの空欄" do
          fill_in '名前', with: "テスト"
          fill_in 'Eメール', with: ""
          fill_in 'パスワード', with: "example01"
          fill_in 'パスワード（確認用）', with: "example01"
          find("#user_birthday_1i").find("option[value='1991']").select_option
          find("#user_birthday_2i").find("option[value='11']").select_option
          find("#user_birthday_3i").find("option[value='26']").select_option
          click_button '仮登録メール送信'
          expect(page).to have_content 'Eメールを入力してください' 
          expect(page).to have_selector 'h1', text:'会員登録'
        end

        describe "emailの重複" do
          let!(:user) { FactoryBot.create(:user) }

          it "emailの重複" do
            fill_in '名前', with: "テスト"
            fill_in 'Eメール', with: user.email
            fill_in 'パスワード', with: "example01"
            fill_in 'パスワード（確認用）', with: "example01"
            click_button '仮登録メール送信'
            expect(page).to have_content 'Eメールはすでに存在します' 
          end
        end
        
        it "passwordの空欄" do
          fill_in '名前', with: "テスト"
          fill_in 'Eメール', with: "test@example.com"
          fill_in 'パスワード', with: ""
          fill_in 'パスワード（確認用）', with: ""
          find("#user_birthday_1i").find("option[value='1991']").select_option
          find("#user_birthday_2i").find("option[value='11']").select_option
          find("#user_birthday_3i").find("option[value='26']").select_option
          click_button '仮登録メール送信'
          expect(page).to have_content 'パスワードを入力してください' 
          expect(page).to have_selector 'h1', text:'会員登録'
        end

        it "passwordの不一致" do
          fill_in '名前', with: "テスト"
          fill_in 'Eメール', with: "test@example.com"
          fill_in 'パスワード', with: "example01"
          fill_in 'パスワード（確認用）', with: "example02"
          find("#user_birthday_1i").find("option[value='1991']").select_option
          find("#user_birthday_2i").find("option[value='11']").select_option
          find("#user_birthday_3i").find("option[value='26']").select_option
          click_button '仮登録メール送信'
          expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません' 
          expect(page).to have_selector 'h1', text:'会員登録'
        end

      end
    end

    describe "仮登録メール再送(users/confirmation/new)" do
      let!(:user) { FactoryBot.create(:user) }
      before { visit new_user_confirmation_path }

      it "DBに存在していないemail" do
        fill_in 'Eメール', with: "test@example.com"
        click_button '仮登録メール再送'
        expect(page).to have_content 'Eメールは見つかりませんでした。' 
      end
      
      it "DBに存在するemail" do
        fill_in 'Eメール', with: user.email
        expect { click_button '仮登録メール再送' }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
      
    end

  end
end
