class PerformanceContactsController < ApplicationController
  def new
    @performance_contact = PerformanceContact.new
    @performance = Performance.find(params[:performance_id])
    @customer = @performance.customer
    @partner = @performance.partner
    @customer_contacts = @customer.contacts
    @partner_contacts = @partner.contacts
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @performance_contact = current_user.performance_contacts.new(
      performance_contact_params.merge(
        performance_id: @performance.id
      )
    )

    if @performance_contact.save
      redirect_to @performance
    else
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
