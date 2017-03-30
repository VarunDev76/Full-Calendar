class CreateHomes < ActiveRecord::Migration[5.0]
  def change
    create_table :homes do |t|
    	t.string 		:name 				,	limit: 20
    	t.text 			:description 		,	limit: 50
    	t.datetime 		:starting_date 		
    	t.datetime 		:ending_date 
    	t.timestamps
    end
  end
end
