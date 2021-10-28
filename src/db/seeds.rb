# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  name: "松田　正太郎",
  email: "shotaro@example.com",
  birthday: "1991-11-26",
  password: "example01",
  password_confirmation: "example01",
  confirmed_at: Time.zone.now,
)

frame = user.frames.create!(
  statement: "家族を最優先に時間を使い、家族の幸福度の総和を高める",
  text: "まずは「この投稿を記録→1週間の時間 の使い方を細かく記録→1週間後にその記録と投稿を見比べて、正しい時間の使い方をしているかを検証→次週の投稿に生かす」のサイクルを回す。頑張るぞ！! ",
  is_draft: false,
  review: "先週は80点。第一を素早くこなすことに成功したけれど、第二に書いた「家族とディナーに行く」が仕事の都合で延期に…。今週こそ挽回したい。"
)

tag1 = frame.tags.create!(
  text: "娘を病院に連れていく",
  area_num: 1,
  privated: true
)
tag2 = frame.tags.create!(
  text: "資格勉強のテキストを5章まで完了させる",
  area_num: 1
)
tag3 = frame.tags.create!(
  text: "家族と立川でディナーを食べる",
  area_num: 2
)
tag4 = frame.tags.create!(
  text: "後輩の山田をランチに誘う",
  area_num: 2
)
tag5 = frame.tags.create!(
  text: "Youtubeで時間をつぶす",
  area_num: 4
)
tag6 = frame.tags.create!(
  text: "Twitterで時間をつぶす",
  area_num: 4
)
tag7 = frame.tags.create!(
  text: "横断プロジェクト会議に出席→山田か高橋に任す",
  area_num: 3
)


# seedとFakerでランダムなサンプルデータを作成
# https://qiita.com/AKI3/items/189574314ca94e8f43c6

19.times do
  sample_name = Gimei.kanji
  sample_email = Faker::Internet.email
  sample_birthday = Faker::Date.between(from: '1970-01-01', to: '2000-12-31')

  user1= User.create!(
    name: sample_name,
    email: sample_email,
    birthday: sample_birthday,
    password: "example01",
    password_confirmation: "example01",
    confirmed_at: Time.zone.now,
  )

  3.times do 
    sample_statement = Faker::Games::Zelda.game
    sample_text = Faker::Games::Zelda.item
    sample_review = Faker::Games::Zelda.location
  
    frame1 = user1.frames.create!(
      statement: sample_statement,
      text: sample_text,
      is_draft: false,
      review: sample_review
    )
  
    10.times do
      sample_text = Faker::Games::Zelda.character
  
      tag = frame1.tags.create!(
        text: sample_text,
        area_num: rand(1..4)    # 1から4の乱数の生成
      )
    end

  end

end