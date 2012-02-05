# -*- encoding : utf-8 -*-
class CreateMusicVideos < ActiveRecord::Migration
  def up
    create_table :music_videos do |t|
      t.string      "video_id"
      t.string      "provider"
      t.string      "url"
      t.string      "title"
      t.text        "description"
      t.text        "keywords"
      t.integer     "duration"
      t.string      "thumbnail_small"
      t.string      "thumbnail_large"
      t.integer     "popularity"
      t.datetime    "uploaded_at"
      t.timestamps
    end
    add_index :music_videos, :video_id, :unique => true
    add_index :music_videos, :url, :unique => true
  end

  def down
    drop_table :music_videos
  end
end
