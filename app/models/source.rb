class Source < ActiveRecord::Base

  has_many :mentions, :dependent => :destroy

  validates :url, :uniqueness => true
  validates :name, :uniqueness => true
end