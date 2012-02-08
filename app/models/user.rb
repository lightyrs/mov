# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

  has_many :identities, :dependent => :destroy

  has_many :favorites
  has_many :music_videos, :through => :favorites

  validates :name, :presence => true

  acts_as_followable


  def self.create_with_omniauth(info)
    create(name: info['name'])
  end
end
