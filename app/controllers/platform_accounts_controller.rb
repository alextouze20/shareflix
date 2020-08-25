class PlatformAccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit]
  def show
  end

  def new
    @platform_account = PlatformAccount.new
  end

  def create
    PlatformAccount.create
  end

  def edit
  end

  def update
    platform = PlatformAccount.new(strong_account)
    platform.id = params[:id]
    platform.save
  end

  def destroy
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
