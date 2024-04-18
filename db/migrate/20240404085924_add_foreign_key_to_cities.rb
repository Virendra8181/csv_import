class AddForeignKeyToCities < ActiveRecord::Migration[7.1]
  def change
    add_reference :crime_reports, :city, foreign_key: true, null: false
  end
end
