class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.string :description
      t.string :ligin_vk
      t.string :password_vk
      t.string :access_token

      t.timestamps null: false
    end
  end
end
