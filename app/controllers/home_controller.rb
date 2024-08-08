class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    render "layouts/landing_page"
  end

end
