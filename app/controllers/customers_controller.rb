class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @contacts = @customer.contacts
    @contact = Contact.new
    @performances = @customer.performances
  end

  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def create
    @customer = current_user.customers.new(customer_params.merge(updated_by_id: current_user.id))

    if @customer.save
      redirect_to :customers
    else
      @customers = Customer.all
      render :index
    end
  end

  private

  def customer_params
    params.require(:customer).
      permit(
        :name,
        :federal,
      )
  end
end
