json.extract! lichess, :id, :student_id, :username, :rank, :total_played, :win, :draw, :loss, :created_at, :updated_at
json.url lichess_url(lichess, format: :json)
