class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    render "layouts/landing_page"
  end

  def contact
    render "layouts/contact_page"
  end

end
