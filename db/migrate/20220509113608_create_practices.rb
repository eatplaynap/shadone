class CreatePractices < ActiveRecord::Migration[6.1]
  def change
    create_table :practices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url, null: false
      t.integer :duration, null: false
      t.text :memo
      t.date :practice_on, null: false
      t.timestamps
      t.index [:user_id, :practice_on], unique: true
    end
  end
end
