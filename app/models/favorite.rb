# -*- encoding : utf-8 -*-
class Favorite < ActiveRecord::Base

  belongs_to :music_video
  belongs_to :user
end
