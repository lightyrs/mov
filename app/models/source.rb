# -*- encoding : utf-8 -*-
class Source < ActiveRecord::Base

  has_many :mentions, :dependent => :destroy

  validates :url, :uniqueness => true, :presence => true
  validates :name, :uniqueness => true, :presence => true

  acts_as_followable
end
