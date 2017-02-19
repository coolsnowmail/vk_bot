class CreateSuperUsers < ActiveRecord::Migration
  def change
    create_table :super_users do |t|
      t.string :login
      t.string :password_digest
      t.string :vk_id

      t.timestamps null: false
    end
  end
end
