class DaysController < ApplicationController

  def index
  
  
  end

  def new
    @day = Day.new
  end


  def create
    
    @day = Day.new(post_params)
    @day.user_id = current_user.id
   
     respond_to do |format|
      if @day.save
        format.html { redirect_to :back, notice: 'Day was successfully created.' }
        format.json { render :show, status: :created, location: @day }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  private

    def post_params
      params.require(:day).permit(:date, :weight )
    
    end



end
