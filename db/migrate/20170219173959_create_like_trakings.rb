class CreateLikeTrakings < ActiveRecord::Migration
  def change
    create_table :like_trakings do |t|
      t.belongs_to :bot, index: true
      t.string :vk_user_id
      t.integer :offset
      t.string :vk_group_id

      t.timestamps null: false
    end
  end
end
