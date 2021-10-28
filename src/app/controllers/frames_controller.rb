class FramesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @frame = Frame.new
    @frame_statement_count = 70 
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
    @frame_statement_count = 70 - @frame.statement.length
    @frame_text_count = 300 - @frame.text.length
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
      flash[:success] = "投稿の作成に失敗しました"
    end
  end

  def show
  end

  def index
    @frames = Frame.all.page(params[:page]).order(created_at: "DESC").per(10)
  end


  private
    def frame_params
      params.require(:frame).permit(:statement, :text)
      # params.require(:frame).permit(:statement, :text, :user_id)
    end
end
