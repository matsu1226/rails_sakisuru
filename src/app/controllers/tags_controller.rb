class TagsController < ApplicationController

  def index
    @frame = Frame.find_by(id: params[:frame_id])
    @tags = Tag.joins(:frame).where(frames: { user_id: current_user.id })
    # binding.pry
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
        format.html { redirect_to frame_tags_path, notice: '項目が追加されました' }
        format.js { @status = "success" }
      else
        format.html { redirect_to frame_tags_path, notice: '項目は入力エラーにより追加されませんでした' }
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
        format.html { redirect_to frame_tags_path, notice: '項目が編集されました' }
        format.js { @status = "success" }
      else
        format.html { redirect_to frame_tags_path, notice: '項目は入力エラーにより編集されませんでした' }
        format.js { @status = "fail" }
      end
    end
  end


  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tags = Tag.joins(:frame).where(frames: { user_id: current_user.id })
    respond_to do |format|
      if @tag.destroy
        format.html { redirect_to frame_tags_path, notice: '項目は削除されました' }
        format.js { @status = "success" }
      else
        format.html { redirect_to frame_tags_path, notice: '項目は削除されませんでした' }
        format.js { @status = "fail" }
      end
    end
  end


  private
    def tag_params
      # params.require(:tag).permit(:text, :privated)
      params.require(:tag).permit(:text, :privated, :frame_id, :area_num)
    end

end
