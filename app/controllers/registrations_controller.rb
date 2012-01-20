class RegistrationsController < Devise::RegistrationsController
  def create
    super
    unless @user.new_record?
      session[:omniauth] = nil
    end
  end

private
  def build_resource (*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end
