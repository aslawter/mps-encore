class PerformancesController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
    @performance = Performance.new
    @partners = Partner.all
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @performance = current_user.performances.new(performance_params.merge(customer: @customer))

    if @performance.save
      redirect_to @customer
    else
      @partners = Partner.all
      render :new
    end
  end

  private

  def performance_params
    params.require(:performance).
      permit(
        :title,
        :contract_number,
        :starts_on,
        :ends_on,
        :contract_type,
        :value,
        :prime,
        :partner_id
    )
  end
end
