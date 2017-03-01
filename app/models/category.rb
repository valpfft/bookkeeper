class Category < ApplicationRecord
  belongs_to :user
  has_many :spendings, -> { order(created_at: :desc) }
  validates :name, :user, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :user }
end
