require 'rails_helper'

RSpec.describe Frame, type: :model do
  let(:user) { FactoryBot.create(:user) }
  before do
    user.confirm
    @frame = FactoryBot.build(:frame, user_id: user.id)
  end

  subject { @frame }

  it { should respond_to(:statement) }
  it { should respond_to(:text) }
  it { should respond_to(:user_id) }
  it { should respond_to(:review_1) }
  it { should respond_to(:review_2) }
  it { should respond_to(:review_3) }
  it { should respond_to(:review_4) }

  it { should respond_to(:user) }
  it { should respond_to(:tags) }

  describe "正しいframeを保存するテスト" do
    before { @frame.save }
    it { should be_valid }
  end

  context "正しくないframeを保存するテスト" do
    describe "statementが空欄" do
      before { @frame.statement = "" }
      it { should_not be_valid }
    end

    describe "statementが70文字より多い" do
      before { @frame.statement = "a" * 71 }
      it { should_not be_valid }

    end

    describe "textが空欄" do
      before { @frame.text = "" }
      it { should_not be_valid }

    end

    describe "textが300文字より多い" do
      before { @frame.text = "a" * 301 }
      it { should_not be_valid }

    end

    describe "user_idが空欄" do
      before { @frame.user_id = nil }
      it { should_not be_valid }

    end

  end

end
