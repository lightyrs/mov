class MusicVideo < ActiveRecord::Base

  has_and_belongs_to_many :artists

  has_many :favorites
  has_many :users, :through => :favorites

  validates :url, :uniqueness => true
  validates :video_id, :uniqueness => true
end