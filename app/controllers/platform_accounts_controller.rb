class PlatformAccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :destroy]
  def show
    authorize @platform_account
  end

  def new
    @platform_account = PlatformAccount.new
    authorize @platform_account
  end

  def create
    PlatformAccount.create
  end

  def edit
    authorize @platform_account
  end

  def update
    platform = PlatformAccount.new(strong_account)
    platform.id = params[:id]
    authorize platform_account
    platform.save
  end

  def destroy
    authorize @platform_account
    PlatformAccount.destroy(@platform_account)
  end

  private

  def set_account
    @platform_account = PlatformAccount.find(params[:id])
  end

  def strong_account
    params.require(:platform_account).permit(:user, :seats_available, :seats_total, :family_account?, :platform)
  end
end
