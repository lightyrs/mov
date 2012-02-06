class MusicVideo < ActiveRecord::Base

  validates :url, :uniqueness => true
  validates :video_id, :uniqueness => true
end