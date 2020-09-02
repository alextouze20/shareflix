class PlatformAccounts::BuildController < ApplicationController
  include Wicked::Wizard

  steps *PlatformAccount.form_steps

  def show
    skip_authorization
    @platform_account = PlatformAccount.find(params[:platform_account_id])
    @step = step
    render_wizard
  end

  def update
    @platform_account = PlatformAccount.find(params[:platform_account_id])
    authorize(@platform_account)
    @platform_account.update_attributes(strong_account(step))
    render_wizard @platform_account
  end

  def create
    skip_authorization
    @platform = Platform.find(params[:platform_id])
    @platform_account = PlatformAccount.new
    @platform_account.platform = @platform
    @platform_account.user = current_user
    @platform_account.save(validate: false)
    redirect_to platform_account_build_path(@platform_account, PlatformAccount.form_steps.first)
  end

  def finish_wizard_path
    @platform_account = PlatformAccount.find(params[:platform_account_id])
    chatroom = Chatroom.new(platform_account: @platform_account)
    chatroom.save
    ChatroomUser.create(chatroom: chatroom, admin: true, user: current_user)
    profile_path(current_user, tab: "accounts")
  end

  private

  def strong_account(step)
    permitted_attributes = case step
                           when "subscription"
                             [:account_type]
                           when "seats"
                             [:seats_total, :seats_available]
                           end

    params.require(:platform_account).permit(permitted_attributes).merge(form_step: step)
  end
end
