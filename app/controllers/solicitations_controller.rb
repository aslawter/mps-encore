class SolicitationsController < ApplicationController
  def new
    @solicitation = Solicitation.new
    @customers = Customer.all
    @partners = Partner.all
  end

  def create
    @solicitation = Solicitation.find(params[:id])
    @solicitation = current_user.solicitations.new(solicitation_params)
  end

  private

  def solicitation_params
    params.require(:solicitation).
      permit(
        :title,
        :description,
        :office,
        :solicitation_number,
        :deadline,
        :prime_contractor,
        :submitted,
        :won,
        :customer_id,
        :partner_id,
      )
  end
end
