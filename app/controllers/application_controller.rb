class ApplicationController < ActionController::Base
	# it will redirect to the user signed in and not signed in paths
   def redirect_if_not_signed_in
      redirect_to root_path if !user_signed_in?
   end

   def redirect_if_signed_in
     redirect_to root_path if user_signed_in?
   end
end