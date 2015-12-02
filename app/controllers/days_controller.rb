class DaysController < ApplicationController
  load_and_authorize_resource
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
    @day.weight.round(1)
    
    
    
    
  #convoluted date validation begins
    
    #change date back to string so it can be parsed by Date.parse
    
    x=@day.date.to_s
    
    
   
    
    
    #if first number in string is a zero they inputted the year without using 4 digits
    if x[0] =="0"
      flash[:alert] = 'Date not valid. Please use format YYYY-MM-DD'
      redirect_to :back
      return
        
    end
    
    #parse date for validation
    begin
      Date.parse(x)
      rescue ArgumentError
        flash[:alert] = 'Date not valid. Please use format YYYY-MM-DD'
        
        return
    end
    
     @day.date = x
    
  
  
  
  #if same date as another entry, return and flash alert
    
    @user_days= Day.where(user_id: current_user.id)
      @user_days.each { |day|
        
        if day.date ==@day.date
            flash[:alert] = 'Date already logged. Try again.'
            redirect_to :back
            return
        end
        
        }
       

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
  



#not in use just yet
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
