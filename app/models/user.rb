class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: new_record?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_default_role
    self.role ||= :user
  end
end
