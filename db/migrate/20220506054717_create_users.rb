class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :image_url, null: false
      t.timestamps
      t.index [:provider, :uid], unique: true
    end
  end
end
