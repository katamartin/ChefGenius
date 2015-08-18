class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: :destroy

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:email],
                                     user_params[:password])
    if @user
      log_in_user!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid credentials."]
      render :new
    end
  end

  def destroy
    log_out_user!
    render json: current_user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
