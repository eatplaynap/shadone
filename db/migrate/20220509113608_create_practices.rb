class CreatePractices < ActiveRecord::Migration[6.1]
  def change
    create_table :practices do |t|
      t.references :user, foreign_key: true
      t.string :url, null: false
      t.integer :duration, null: false
      t.text :memo
      t.date :practice_on, null: false
      t.timestamps
    end
    add_index :practices, [:user_id, :practice_on], unique: true
  end
end
