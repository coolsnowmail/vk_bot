class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.belongs_to :task, index: true
      t.string :description
      t.string :login_vk
      t.string :password_vk
      t.string :access_token
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
