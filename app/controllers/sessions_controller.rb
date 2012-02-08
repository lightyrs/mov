class SessionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    auth = request.env['omniauth.auth']
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end

    if signed_in?
      if @identity.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it
        # is the current user. So the identity is already associated with
        # this user. So let's display an error message.
        redirect_to root_url, notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets
        # associate the identity
        @identity.user = current_user
        @identity.save()
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        # The identity we found had a user associated with it so let's
        # just log them in here
        self.current_user = @identity.user
      else
        @user = User.new(:name => auth["info"]["name"])
        @user.save()

        self.current_user = @user

        @identity.user = current_user
        @identity.save()
      end
      redirect_to root_url, notice: "Logged in!"
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Logged out!"
  end
end