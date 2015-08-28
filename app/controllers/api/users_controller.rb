class Api::UsersController < ApplicationController
  before_action :redirect_unless_logged_in

  def show
    @user = User.
      includes(
        :recipes,
        annotations: [recipe: [:author]],
        comments: [commentable: [:recipe, :author]]
      ).
      find(params[:id])
    render :show
  end
end
