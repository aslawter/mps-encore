class PerformanceContactsController < ApplicationController
  def new
    if PerformanceContact::ALL_ROLES.include?(params[:role])
      @role = params[:role]
    else
      @role = "INVALID ROLE"
    end
    @performance = Performance.find(params[:performance_id])
    @performance_contact = PerformanceContact.new
    @customer = @performance.customer
    @partner = @performance.partner
  end

  def create
    @performance = Performance.find(params[:performance_id])
    @performance_contact = current_user.performance_contacts.new(
      performance_contact_params.merge(
        performance_id: @performance.id,
        updated_by: current_user
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

  def edit
    if PerformanceContact::ALL_ROLES.include?(params[:role])
      @role = params[:role]
    else
      @role = "INVALID ROLE"
    end
    @performance = Performance.find(params[:performance_id])
    @performance_contact = @performance.performance_contacts.find_by!(contact_id: params[:id])
    @customer = @performance.customer
    @partner = @performance.partner
  end

  def update
    @performance = Performance.find(params[:performance_id])
    @performance_contact = @performance.performance_contacts.find_by!(id: params[:id])

    if @performance_contact.update(performance_contact_params.merge(updated_by_id: current_user.id))
      redirect_to @performance
    else
      @performance = Performance.find(params[:performance_id])
      @partner = @performance.partner
      @customer = @performance.customer
      render :edit
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
