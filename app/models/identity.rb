# -*- encoding : utf-8 -*-
class Identity < ActiveRecord::Base

  belongs_to :user

  validates :provider, :presence => true
  validates :uid, :uniqueness => { :scope => :provider }, :presence => true


  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    Identity.create(uid: auth['uid'], provider: auth['provider'])
  end
end
