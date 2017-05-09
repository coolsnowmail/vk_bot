class CreateCommentTrakings < ActiveRecord::Migration
  def change
    create_table :comment_trakings do |t|
      t.belongs_to :bot, index: true
      t.integer :comment_id
      t.integer :bot_id
      t.belongs_to :task, index: true

      t.timestamps null: false
    end
  end
end
