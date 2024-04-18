class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string  :identification_code
      t.bigint :state_code, null: false
      t.timestamps
    end
    add_foreign_key :cities, :states, column: :state_code, primary_key: :state_code
    
  end
end
