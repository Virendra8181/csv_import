class CreateStates < ActiveRecord::Migration[7.1]
  def change
    create_table :states ,id: false do |t|
      t.string :state
      t.bigint :state_code, primary_key: true,null: false
      t.timestamps
    end
   
  end
end
