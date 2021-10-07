require 'rails_helper'

RSpec.describe User, type: :model do
  let(:today) { Time.new(2021, 10 ,1, 9, 00, 00) }

  before do
    ActionMailer::Base.deliveries = []
    travel_to today
    @user = FactoryBot.build(:user)
  end

  subject { @user }
  
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:birthday)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:confirmation_token)}
  it {should respond_to(:confirmed_at)}
  it {should respond_to(:confirmation_sent_at)}
  
  it {should respond_to(:frames)}


  describe "正しいuserを保存するテスト" do
    before { @user.save }
    it { should be_valid }
  end


  context "正しくないuserを保存するテスト" do
    describe "名前が空欄" do
      before { @user.name = " " }
      it { should_not be_valid }
    end

    describe "名前が12文字より多い" do
      before { @user.name = "a" * 13 }
      it { should_not be_valid }
    end

    describe "メールが空欄" do
      before { @user.email = " " }
      it { should_not be_valid }
    end

    describe "メールが重複" do
      let(:user_with_same_email) { User.new(name: "健太", 
                                            email: "shotaro@example.com",
                                            birthday: Date.new(1991, 11, 25),
                                            password: "example02",
                                            password_confirmation: "example02")}
      before do
        @user.save
        user_with_same_email.save
      end
      it { expect(user_with_same_email).not_to be_valid }
    end

    # it "メールフォーマットがダメ" do
    #   address = ["examplegmail.com", "@gmail.com", "example@g_mail.com", "example@gmailcom", "example@gmail.56"] 
    #   address.each do |invalid_address|
    #     @user.email = invalid_address
    #     expect(@user).not_to be_valid
    #   end
    # end
    
    describe "パスワードが空欄" do
      before { @user.password = " " }
      it { should_not be_valid }
    end

    describe "パスワードが6文字未満" do
      before do
        @user.password = "a" * 5 
        @user.password_confirmation = "a" * 5 
      end  
      it { should_not be_valid }
    end

    describe "birthdayが空欄" do
      before { @user.birthday = "" }
      it { should_not be_valid }
    end

    describe "birthdayが今日以降" do
      before { @user.birthday = Date.new(2021, 10, 2) }
      it { should_not be_valid }
    end
    
    describe "birthdayが1920年より前" do
      before { @user.birthday = Date.new(1919, 12, 31) }
      it { should_not be_valid }
    end
  end

end
