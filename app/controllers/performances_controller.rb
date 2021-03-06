class PerformancesController < ApplicationController
  def index
    @performances = Performance.all
    @customers = Customer.all
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @performance = Performance.new
    @partners = Partner.all
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @performance = current_user.performances.new(
      performance_params.merge(
        customer: @customer,
        updated_by_id: current_user.id
      )
    )

    if @performance.save
      redirect_to @performance
    else
      @partners = Partner.all
      render :new
    end
  end

  def show
    @performance = Performance.find(params[:id])
    @updater = @performance.updated_by
  end

  def edit
    @performance = Performance.find(params[:id])
    @customer = @performance.customer
    @partner = @performance.partner
    @partners = Partner.all
  end

  def update
    performance = Performance.find(params[:id])
    if performance.update(performance_params.merge(updated_by_id: current_user.id))
      redirect_to performance
    else
      render :edit
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
        :prime_contractor,
        :partner_id,
        :description
    )
  end
end
