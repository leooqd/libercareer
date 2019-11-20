class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
    	t.string	:name, null: false, default: ""
    	t.string	:last_name
    	t.string	:document, null: false, default: ""
    	t.string	:email, null: false, default: ""
    	t.date	:birth_date, null: false, default: ""
      t.boolean :loyal, null: false, default: false
      t.references  :preferred_phone, index: true
      t.timestamps
    end
  end
end
