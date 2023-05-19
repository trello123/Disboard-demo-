class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to board_path(@comment.card.board.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to board_path(@comment.card.board.id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to board_path(@comment.card.board.id)
  end

  private
    def comment_params
    params.require(:comment).permit(:intro).merge(user: current_user, card_id: params[:card_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
end
