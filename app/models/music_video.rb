# -*- encoding : utf-8 -*-
class MusicVideo < ActiveRecord::Base

  has_and_belongs_to_many :artists

  has_many :favorites
  has_many :users, :through => :favorites

  validates :url, :uniqueness => true, :presence => true
  validates :video_id, :uniqueness => true, :presence => true
end
