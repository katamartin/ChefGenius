class Api::UsersController < ApplicationController
  def show
    @user = User.
      includes(
        :recipes,
        annotations: [recipe: [:author]],
        comments: [:commentable, :author]
      ).
      find(params[:id])
    render :show
  end
end
