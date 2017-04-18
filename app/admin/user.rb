ActiveAdmin.register User do

	index do
		column :id 
		column :email
		column :username
		column :first_name
		column :last_name  
		actions default: true
	end
	show do
	    attributes_table do
	      row :id
	      row :email
	      row :username 
	      row :first_name 
	      row :last_name 
	      row "Event Details" do
	      	@user = User.find(params[:id])
	      	table_for @home = @user.homes.all do
	      		column :name
	      		column :starting_date
	      		column :ending_date
	      		column :description
	      	end
	      end
	    end
	    active_admin_comments
  	end

end
