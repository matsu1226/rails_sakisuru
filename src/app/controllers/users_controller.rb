class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @frames = Frame.where(user_id: @user.id).order(created_at: "DESC")
  end
end
