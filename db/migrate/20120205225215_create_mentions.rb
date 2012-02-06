# -*- encoding : utf-8 -*-
class CreateMentions < ActiveRecord::Migration
  def up
    create_table :mentions do |t|
      t.string   "url"
      t.string   "title"
      t.text     "content"
      t.integer  "source_id"
      t.timestamps
    end
    add_index :mentions, :url, :unique => true
    add_index :mentions, :source_id
  end

  def down
    drop_table :mentions
  end
end
