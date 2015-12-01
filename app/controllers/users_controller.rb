class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  #profile page after logging in
  def show
      
    
    #first grab ALL the days from the specific user
    user_days = Day.where(user_id: current_user.id)
    #sort days by date
    @days_sorted =user_days.sort_by &:date
    @all =user_days.sort_by &:date
    
    
    
   
    #arrays for graphing
    dates_array = []
    weight_array = []
    @days_sorted. each do |y|
      dates_array.push(y.date)
      weight_array.push(y.weight)
    end
    
    #remove year from dates, to make charts more legible
    no_year_array =[]
    dates_array.each do |x|
      y =x.to_s
      y.slice!("2015-")
      no_year_array.push(y)
    end 
    
    #grab last 7 days for recent entries table
    @last_7 = @days_sorted.pop(7)
    
   
   #lazy high graph
    @chart = LazyHighCharts::HighChart.new('area') do |f|
      f.title(:text => "Weight by Date")
      
      
        f.xAxis(categories: no_year_array)
      
        f.series(:name => "Pounds", :yAxis => 0, :data => weight_array)
      

      f.yAxis [
        {:title => {:text => "Weight",  :margin => 50} }
        
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"line"})
    end
 
  
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
