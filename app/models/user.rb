class User < ActiveRecord::Base

  has_many :identities, :dependent => :destroy

  has_many :favorites
  has_many :music_videos, :through => :favorites
end