class AuthenticateUserController <ApplicationController
   before_filter :authenticate_user!
end