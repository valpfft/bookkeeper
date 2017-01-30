class Category < ApplicationRecord
  belongs_to :users, optional: true
  validates :name, presence: true, uniqueness: true
end
