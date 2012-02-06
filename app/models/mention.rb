class Mention < ActiveRecord::Base

  belongs_to :source

  validates :url, :uniqueness => true
end