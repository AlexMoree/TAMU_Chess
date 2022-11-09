# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    # return nil unless email =~ /@gmail.com || @tamu.edu\z/

    return nil unless (email == 'yusufb@tamu.edu') || (email == 'abhavikati@gmail.com') || (email == 'alex_moree@tamu.edu') || (email == 'jaylockwood@tamu.edu') || (email == 'rishiamarnath1@gmail.com') || (email == 'sheonlee98@tamu.edu') || (email == 'tamuchess@gmail.com')

    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
