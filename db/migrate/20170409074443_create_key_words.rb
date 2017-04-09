class CreateKeyWords < ActiveRecord::Migration
  def change
    create_table :key_words do |t|
      t.belongs_to :message_group, index: true
      t.string :word

      t.timestamps null: false
    end
  end
end
