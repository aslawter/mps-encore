class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @contacts = @customer.contacts
    @contact = Contact.new
  end

  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)

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
