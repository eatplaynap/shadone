class CreatePractices < ActiveRecord::Migration[6.1]
  def change
    create_table :practices do |t|
      t.references :user, foreign_key: true
      t.integer :practice_id, null: false
      t.string :url, null: false
      t.integer :minutes, null: false
      t.text :memo
      t.date :practice_on
      t.timestamps
    end
    add_index :practices, [:user_id, :practice_on], unique: true
  end
end
