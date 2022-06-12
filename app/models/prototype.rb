class Prototype < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # 空の投稿を保存できないようにする
  validates :title, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
end
