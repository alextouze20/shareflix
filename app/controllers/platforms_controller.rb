class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit]
  def index
    @platforms = policy_scope(Platform)
  end

  def show
    @platform = Platform.find(params[:id])
    @accounts = @platform.platform_account
  end

  def edit
  end

  def update
    platform = Platform.new(strong_platform)
    platform.id = params[:id]
    platform.save
  end

  def new
    @platform = Platform.new
  end

  def create
    Platform.create(set_platform)
  end

  def construct
    skip_authorization
    @platforms = Platform.all
  end

  private

  def set_platform
    @platform = Platform.find(params[:id])
  end

  def strong_platform
    params.require(:platform).permit(:category, :name)
  end
end
