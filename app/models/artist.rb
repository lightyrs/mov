class Artist < ActiveRecord::Base

  has_and_belongs_to_many :music_videos

  validates :name, :uniqueness => true
  validates :echonest_id, :uniqueness => true
end