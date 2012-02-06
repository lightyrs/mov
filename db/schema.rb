# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120206043956) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "echonest_id"
    t.string   "rdio_url"
    t.string   "spotify_url"
    t.string   "youtube_url"
    t.text     "images"
    t.text     "biographies"
    t.float    "popularity"
    t.float    "familiarity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "artists", ["echonest_id"], :name => "index_artists_on_echonest_id", :unique => true
  add_index "artists", ["name"], :name => "index_artists_on_name", :unique => true

  create_table "artists_music_videos", :id => false, :force => true do |t|
    t.integer "artist_id"
    t.integer "music_video_id"
  end

  add_index "artists_music_videos", ["artist_id"], :name => "index_artists_music_videos_on_artist_id"
  add_index "artists_music_videos", ["music_video_id"], :name => "index_artists_music_videos_on_music_video_id"

  create_table "favorites", :force => true do |t|
    t.integer  "music_video_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "favorites", ["music_video_id"], :name => "index_favorites_on_music_video_id"
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "identities", :force => true do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "email"
    t.string   "handle"
    t.string   "avatar"
    t.string   "profile_url"
    t.string   "presence_url"
    t.text     "bio"
    t.string   "hometown"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "identities", ["uid", "provider"], :name => "index_identities_on_uid_and_provider", :unique => true
  add_index "identities", ["user_id"], :name => "index_identities_on_user_id"

  create_table "mentions", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "content"
    t.integer  "source_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mentions", ["source_id"], :name => "index_mentions_on_source_id"
  add_index "mentions", ["url"], :name => "index_mentions_on_url", :unique => true

  create_table "music_videos", :force => true do |t|
    t.string   "video_id"
    t.string   "provider"
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.text     "keywords"
    t.integer  "duration"
    t.string   "thumbnail_small"
    t.string   "thumbnail_large"
    t.integer  "popularity"
    t.datetime "uploaded_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "music_videos", ["url"], :name => "index_music_videos_on_url", :unique => true
  add_index "music_videos", ["video_id"], :name => "index_music_videos_on_video_id", :unique => true

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "kind"
    t.text     "feeds"
    t.string   "rdio_url"
    t.string   "spotify_url"
    t.string   "youtube_url"
    t.integer  "popularity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sources", ["name"], :name => "index_sources_on_name", :unique => true
  add_index "sources", ["url"], :name => "index_sources_on_url", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "logged_in_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
