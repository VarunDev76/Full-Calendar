class HomesController < ApplicationController
	skip_before_action :verify_authenticity_token

  def index
  	@data = Home.all
  end

  def new
    # @user = User.find(current_user.id)
  	@select = Home.new
  end

  def create
    @user = User.find(current_user.id)
   @select = @user.homes.new(home_params)
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
  	@data = Home.where(name: params[:title].strip).last
  	render json: {data: @data}
  end

  def disconnect_account
    uri = URI('https://accounts.google.com/o/oauth2/revoke')
    params = { :token => current_user.refresh_token || current_user.token }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get(uri)
    user_delete = current_user.destroy
    redirect_to new_home_path
  end

  def home_params
  	return params.require(:home).permit(:user_id, :username, :name, :event_id , :starting_date, :ending_date, :description, :category)
  end

end
