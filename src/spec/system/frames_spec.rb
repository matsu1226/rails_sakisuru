require 'rails_helper'

RSpec.describe "Frames", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:frame) { FactoryBot.create(:frame, user: user) }
  let(:tag_index_text) { "Taskの作成" }

  before do
    user.update_attribute(:confirmed_at, Time.zone.now)
    sign_in(user)
  end

  describe "新規作成 frames/new" do
    before { visit new_frame_path }

    describe "正常な新規登録" do
      before do
        find("#frame_statement").set("a"*10)
        find("#frame_text").set("a"*10)
        # click_button "ToDoの作成へ", disabled: true
        click_button "ToDoの作成へ"
      end
      it { expect(page).to have_content tag_index_text }
      it { expect(page).to have_content "aaaaaaaaaa" }
    end

    describe "エラー" do
      before do
        find("#frame_statement").set("")
        find("#frame_text").set("a"*10)
      end
      it { expect(find('#frame_create_btn')).to be_disabled }
    end

    describe "文字数カウンターの確認" do
      before do
        find("#frame_statement").set("a"*8)
        find("#frame_text").set("a"*12)
      end
      it { expect(page).to have_content "あと62文字" }
      it { expect(page).to have_content "あと288文字" }
    end
  end

  describe "編集 frames/1/edit" do
    before { visit edit_frame_path(frame) }

    describe "変更前の値の表示" do
      it { expect(page).to have_content frame.statement }
      it { expect(page).to have_content frame.text }
    end


    describe "正常な編集" do
      before do
        find("#frame_statement").set("a"*10)
        find("#frame_text").set("a"*10)
        # click_button "ToDoの作成へ", disabled: true
        click_button "ToDoの作成へ"
      end
      it { expect(page).to have_content tag_index_text }
      it { expect(page).to have_content "aaaaaaaaaa" }
    end

  end

end
