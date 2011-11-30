class CompanyAdmin::CustomersController < ApplicationController
  expose(:company) {current_user.company}
  expose(:customers) {company.customers.paginate(:page => params[:page])}
  expose(:customer)

  def index
  end

  def show
  end

  def new
  end

  def create
    company.customers << customer
    if company.save
      redirect_to company_admin_customers_path, :notice => "Customer #{customer.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if customer.update_attributes(params[:customer])
      redirect_to company_admin_customers_path, :notice => "Customer #{customer.name} was updated successfully!"
    else
      render :edit
    end
  end

  def destroy

  end
end
