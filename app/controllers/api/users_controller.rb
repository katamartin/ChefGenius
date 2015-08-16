class Api::UsersController < ApplicationController
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
