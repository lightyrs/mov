# -*- encoding : utf-8 -*-

class Identity < ActiveRecord::Base

  belongs_to :user

  validates :provider, :presence => true
  validates :uid, :uniqueness => { :scope => :provider }, :presence => true

  serialize :presence_urls

  attr_accessor :auth


  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    @identity = Identity.new(auth: auth, uid: auth['uid'], provider: auth['provider'])
    if @identity.set_provider_data!
      @identity.save
      @identity
    else
      @identity.destroy
      false
    end
  end

  def set_provider_data!
    if auth['provider'] == "facebook"
      facebook
    elsif auth['provider'] == "twitter"
      twitter
    elsif auth['provider'] == "google_oauth2"
      google
    else
      false
    end
  end

  def facebook
    self.email = auth['info']['email'] rescue nil
    self.handle = auth['info']['nickname'] rescue nil
    self.avatar = auth['info']['image'] rescue nil
    self.profile_url = auth['extra']['raw_info']['link'] rescue nil
    self.presence_urls = auth['info']['urls']['Website'].split(/\s\S+\s|\\\S|\s/m).reject(&:blank?) rescue nil
    self.location = auth['info']['location'] rescue nil
    self.bio = auth['info']['description'] rescue nil
  end

  def twitter
    self.handle = auth['info']['nickname'] rescue nil
    self.avatar = auth['info']['image'] rescue nil
    self.profile_url = auth['info']['urls']['Twitter'] rescue nil
    self.presence_urls = auth['info']['urls']['Website'].split(/\s\S+\s|\\\S|\s/m).reject(&:blank?) rescue nil
    self.location = auth['info']['location'] rescue nil
    self.bio = auth['info']['description'] rescue nil
  end

  def google
    self.email = auth['info']['email'] rescue nil
    self.avatar = auth['info']['image'] rescue nil
    self.profile_url = auth['extra']['raw_info']['link'] rescue nil
    google_plus
  end

  def google_plus
    profile = Curl::Easy.perform("https://www.googleapis.com/plus/v1/people/me?access_token=#{auth['credentials']['token']}")
    profile = JSON.parse(profile.body_str)

    self.bio = profile['aboutMe'] rescue nil

    self.presence_urls = profile['urls'].reject do |url|
      url.has_key? "type"
    end.map do |url|
      url["value"]
    end rescue nil

    self.location = profile['placesLived'].select do |place|
      place.has_key?("primary") && place["primary"].to_s == "true"
    end.first["value"] rescue nil

  rescue StandardError => ex
    logger.error ex.message
    nil
  end
end