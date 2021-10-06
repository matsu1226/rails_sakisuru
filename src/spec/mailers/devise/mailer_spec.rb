require "rails_helper"

RSpec.describe Devise::Mailer, type: :mailer do
  before { ActionMailer::Base.deliveries = [] }
  
  describe "仮登録メール(confirmation_instructions)" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { Users::Mailer.confirmation_instructions(user, user.confirmation_token) }
    let(:send_mail_subject) { "【サキスル／目標管理サービス】仮登録メール" }
    # bodyのエンコードがうまくいかない…。
    # let(:mail_body) { mail.body.encoded.split(/\r\n/).map{|i| Base64.decode64(i)}.join }

    describe "header and body" do
      it { expect(mail.subject).to eq(send_mail_subject) }
      it { expect(mail.from).to eq( ["noreply@sakisuru.ml"] )}
      it { expect(mail.to).to eq( ["shotaro@example.com"] )}
      # it { expect(mail_body).to match CGI.escape(user.confirmation_token) }
    end
  end
end
