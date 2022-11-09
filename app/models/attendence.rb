# frozen_string_literal: true

class Attendence < ApplicationRecord
  personal_informations = PersonalInformation.all
  has_many :personal_informations
  validates :uin, length: { minimum: 9, maximum: 9 }, numericality: { only_integer: true }, uniqueness: { scope: :day_of_event }
  validates :day_of_event, uniqueness: { scope: :uin }
  validates :uin, :day_of_event, presence: true
end