class AccountSeatsController < ApplicationController
  def create
    skip_authorization
    @account_seat = AccountSeat.new(strong_seat)
    # @account = PlatformAccount.find(params[:account_seat][:platform_account_id])
    # @account_seat.platform_account = @account
    # @account_seat.user = current_user
    if @account_seat.save
      redirect_to profile_path(current_user, tab: "requests")
    else
      @account = @account_seat.platform_account
      render 'platform_accounts/show'
    end
  end

  def update
    skip_authorization
    @account_seat = AccountSeat.find(params[:id])
    strong_seat[:id] = params[:id]

    if @account_seat.update(strong_seat)
      # redirect_to profile_path(@account_seat.platform_account.user.id)
      # flash[:notice] = "request accepted"

    else
      @review = Review.new
      @user = @account_seat.platform_account.user
      @reviews = Review.where(account_tenant_id: @user)
      @requests = AccountSeat.where(platform_account: @user.platform_accounts)
      render 'profiles/show'
    end
    if @account_seat.status == "accepted"
      ChatroomUser.create(user: @account_seat.user, chatroom: @account_seat.platform_account.chatroom, admin: false)
    end
  end

  private

  def strong_seat
    params.require(:account_seat).permit(:platform_account_id, :user_id, :status)
  end
end
