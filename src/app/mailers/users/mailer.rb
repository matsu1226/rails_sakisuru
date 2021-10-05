class Users::Mailer < Devise::Mailer
  # helper :application
  # "new_user_confirmation_path"等の生成
  include Devise::Controllers::UrlHelpers   
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts={})
    #record内にユーザ情報が入っていました。そこの"unconfirmed_email"の有無で登録／変更を仕分けます
    #opts属性を上書きすることで、Subjectやfromなどのヘッダー情報を変更することが可能！
    if record.unconfirmed_email != nil
      opts[:subject] = "【サキスル／目標管理サービス】仮登録メール（再送）"
    # else
      opts[:subject] = "【サキスル／目標管理サービス】仮登録メール"
    # end
    #件名の指定以外は親を継承
    super
  end

end

