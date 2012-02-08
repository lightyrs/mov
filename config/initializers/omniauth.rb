# -*- encoding : utf-8 -*-
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :scope => 'email, user_hometown, user_likes, user_actions.music, user_actions:music_on_video, publish_actions', :display => 'page'
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV['YOUTUBE_KEY'], ENV['YOUTUBE_SECRET'], { access_type: 'online', approval_prompt: '' }
  provider :vimeo, ENV['VIMEO_KEY'], ENV['VIMEO_SECRET']
end
