class PlatformAccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit]

  def show
    @account = PlatformAccount.find(params[:id])
    @account_seat = AccountSeat.new
    authorize @account
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
    params.require(:platform_account).permit(:user, :seats_available, :family_account?, :platform)
  end
end
