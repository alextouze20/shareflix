class PlatformAccounts::BuildController < ApplicationController
  include Wicked::Wizard

  steps :subscription, :seats

  def show
    @platform_account = PlatformAccount.find(params[:platform_account_id])
    render_wizard
  end

  def update
    @platform_account = PlatformAccount.find(params[:platform_account_id])
    @platform_account.update_attributes(strong_account)
    render_wizard @platform_account
  end

  def create
    @platform = Platform.find(params[:platform_id])
    @platform_account = PlatformAccount.new
    @platform_account.platform = @platform
    @platform_account.user = current_user
    @platform_account.save
    redirect_to wizard_path(steps.first, platform_account_id: @platform_account.id)
  end

  private

  def strong_account
    params.require(:platform_account).permit(:user, :seats_available, :seats_total, :family_account?, :platform)
  end
end
