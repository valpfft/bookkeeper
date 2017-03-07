class User < ApplicationRecord
  attr_accessor :user_id

  has_many :categories
  has_many :spendings, -> { order(created_at: :desc) }

  enum role: [:user, :admin]
  after_create :default_categories

  after_initialize :set_default_role, if: :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :lockable

  def set_default_role
    self.role ||= :user
  end

  def default_categories
    ["Bank Charges", "Clothing", "Education",
     "Events", "Food", "Gifts", "Healthcare",
     "Household", "Job", "Hobbies", "Vacation"].each do |name|
      categories.create(name: name)
    end
  end
end
