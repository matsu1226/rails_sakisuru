class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
          :recoverable, :rememberable, :validatable, :trackable
  # validatable https://github.com/heartcombo/devise/blob/master/lib/devise/models/validatable.rb

  has_many :frames

  validates :name, presence: true, length: {maximum: 12}
  validates :birthday, presence: true
  validate :birthday_check

  def birthday_check
    # ":birthday, presence: true" は別に設定
    if self.birthday
      errors.add(:birthday, "正しく生年月日を記入してください") if self.birthday < Date.new(1920, 1, 1)
      errors.add(:birthday, "正しく生年月日を記入してください") if self.birthday > Date.today 
    end
  end


end
