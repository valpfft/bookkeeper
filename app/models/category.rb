class Category < ApplicationRecord
  belongs_to :user, optional: true
  has_many :transactions, -> { order(created_at: :desc) }
  validates :name, :user_id, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }
end
