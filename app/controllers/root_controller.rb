class RootController < ApplicationController
  before_action :redirect_unless_logged_in

  def root
    render :root
  end
end
