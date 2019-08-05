class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.integer :number, default: 0
      t.integer :messages_count, default: 0
      t.timestamps
    end
  end
end
