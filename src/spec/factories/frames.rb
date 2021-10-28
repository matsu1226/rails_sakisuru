FactoryBot.define do
  factory :frame do
    statement { "家族の幸福度を最大にする" }
    text { "娘が生まれたことを機に時間を効率的に使いたいと思い、サキスルを始めました。" }
    association :user
  end
end
