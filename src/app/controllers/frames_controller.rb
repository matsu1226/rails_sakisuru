class FramesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @frame = Frame.new
    last_frame = Frame.where(user_id: current_user.id).last
    @statement = last_frame.statement
    @frame_statement_count = 70 - @statement.length
    @frame_text_count = 300
  end


  def create
    @frame = current_user.frames.build(frame_params)
    if @frame.save
      redirect_to frame_tags_path(frame_id: @frame.id)
    else
      render "frames/new"
    end
  end


  def edit
    @frame = Frame.find_by(id: params[:id])
    @statement = @frame.statement
    @text = @frame.text
    @frame_statement_count = 70 - @statement.length
    @frame_text_count = 300 - @text.length
  end

  def update
    @frame = Frame.find_by(id: params[:id])
    if @frame.update(frame_params)
      redirect_to frame_tags_path(frame_id: @frame.id)
    else
      render "frames/edit"
    end
  end

  def destroy
    @frame = Frame.find_by(id: params[:id])
    @frame.destroy
    redirect_to user_path(current_user)
    flash[:success] = "投稿を削除しました"
  end

  def release
    @frame = Frame.find_by(id: params[:frame_id])
    if @frame && @frame.update(is_draft: false)
      flash[:success] = "投稿しました"
      redirect_to user_path(current_user)
    else
      render "tags/index"
      flash[:warning] = "投稿の作成に失敗しました"
    end
  end

  def show
  end

  def index
    @frames = Frame.all.page(params[:page]).order(created_at: "DESC").per(10)
  end

  def new_review
    @frame = Frame.find_by(id: params[:frame_id])
    @frame_review_count = 300 - @frame.review.length
    @tags = Tag.where(frame_id: @frame.id)
    created_date = Date.new(@frame.created_at.year, @frame.created_at.month, @frame.created_at.day)
    @term = (Date.today - created_date).to_i
  end

  def create_review
    @frame = Frame.find_by(id: params[:frame_id])
    @frame.reviewed_at = Time.zone.now
    if @frame.update(frame_params_only_review)
      flash[:success] = "reviewを更新しました"
      redirect_to user_path(current_user)
    else
      render "frames/new_review"
      flash[:warning] = "reviewの更新に失敗しました"
    end

  end


  private
    def frame_params
      params.require(:frame).permit(:statement, :text)
    end
    def frame_params_only_review
      params.require(:frame).permit(:review, :reviewed_at)
    end
end
