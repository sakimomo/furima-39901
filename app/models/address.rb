class Address < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  #belongs_to :purchase

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
