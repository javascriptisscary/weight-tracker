class DaysController < ApplicationController
  load_and_authorize_resource
  include DaysHelper
  require 'date'
  
  def index
    #first grab ALL the days from the specific user, order by date, then paginate
    @user_days = Day.where(user_id: current_user.id).order(date: :asc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @day = Day.new
  end
  
  def edit
    @day = Day.find(params[:id])
  end
  
  def create
    @day = Day.new(day_params)
    @day.user_id = current_user.id
  
    respond_to do |format|
      if @day.save
        format.html { redirect_to user_path(current_user.id), notice: 'Day was successfully created.' }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @day = Day.find(params[:id])
    @user = current_user
    
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to days_index_path, notice: 'Successfully updated.' }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @day = Day.find(params[:id])
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_index_path, notice: 'Day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    
    def day_params
      params.require(:day).permit(:date, :weight, :user_id )
    end

end
