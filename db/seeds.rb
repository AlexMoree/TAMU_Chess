Chess.create!([
  {actual_name: "Magnus Carlsen", chess_com_username: "MagnusCarlsen", blitz: 3185, rapid: 2810, total_played: 557},
  {actual_name: "Hikaru Nakamura", chess_com_username: "Hikaru", blitz: 3229, rapid: 2785, total_played: 29412}
])
Lichess.create!([
  {actual_name: "Magnus Carlsen", lichess_org_username: "DrNykterstein", blitz: 3198, rapid: 2500, total_played: 10182},
  {actual_name: "Hikaru Nakamura", lichess_org_username: "TSMFTXH", blitz: 2408, rapid: 1500, total_played: 284}
])
PersonalInformation.create!([
  {uin: "123456789", first_name: "Magnus", last_name: "Carlsen", email: "magnusCarlsen@gmail.com", membership: true, start_date: "2022-08-01", end_date: "2022-12-31", discord_username: "magnusCarlsen", chess_com_username: "MagnusCarlsen", lichess_org_username: "DrNykterstein"},
  {uin: "987654321", first_name: "Hikaru", last_name: "Nakamura", email: "hikaru@gmail.com", membership: true, start_date: "2022-08-01", end_date: "2022-12-31", discord_username: "TSMhikaru", chess_com_username: "Hikaru", lichess_org_username: "TSMFTXH"}
])
