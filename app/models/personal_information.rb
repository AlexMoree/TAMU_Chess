class PersonalInformation < ApplicationRecord
    has_many :chesses
    has_many :lichesses

    belongs_to :attendence, :optional => true

    validates :uin, :first_name, :last_name, :email, :membership, :start_date, :end_date, :discord_username, :chess_com_username, :lichess_org_username, presence: true
end