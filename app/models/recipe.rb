class Recipe < ActiveRecord::Base
  validates :name,        presence: true, length: { maximum: 255 }
  validates :body,        presence: true
  validates :ingredients, presence: true
  validates :category_id, presence: true
  validates :user_id,     presence: true
  belongs_to :category
  belongs_to :user
end
