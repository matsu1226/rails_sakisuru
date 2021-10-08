class FramesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @frame = Frame.new
  end


  def create
    # @frame = Frame.new(frame_params)
    @frame = current_user.frames.build(frame_params)
    if @frame.save
      redirect_to tags_edit_frame_path
    else
      render "frames/new"
    end
  end


  def edit
  end

  def show
  end


  private
    def frame_params
      params.require(:frame).permit(:statement, :text)
      # params.require(:frame).permit(:statement, :text, :user_id)
    end
end
