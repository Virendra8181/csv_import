class State < ApplicationRecord
    has_many :cities ,foreign_key: 'state_code'
end 
