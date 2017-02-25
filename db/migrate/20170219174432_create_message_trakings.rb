class CreateMessageTrakings < ActiveRecord::Migration
  def change
    create_table :message_trakings do |t|
      t.belongs_to :bot, index: true
      t.string :vk_user_id
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
