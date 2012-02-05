# -*- encoding : utf-8 -*-
class CreateSources < ActiveRecord::Migration
  def up
    create_table :sources do |t|
      t.string   "name"
      t.string   "url"
      t.string   "kind"
      t.text     "feeds"
      t.string   "rdio_url"
      t.string   "spotify_url"
      t.string   "youtube_url"
      t.integer  "popularity"
      t.timestamps
    end
    add_index :sources, :name, :unique => true
    add_index :sources, :url, :unique => true
  end

  def down
    drop_table :sources
  end
end
