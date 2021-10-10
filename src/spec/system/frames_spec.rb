require 'rails_helper'

RSpec.describe "Frames", type: :system do
  let(:user) { FactoryBot.create(:user) }
  before do
    user.confirm
    sign_in(user)
  end

  describe "新規作成" do
    before { visit new_frame_path }

    describe "正常な新規登録" do
      before do
        find("#frame_statement").set("a"*10)
        find("#frame_text").set("a"*10)
        click_button "ToDoの作成へ", disabled: true
      end
      it { expect(page).to have_content "ToDoの作成" }
      it { expect(page).to have_content "aaaaaaaaaa" }
    end

    describe "エラー" do
      before do
        find("#frame_statement").set("")
        find("#frame_text").set("a"*10)
      end
      it { expect(find('#frame_create_btn')).to be_disabled }
    end
  end
end
