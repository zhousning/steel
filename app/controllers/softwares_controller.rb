class SoftwaresController < ApplicationController
  def index
    @softwares = Software.all
  end

  def list 
    @softwares = Software.all
  end

  def show
    @software = Software.find(params[:id])
  end

  def new
    @software = Software.new
  end

  def edit
    @software = Software.find(params[:id])
  end

  def update
    @software = Software.find(params[:id])
    if @software.update(software_params)
      redirect_to software_path(@software) 
    else
      render :edit
    end
  end

  def create
    @software = Software.new(software_params)
    if @software.save
      redirect_to @software
    else
      render :new
    end
  end

  private
    def software_params
      params.require(:software).permit(:name, :description, :file, :install)
    end
end
