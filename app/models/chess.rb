class Chess < ApplicationRecord
    belongs_to :personal_information, :optional => true
    
    validates :blitz, :rapid, :total_played, presence: true
end
