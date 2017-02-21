class Spending < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :amount, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true
  validates :name, presence: true

  delegate :name, to: :category, prefix: true
  delegate :name, to: :user, prefix: true
end
