class CreateMessageTrakings < ActiveRecord::Migration
  def change
    create_table :message_trakings do |t|
      t.string :vk_user_id
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
