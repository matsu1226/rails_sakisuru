class TagsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @frame = Frame.find_by(id: params[:frame_id])
    @tags = Tag.joins(:frame).where(frames: { user_id: current_user.id })
  end


  def new
    @frame = Frame.find_by(id: params[:frame_id])
    @tag = Tag.new
    @area_num_params = params[:area_num]
  end


  def create
    @frame = Frame.find_by(id: params[:frame_id])
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to frame_tags_path(@frame.id), notice: 'ToDoが追加されました' }
        format.js { @status = "success" }
      else
        format.html { redirect_to frame_tags_path(@frame.id), notice: 'ToDoは入力エラーにより追加されませんでした' }
        format.js { @status = "fail" }
      end
    end

  end

  
  def edit
    @tag = Tag.find_by(id: params[:id])
    @frame = Frame.find_by(id: params[:frame_id])
    @area_num_params = params[:area_num]
  end


  def update
    @frame = Frame.find_by(id: params[:frame_id])
    @tags = Tag.joins(:frame).where(frames: { user_id: current_user.id })
    @tag = Tag.find_by(id: params[:id])
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to frame_tags_path(@frame.id), notice: 'ToDoが編集されました' }
        format.js { @status = "success" }
      else
        format.html { redirect_to frame_tags_path(@frame.id), notice: 'ToDoは入力エラーにより編集されませんでした' }
        format.js { @status = "fail" }
      end
    end
  end


  def destroy
    @frame = Frame.find_by(id: params[:frame_id])
    @tag = Tag.find_by(id: params[:id])
    @tags = Tag.joins(:frame).where(frames: { user_id: current_user.id })
    respond_to do |format|
      if @tag.destroy
        format.html { redirect_to frame_tags_path(@frame.id), notice: 'ToDoは削除されました' }
        format.js { @status = "success" }
      else
        format.html { redirect_to frame_tags_path(@frame.id), notice: 'ToDoは削除されませんでした' }
        format.js { @status = "fail" }
      end
    end
  end

  def drag_and_drop
    @frame = Frame.find_by(id: params[:frame_id])
    @tag = Tag.find_by(id: params[:id])
    @before_area_num = @tag.area_num    # 更新後に area_numを比較できる(@before_area_num => @tag.area_num)

    @tag.update(area_num: params[:area_num])
    @tags = Tag.joins(:frame).where(frames: { user_id: current_user.id })
    render formats: :js
  end


  private
    def tag_params
      # params.require(:tag).permit(:text, :privated)
      params.require(:tag).permit(:text, :privated, :frame_id, :area_num)
    end

end
