class UsersController < ApplicationController
  before_action :user_setting
  before_action :correct_user? , only: [:edit, :update]

  def show
    @image = @user.image
    @frames = Frame.where(user_id: @user.id).order(created_at: "DESC")
  end

  def edit
    @image = @user.image
    @user_profile_count = 140
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private
    def user_setting
      @user = User.find_by(id: params[:id])
    end

    def correct_user?
      unless current_user == @user 
        redirect_to frames_path  
        flash[:warning] = "自分自身以外のユーザーの編集はできません"
      end
    end

    def user_params
      params.require(:user).permit(:name, :birthday, :profile, :image)
    end
end
