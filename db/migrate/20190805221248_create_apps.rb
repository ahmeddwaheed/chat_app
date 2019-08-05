class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :token, null: :false
      t.string :name
      t.integer :chats_count, default: 0
      t.timestamps
    end
  end
end
