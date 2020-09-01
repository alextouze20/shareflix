class ReportsController < ApplicationController
  def index
    @reports = policy_scope(Report)
  end
  def new
    @report = Report.new()
    @user = User.find(params[:profile_id])
    authorize @report
  end

  def create
    @report = Report.new(strong_report)
    @report.reporter = User.find(current_user.id)
    @report.reported = User.find(params[:profile_id])
    authorize @report
    if @report.save
      redirect_to profile_path(params[:profile_id])
    else
      redirect_to profile_path(
        params[:profile_id],
        commit: "Create Report",
        report: {
          content: params[:report][:content],
          reason: params[:report][:reason]
        }
      )
    end
  end

  private

  def strong_report
    params.require(:report).permit(:content, :reason)
  end
end
