class FramesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @frame = Frame.new
  end

  def create

  end

  def edit
  end

  def show
  end

  def index
  end
end
