# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    # return nil unless email =~ /@gmail.com || @tamu.edu\z/

    return nil unless (email == 'yusufb@tamu.edu') or (email == 'abhavikati@gmail.com') or (email == 'alexmoree@tamu.edu') or (email == 'jaylockwood@tamu.edu') or (email == 'rishiamarnath1@gmail.com') or (email == 'sanghlee98@gmail.com') or (email == 'tamuchess@gmail.com')

    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
