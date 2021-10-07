class TagsController < ApplicationController

  def new
    @tag = Tag.new
    @frame = Frame.find_by(id: params[:frame])
  end


  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_edit_frame_path, notice: '項目が追加されました' }
        format.js { @status = "success" }
      else
        format.html { redirect_to tags_edit_frame_path(params[:tag][:frame_id]), notice: '項目は入力エラーにより追加されませんでした' }
        format.js { @status = "fail" }
      end
    end

  end

  
  def edit
  end
  
  def index
  end


  private
    def tag_params
      # params.require(:tag).permit(:text, :privated)
      params.require(:tag).permit(:text, :privated, :frame_id, :area_num)
    end

end
