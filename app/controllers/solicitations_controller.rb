class SolicitationsController < ApplicationController
  def new
    @solicitation = Solicitation.new
    @customers = Customer.all
    @partners = Partner.all
  end

  def create
    @solicitation = current_user.solicitations.new(
      solicitation_params.merge(
        updated_by: current_user
      )
    )

    if @solicitation.save
      redirect_to @solicitation
    else
      @customers = Customer.all
      @partners = Partner.all
      render :new
    end
  end

  def index
    @solicitations = Solicitation.all
    customer_ids = @solicitations.pluck(:customer_id)
    @customers = Customer.where(id: customer_ids)
  end

  def show
    @solicitation = Solicitation.find(params[:id])
    @performances = @solicitation.performances
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
