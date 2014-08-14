class OpportunitiesController < ApplicationController
  def new
    @opportunity = Opportunity.new
    @performances = Performance.all
    @solicitation = Solicitation.find(params[:id])
  end
end
