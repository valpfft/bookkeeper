class Category < ApplicationRecord
  belongs_to :users, optional: true
  validates :name, :user_id, presence: true
  validates :name, uniqueness: { case_sensitive: false, scope: :user_id }
end
