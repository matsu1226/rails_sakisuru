class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
          :recoverable, :rememberable, :validatable, :trackable
end
