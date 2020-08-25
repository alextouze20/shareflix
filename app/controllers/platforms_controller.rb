class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit]
  def index
    @platforms = Platform.all
    authorize @platform
  end

  def show
    authorize @platform
  end

  def edit
    authorize @platform
  end

  def update
    platform = Platform.new(strong_platform)
    platform.id = params[:id]
    authorize platform
    platform.save
  end

  def new
    @platform = Platform.new
    authorize @platform
  end

  def create
    platform = Platform.new(set_platform)
    authorize platform
    platform.save
  end

  private

  def set_platform
    @platform = Platform.find(params[:id])
  end

  def strong_platform
    params.require(:platform).permit(:category, :name)
  end
end
