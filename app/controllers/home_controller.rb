class HomeController < ApplicationController
  def index

   if user_signed_in?
     	redirect_to myalbums_path
     else
  	    redirect_to user_session_path
     end

  end
end
 