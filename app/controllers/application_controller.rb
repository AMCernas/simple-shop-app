class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_cart

    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(id: session[:cart_id])
        if cart
          return cart
        else
          session[:cart_id] = nil
        end
      end
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit(:email, :password, :password_confirmation, :admin)
        end
    end
end
