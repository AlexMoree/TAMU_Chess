# frozen_string_literal: true

class PersonalInformation < ApplicationRecord
  has_many :chesses
  has_many :lichesses

  belongs_to :attendence, optional: true

  validates :uin, length: { minimum: 9, maximum: 9 }, numericality: { only_integer: true }, uniqueness: { scope: :end_date }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: 'incorrect email format' }
  validates :discord_username, format: { with: /\A([\A[a-zA-Z,\s]+\z]+#[0-9]{4,})\Z/i, message: 'incorrect discord username format' }, allow_blank: true
  validates :chess_com_username, :lichess_org_username, length: { minimum: 2 }, allow_blank: true
  validates :uin, :first_name, :last_name, :email, :start_date, :end_date, presence: true
end
