# frozen_string_literal: true

class Statistic < ApplicationRecord
  validates :actual_name, :uin, :chess_username, :chess_blitz, :chess_rapid, :chess_total_played, :lichess_username, :lichess_blitz, :lichess_rapid, :lichess_total_played, presence: true
end
