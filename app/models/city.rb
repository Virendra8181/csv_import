class City < ApplicationRecord
    belongs_to :state , foreign_key: 'state_code'
    has_many :crime_reports
end
