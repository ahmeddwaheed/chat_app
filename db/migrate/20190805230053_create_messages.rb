class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.text :body
      t.integer :number, default: 0
      t.timestamps
      t.index [:number, :chat_id], unique: true
    end
  end
end
