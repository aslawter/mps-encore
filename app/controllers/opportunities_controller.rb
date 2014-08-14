class OpportunitiesController < ApplicationController
  def new
    @opportunity = Opportunity.new
    @performance = Performance.find(params[:performance_id])
    @solicitations = Solicitation.all
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @opportunity = current_user.opportunities.new(opportunity_params.merge(performance: @performance))
    @opportunity.updated_by_id = current_user.id

    if @opportunity.save
      redirect_to @performance
    else
      @solicitations = Solicitation.all
      render :new
    end
  end

  private

  def opportunity_params
    params.require(:opportunity).
      permit(
        :solicitation_id
      )
  end
end
