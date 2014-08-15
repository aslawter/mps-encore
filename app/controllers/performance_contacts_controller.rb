class PerformanceContactsController < ApplicationController
  def new
    @performance_contact = PerformanceContact.new
    @performance = Performance.find(params[:performance_id])
    @customer = @performance.customer
    @partner = @performance.partner
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @performance_contact = current_user.performance_contacts.new(
      performance_contact_params.merge(
        performance_id: @performance.id,
        updated_by_id: current_user.id
      )
    )

    if @performance_contact.save
      redirect_to @performance
    else
      @partner = @performance.partner
      @customer = @performance.customer
      render :new
    end
  end

  private

  def performance_contact_params
    params.require(:performance_contact).
      permit(
        :contact_id,
        :role
      )
  end
end
