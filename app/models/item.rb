class Item < ApplicationRecord


  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  validates :name, presence: true 
  validates :profile, presence: true, unless: :was_attached?
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_id, presence: true
  validates :region_id, presence: true
  validates :time_count_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  # validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
