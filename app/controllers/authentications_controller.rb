class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    auth = request.env['omniauth.auth']
    current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
    redirect_to authentications_url
  end

  def destroy
  end

end
