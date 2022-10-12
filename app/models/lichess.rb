class Lichess < ApplicationRecord
    belongs_to :personal_information, :optional => true
    
    validates :actual_name, :lichess_org_username, :blitz, :rapid, :total_played, presence: true
end
