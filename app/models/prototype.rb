class Prototype < ApplicationRecord
 belongs_to :user
 has_one_attached :image


  # バリデーションの設定 
 validates :title, presence: true
 validates :catch_copy, presence: true
 validates :concept, presence: true
 validates :image, presence: true

#  validates :content, presence: true, unless: :was_attached?

#  def was_attached?
#    self.image.attached?
#  end

end
