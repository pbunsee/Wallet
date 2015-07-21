class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  before_action :set_locale
 
  # def set_locale
    # I18n.locale = params[:locale] || I18n.default_locale
  # end

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

end
