class PropuestsController < ApplicationController

  def index
    @propuests = Propuest.all
  end

  def show
    @propuest = Propuest.find(params[:id])
  end
  
  def new
    @form = NewPropuestForm.new
  end

  def create
    form = NewPropuestForm.new

    if form.submit(params[:propuest])
      redirect_to propuests_path, notice: "Company successfully created."
    else
      @form = form
      render :new
    end
  end


  def edit
    propuest = Propuest.find(params[:id])
    @form = EditCompanyForm.new(propuest)
  end

  def update
    propuest = Propuest.find(params[:id])
    form = EditPropuestForm.new(propuest)

    if form.submit(params[:propuest])
      redirect_to companies_path, notice: "Company successfully updated."
    else
      @form = form
      render :edit
    end   

  end

end