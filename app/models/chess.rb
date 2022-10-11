class Chess < ApplicationRecord
    belongs_to :personal_information, :optional => true
    
    validates :actual_name, :chess_com_username, :blitz, :rapid, :total_played, presence: true

end
