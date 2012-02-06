class CreateFavorites < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.references :music_video, :user
      t.timestamps
    end
    add_index "favorites", "music_video_id"
    add_index "favorites", "user_id"
  end

  def down
    drop_table :favorites
  end
end
