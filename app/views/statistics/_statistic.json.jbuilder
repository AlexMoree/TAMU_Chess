# frozen_string_literal: true

json.extract! statistic, :actual_name, :uin, :chess_username, :chess_blitz, :chess_total_played, :lichess_org_username, :lichess_blitz, :lichess_rapid, :lichess_total_played
json.url statistic_url(statistic, format: :json)
