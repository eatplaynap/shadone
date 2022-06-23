class AddProviderUidImageUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :image_url, null: false
    end

    add_index :users, %i[provider uid], unique: true
  end
end
