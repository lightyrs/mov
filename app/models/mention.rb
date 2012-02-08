# -*- encoding : utf-8 -*-
class Mention < ActiveRecord::Base

  belongs_to :source

  validates :title, :presence => true
  validates :url, :uniqueness => true, :presence => true
end
