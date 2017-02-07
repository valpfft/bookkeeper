class CreateSpendings < ActiveRecord::Migration[5.0]
  def change
    create_table :spendings do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, default: 0.0

      t.references :category, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
