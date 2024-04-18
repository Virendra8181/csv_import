class CreateDomesticViolenceStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :domestic_violence_statistics do |t|

      t.timestamps
    end
  end
end
