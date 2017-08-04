class Admin::AdminsController < ApplicationController

  def index
    @admins=Admin.all
    @flavors=Flavor.all
    @locations=Location.all
  end

  def show
  end

  def new
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
