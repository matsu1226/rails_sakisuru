FactoryBot.define do
  factory :frame do
    statement { "家族の幸福度を最大にする" }
    text { "娘が生まれたことを機に時間を効率的に使いたいと思い、サキスルを始めました。" }
  end

  factory :frame2, class: Frame do
    statement { "５年以内に家族でヨーロッパ旅行に行く" }
    text { "子供に世界観を広げてもらいたいので、中学はいる前に実現したいと考えています。" }
  end
end
