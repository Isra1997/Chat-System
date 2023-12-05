class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :message_number
      t.references :chat
      t.text :message
      t.timestamps
    end
  end
end
