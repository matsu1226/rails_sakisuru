class Users::Mailer < Devise::Mailer
  # helper :application
  # "new_user_confirmation_path"等の生成
  include Devise::Controllers::UrlHelpers   
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts={})
    # record =  <User id: 6, 
    #                 email: "qqq.ms1121@gmail.com", 
    #                 created_at: "2021-10-05 14:03:33.545647000 +0000",
    #                 updated_at: "2021-10-05 14:03:33.545647000 +0000", 
    #                 name: "松田　正太郎", 
    #                 birthday: "1990-01-01">
    #opts属性を上書きすることで、Subjectやfromなどのヘッダー情報を変更することが可能！
    opts[:subject] = "【サキスル／目標管理サービス】仮登録メール"
    
    #件名の指定以外は親を継承
    super
  end
end