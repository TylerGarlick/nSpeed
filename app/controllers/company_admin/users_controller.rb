class CompanyAdmin::UsersController < ApplicationController

  def index
    if params[:term]
      @users = User.find(:all,:conditions => ['username LIKE ?', "%#{params[:term]}%"])
    else
      @users = User.all
    end

    respond_to do |format|
      format.json { render :json => @users.to_json(:only =>[:id, :username]) }
    end

  end
=begin
  def index
    if params[:term]
      @users = User.find(:all,:conditions => ['username LIKE ?', "%#{params[:term]}%"])
    else
      @users = User.all
    end

    respond_to do |format|
      format.json { render :json => @users.to_json(:only =>[:id, :username]) }
    end

  end
=end
end