class AddUserRefToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :user, index: true, foreign_key: true
  end
end
