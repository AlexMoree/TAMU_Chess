class Lichess < ApplicationRecord
    validates :lichess_com_username, :blitz, :rapid, :total_played, presence: true
end
