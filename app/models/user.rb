class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# バリデーションの設定
validates :user_name, presence: true
validates :profile, presence: true
validates :occupation, presence: true
validates :position, presence: true

end
