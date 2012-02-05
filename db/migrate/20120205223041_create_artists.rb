# -*- encoding : utf-8 -*-
class CreateArtists < ActiveRecord::Migration
  def up
    create_table :artists do |t|
      t.string   "name"
      t.string   "echonest_id"
      t.string   "rdio_url"
      t.string   "spotify_url"
      t.string   "youtube_url"
      t.text     "images"
      t.text     "biographies"
      t.float    "popularity"
      t.float    "familiarity"
      t.timestamps
    end
    add_index :artists, :name, :unique => true
    add_index :artists, :echonest_id, :unique => true
  end

  def down
    drop_table :artists
  end
end
