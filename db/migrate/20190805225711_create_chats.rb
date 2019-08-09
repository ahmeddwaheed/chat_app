class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :app, foreign_key: true
      t.integer :number, default: 0
      t.integer :messages_count, default: 0
      t.timestamps
      t.index [:number, :app_id], unique: true
    end
  end
end
