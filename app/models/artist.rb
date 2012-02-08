# -*- encoding : utf-8 -*-
class Artist < ActiveRecord::Base

  has_and_belongs_to_many :music_videos

  validates :name, :uniqueness => true, :presence => true
  validates :echonest_id, :uniqueness => true

  acts_as_followable
end
