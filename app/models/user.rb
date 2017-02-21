class User < ApplicationRecord
  attr_accessor :user_id

  has_many :categories
  has_many :spendings, -> { order(created_at: :desc) }

  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :lockable

  def set_default_role
    self.role ||= :user
  end
end
