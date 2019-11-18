class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
    	t.string 					:number, null: false, default: ""
    	t.date 						:expiration, null: false, default: ""
    	t.references 			:person, index: true, null: false
    	t.json 						:modalities_ids, default: []
      t.timestamps
    end
  end
end
