# frozen_string_literal: true

json.extract! personal_information, :uin, :first_name, :last_name, :email, :membership, :start_date, :end_date, :discord_username, :chess_com_username, :lichess_org_username
json.url personal_information_url(personal_information, format: :json)
