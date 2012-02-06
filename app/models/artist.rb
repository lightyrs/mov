class Artist < ActiveRecord::Base

  validates :name, :uniqueness => true
  validates :echonest_id, :uniqueness => true
end