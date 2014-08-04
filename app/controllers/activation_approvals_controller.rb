class ActivationApprovalsController< ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.update(active: true)
    redirect_to :dashboard
  end
end
