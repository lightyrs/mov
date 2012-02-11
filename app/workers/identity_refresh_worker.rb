class IdentityRefreshWorker
  include Sidekiq::Worker

  def perform(id, auth)
    Identity.refresh_provider_data(id, auth)
  end
end