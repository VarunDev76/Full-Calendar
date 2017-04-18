ActiveAdmin.register Home do
controller do
    def create
      create! do |format|
        @user
      end
    end

    def update
      update! do |format|
        @user
      end
    end

    def edit
      edit!
    end
end

index do
	column :id
	content do
		table_for @user = User.all do
			column "User Id", :user_id
			column "User Name", :username
		end
	end
	column "User Name", :user_id
	# column(:user_id), :user
	column :name
	column :description
	column :starting_date
	column :ending_date 
	# default_actions
end
form do |f|
	f.inputs "Home" do
		f.input :user_id, label: "User Id"
		f.input :username, label: "User Name"
		f.input :name
		f.input :starting_date,  as: :string , label: "Start Date" 
		f.input :ending_date, as: :string , label: "End Date" 
		f.input :description
	end
	f.actions
end
end
