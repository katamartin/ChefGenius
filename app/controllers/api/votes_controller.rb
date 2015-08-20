class Api::VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      render json: @vote
    else
      render json: @vote.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @vote = current_user.votes.find_by(
      votable_id: params[:votable_id],
      votable_type: params[:votable_type]
    )
    if @vote.update(value: params[:value])
      render json: @vote
    else
      render json: @vote.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @vote = current_user.votes.find(params[:id])
    @vote.destroy
    render json: @vote
  end

  private
  def vote_params
    params.require(:vote).permit(:votable_id, :votable_type, :value)
  end
end
