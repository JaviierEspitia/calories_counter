class CreateCalories < ActiveRecord::Migration[6.1]
  def change
    create_table :calories do |t|
      t.date :day
      t.integer :quantity_calories
      t.string :type
      t.string :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
