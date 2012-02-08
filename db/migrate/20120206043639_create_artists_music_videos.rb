# -*- encoding : utf-8 -*-
class CreateArtistsMusicVideos < ActiveRecord::Migration
  def up
    create_table :artists_music_videos, :id => false do |t|
      t.references :artist, :music_video
    end
    add_index "artists_music_videos", "artist_id"
    add_index "artists_music_videos", "music_video_id"
  end

  def down
    drop_table :artists_music_videos
  end
end
