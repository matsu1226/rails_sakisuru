require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:user) { FactoryBot.create(:user) }
  before do
    user.confirm
    @frame = FactoryBot.create(:frame, user_id: user.id)
    @tag = FactoryBot.build(:tag, frame_id: @frame.id)
  end

  subject { @tag }

  it { should respond_to(:frame_id) }
  it { should respond_to(:text) }
  it { should respond_to(:area_num) }
  it { should respond_to(:privated) }
  
  it { should respond_to(:frame) }

  describe "正しいtagを保存するテスト" do
    before { @tag.save }
    it { should be_valid }
  end

  context "正しくないtagを保存するテスト" do
    describe "textが空欄" do
      before { @tag.text = "" }
      it { should_not be_valid }
    end

    describe "textが50文字より多い" do
      before { @tag.text = "a" * 51 }
      it { should_not be_valid }
    end

    describe "area_numが空欄" do
      before { @tag.area_num = "" }
      it { should_not be_valid }
    end

    describe "area_numが指定の値（1,2,3,4）以外" do
      before { @tag.area_num = "5" }
      it { should_not be_valid }
    end

  end

end
