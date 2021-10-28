# 基本線 => https://osusublog.net/?p=1432
# circleCI対応 => https://qiita.com/tomoronn3/items/ee66d4bdcf1f21a352c2

require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, options: {
      browser: :remote,
      url: ENV.fetch("SELENIUM_DRIVER_URL"),
      desired_capabilities: :chrome
    }
    # Capybara.server_host = 'web'
    # Capybara.app_host="http://#{Capybara.server_host}"

    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    # IPSocket.getaddress("www.ruby-lang.org")        #=> "210.163.138.100"
    # ホスト名からホストのアドレスを返します (例: 127.0.0.1) 

    # p Socket.gethostname   #=> "helium.ruby-lang.org"
    # システムの標準のホスト名を取得します。
    Capybara.server_port = 4444
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
end