class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
    	t.string  		:number, null: false, default: ""
    	t.string  		:ddd, null: false, default: ""
    	t.string 			:kind, null: false, default: "particular"
    	t.references 	:person, index: true
      t.timestamps
    end
  end
end
