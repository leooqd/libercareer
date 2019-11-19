class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
    	t.references 			:person, index: true
    	t.references 			:automobile, index: true
    	t.decimal 				:cost
    	t.date 						:start_date
    	t.date 						:end_date
    	t.date 						:pickup_date
    	t.date 						:return_date
      t.timestamps
    end
  end
end
