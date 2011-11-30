class Admin::CompaniesController < ApplicationController
  expose(:companies) {Company.all}
  expose(:company)

  def index
  end

  def show
  end

  def create
  end

  def edit
  end


  def update
  end

  def destroy
  end
  
end
