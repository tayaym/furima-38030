class Item < ApplicationRecord

  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
  validates :profile, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :state_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_id, presence: true, numericality: { other_than: 1 }
  validates :region_id, presence: true, numericality: { other_than: 1 }
  validates :time_count_id, presence: true, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery
  belongs_to :region
  belongs_to :time_count
end
