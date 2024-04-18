class CreateCrimeReports < ActiveRecord::Migration[7.1]
  def change
    create_table :crime_reports do |t|
      t.bigint :year
      t.bigint :crime_report
      t.timestamps
    end
  end
end
