class DriversController < ApplicationController
  
  def index
    @drivers = Driver.all
  end 
  
  def show
    driver_id = params[:id].to_i
    
    @driver = Driver.find_by(id: driver_id)
    
    if @driver.nil?
      head :not_found
      return 
    end 
  end 
  
  def new
    @driver = Driver.new
  end 
  
  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to driver_path(@driver.id)
    else 
      render new_driver_path
    end
  end 
  
  def edit
    @driver = Driver.find_by(id: params[:id])
  end 
  
  def update
    @driver = Driver.find_by(id: params[:id])
    
    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
    else 
      render new_driver_path
    end 
  end 
  
  def destroy
    selected_driver = Driver.find_by(id:params[:id])
    
    if selected_driver.nil?
      redirect_to drivers_path
      return
    else 
      selected_driver.destroy
      redirect_to drivers_path 
      return
    end 
  end
  
  
  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end 
  
end
