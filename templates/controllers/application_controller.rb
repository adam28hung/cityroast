class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_page_info #,:set_locale

  protected

    def after_sign_in_path_for(current_administrator)
      administration_authenticated_administrator_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    end

  private

  # def set_locale
  #   if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
  #     session[:locale] = params[:locale]
  #   end
  #   I18n.locale = session[:locale] || I18n.default_locale
  # end

  def set_page_info
    set_meta_tags site: ENV['site_name'],
    description: 'DESC DESC DESC DESC DESC DESC',
    keywords: 'KW KW KW KW KW KW',
    # icon: [ {href: '/favicon.png', type: 'image/png'}],
    og: {
      type: "website",
      url:  "Put your own URL to the object here",
      title: "Sample Website",
      image: "https://s-static.ak.fbcdn.net/images/devsite/attachment_blank.png"
    }
  end

end
