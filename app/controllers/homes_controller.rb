class HomesController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
  	@data = Home.all
  end

  def new
  	@select = Home.new
  end

  def create
   @select = Home.new(home_params)
    if @select.save!
      redirect_to new_home_path
    else
      redirect_to homes_path
    end
  end

  def show
  end

  def edit
  	@select = Home.find(params[:id])
  end

  def update
    @select = Home.find(params[:id])
    @select.update(home_params)
    # if @select.save!
    #   redirect_to new_home_path
    # else
    #   redirect_to homes_path
    # end
  end

  def destroy
    @destroy = Home.find(params[:id])
    if @destroy.destroy   
      redirect_to new_home_path
    else
      redirect_to homes_path
    end
  end

  def events
  	# binding.pry
  	@data = Home.where(name: params[:title].strip).last
  	render json: {data: @data}
  	
  end

  def home_params
  	return params.require(:home).permit(:name, :event_id , :starting_date, :ending_date, :description, :category)
  end

end
