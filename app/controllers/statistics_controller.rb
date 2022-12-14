# frozen_string_literal: true

class StatisticsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_statistic, only: %i[show edit update destroy]

  # GET /statistics or /statistics.json
  def index
    @statistics = Statistic.all

    if params[:sort] == 'actual_name'
      @statistics = Statistic.order('actual_name')
    elsif params[:sort] == 'uin'
      @statistics = Statistic.order('uin')
    elsif params[:sort] == 'chess_username'
      @statistics = Statistic.order('chess_username')
    elsif params[:sort] == 'lichess_username'
      @statistics = Statistic.order(params[:sort].to_s)
    elsif !params[:sort].nil?
      @statistics = Statistic.order("#{params[:sort]} DESC")
    end
  end

  # GET /statistics/1 or /statistics/1.json
  def show; end

  # DELETE /statistics/1 or /statistics/1.json
  def destroy
    @statistic.destroy

    respond_to do |format|
      format.html { redirect_to statistics_url, notice: 'Statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  helper_method :get_http_request_chess
  def get_http_request_chess(username)
    if username == 'No Username'
      puts 'ERROR: username blank'
      return [0, 0, 0]
    end

    if username.include? '/'
      username = 'No Username'
      puts 'ERROR: username blank'
      return [0, 0, 0]
    end

    lower_case_username = username.downcase

    begin
      uri = URI("https://api.chess.com/pub/player/#{lower_case_username}/stats")
    rescue StandardError
      puts 'URI exception'
      return [-1, -1, -1]
    end
    stats = []

    # try catch api call, if errors make stats an array of -1s

    res = Net::HTTP.get_response(uri)

    full_data = JSON.parse(res.body)

    begin
      if (full_data['code']).zero?
        # puts "username does not exist"
        return [-1, -1, -1]
      end
    rescue StandardError
    end

    count = 0
    begin
      count += full_data['chess_blitz']['record']['win']
      count += full_data['chess_blitz']['record']['loss']
      count += full_data['chess_blitz']['record']['draw']
    rescue StandardError
      puts 'does not play chess_blitz'
    end

    begin
      count += full_data['chess_rapid']['record']['win']
      count += full_data['chess_rapid']['record']['loss']
      count += full_data['chess_rapid']['record']['draw']
    rescue StandardError
      puts 'does not play chess_rapid'
    end

    begin
      stats << full_data['chess_blitz']['last']['rating']
    rescue StandardError
      puts 'does not play chess_blitz'
      stats << -1
    end

    begin
      stats << full_data['chess_rapid']['last']['rating']
    rescue StandardError
      puts 'does not play chess_rapid'
      stats << -1
    end

    stats << count

    stats
  end

  helper_method :get_http_request_lichess
  def get_http_request_lichess(username)
    if username == 'No Username'
      puts 'username blank'
      return [0, 0, 0]
    end
    if username.include? '/'
      puts 'username blank'
      username = 'No Username'
      return [0, 0, 0]
    end

    # blitz, rapids, total
    stats = []

    begin
      uri = URI("https://lichess.org/api/user/#{username}")
    rescue StandardError
      puts 'URI exception'
      return [-1, -1, -1]
    end

    res = Net::HTTP.get_response(uri)
    full_data = JSON.parse(res.body)

    begin
      if full_data['error'] == 'Not found'
        puts("Error: Lichess username#{+ username}#{+ 'not found'}")
        return [-1, -1, -1]
      end
    rescue StandardError
    end

    stats <<  full_data['perfs']['blitz']['rating']
    stats <<  full_data['perfs']['rapid']['rating']
    stats <<  full_data['count']['all']
    # stats: [blitz, rapids, total]

    stats
  end

  def update_statistic_table
    puts 'called update_statistic_table'
    t = Time.now
    x = t.strftime('%Y')
    y = t.mon

    x = if y < 8
          "#{x}-01-01"
        else
          "#{x}-08-01"
        end

    personal_informations = PersonalInformation.where(start_date: x)
    puts 'personal_informations: '
    puts personal_informations
    stats = Statistic.all

    # destroy all existing rows
    stats.each(&:destroy)

    # loop through usernames
    personal_informations.each do |personal_information|
      puts 'looped'

      actual_name = "#{personal_information.first_name} #{personal_information.last_name}"
      puts 'actual_Name                 :'
      puts actual_name

      puts 'uin'
      uin = personal_information.uin
      puts uin

      current_username_one = personal_information.lichess_org_username
      current_username_two = personal_information.chess_com_username

      puts 'lichess username:'
      current_username_one = 'No Username' if current_username_one == ''
      current_username_one = 'No Username' if current_username_one.include? '/'
      puts current_username_one

      puts 'chess.com username:'
      current_username_two = 'No Username' if current_username_two == ''
      current_username_two = 'No Username' if current_username_two.include? '/'
      puts current_username_two

      current_stats_one = get_http_request_lichess(current_username_one)
      puts 'current_stats_one~~~~~~~~~~~~~~~~~:'
      puts current_stats_one
      current_stats_two = get_http_request_chess(current_username_two)
      puts 'current_stats_two~~~~~~~~~~~~~~~~~:'
      puts current_stats_two

      statistic = Statistic.new
      statistic.actual_name = actual_name
      statistic.uin = uin
      statistic.lichess_username = current_username_one
      statistic.lichess_blitz = current_stats_one[0]
      statistic.lichess_rapid = current_stats_one[1]
      statistic.lichess_total_played = current_stats_one[2]
      statistic.chess_username = current_username_two
      statistic.chess_blitz = current_stats_two[0]
      statistic.chess_rapid = current_stats_two[1]
      statistic.chess_total_played = current_stats_two[2]
      statistic.save
    end
  end
  helper_method :update_statistic_table

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_statistic
    @statistic = Statistic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def statistic_params
    params.require(:statistic).permit(:actual_name, :uin, :chess_username, :chess_blitz, :chess_rapid, :chess_total_played, :lichess_username, :lichess_blitz, :lichess_rapid, :lichess_total_played)
  end
end
# frozen_string_literal: true
