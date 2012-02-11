class IdentityLoginWorker
  include Sidekiq::Worker

  def perform(id, datetime)
    Identity.refresh_logged_in_at(id, datetime)
  end
end