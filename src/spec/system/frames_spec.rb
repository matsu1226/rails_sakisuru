require 'rails_helper'

RSpec.describe "Frames", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:frame) { FactoryBot.create(:frame, user: user) }
  let(:other_user) { FactoryBot.create(:user2) }
  let(:other_frame) { FactoryBot.create(:frame2, user: other_user) }
  let(:tag_index_page_title) { "Taskの作成" }

  before do
    user.update_attribute(:confirmed_at, Time.zone.now)
    sign_in(user)
  end

  context "新規作成 frames/new" do
    before { visit new_frame_path }

    describe "正常な新規登録" do
      before do
        find("#frame_statement").set("a"*10)
        find("#frame_text").set("a"*10)
        # click_button "ToDoの作成へ", disabled: true
        click_button "ToDoの作成へ"
      end
      it { expect(page).to have_content tag_index_page_title }
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


  context "編集 frames/1/edit" do
    describe "リンクの有無を確認" do
      it"自分のuserページから投稿編集ページに遷移" do
        visit user_path(user)
        expect(page).to have_content user.name
        expect(page).to have_link nil, href: edit_frame_path(frame)
      end      
      it"他人のuserページから投稿編集ページに遷移できない" do
        visit user_path(other_user)
        expect(page).not_to have_link nil, href: edit_frame_path(other_frame)
      end
    end

    describe "編集のテスト" do
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
        it { expect(page).to have_content tag_index_page_title }
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
  
      describe "削除" do
        it "" do
          expect {
            visit frame_tags_path(frame_id: frame.id)
            find(".frames-destroy").click
            page.driver.browser.switch_to.alert.accept  
          }.to change { Frame.all.count }.by(-1)
        end
        # before do
        #   count = Frame.all.count
        #   visit frame_tags_path(frame_id: frame.id)
        #   find(".frames-destroy").click
        #   page.driver.browser.switch_to.alert.accept
        # end
        # it { expect(page).to have_content "投稿を削除しました" }
        # it { expect(Frame.all.count).to eq (count - 1) }
      end
      
    end

  end


  context "一覧 frames" do
    
  end

end
