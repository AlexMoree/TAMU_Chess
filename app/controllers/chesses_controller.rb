class ChessesController < ApplicationController
  before_action :set_chess, only: %i[ show edit update destroy ]
  require 'net/http'
  require 'json'

  # GET /chesses or /chesses.json
  def index
    @chesses = Chess.all
  end

  # GET /chesses/1 or /chesses/1.json
  def show
  end

  # GET /chesses/new
  def new
    @chess = Chess.new
  end

  # GET /chesses/1/edit
  def edit
  end

  # POST /chesses or /chesses.json
  def create
    @chess = Chess.new(chess_params)

    respond_to do |format|
      if @chess.save
        format.html { redirect_to chess_url(@chess), notice: "Chess was successfully created." }
        format.json { render :show, status: :created, location: @chess }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chesses/1 or /chesses/1.json
  def update
    respond_to do |format|
      if @chess.update(chess_params)
        format.html { redirect_to chess_url(@chess), notice: "Chess was successfully updated." }
        format.json { render :show, status: :ok, location: @chess }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chesses/1 or /chesses/1.json
  def destroy
    @chess.destroy

    respond_to do |format|
      format.html { redirect_to chesses_url, notice: "Chess was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  helper_method :get_http_request_chess

  def get_http_request_chess(username)
    uri = URI('https://api.chess.com/pub/player/' + username + '/stats')
    # uri = URI('https://api.chess.com/pub/player/AnaKuchava/stats')
    # blitz, rapids, total
    stats = []

    res = Net::HTTP.get_response(uri)
    #Net::http.request_get(url + username) {|res|
    full_data = JSON.parse(res.body)

    # puts full_data

    # puts full_data["chess_blitz"]["last"]["rating"]
    # puts full_data["chess_rapid"]["last"]["rating"]

    count = 0;

    count += full_data["chess_blitz"]["record"]["win"]
    count += full_data["chess_blitz"]["record"]["loss"]
    count += full_data["chess_blitz"]["record"]["draw"]

    count += full_data["chess_rapid"]["record"]["win"]
    count += full_data["chess_rapid"]["record"]["loss"]
    count += full_data["chess_rapid"]["record"]["draw"]

    # puts count
    stats <<  full_data["chess_blitz"]["last"]["rating"]
    stats <<  full_data["chess_rapid"]["last"]["rating"]
    stats <<  count

    puts stats
    return stats
  end

  def update_chesses_table
    t = Time.now
    x = t.strftime('%Y')
    y = t.mon

    if y < 8 
      x = x + '-01-01'
    else 
      x = x + '-08-01'
    end
    
    personal_informations = PersonalInformation.where(start_date:x)
    chesses = Chess.all

    #destroy all existing rows
    chesses.each do |chess| 
      chess.destroy
    end

    #loop through usernames
    personal_informations.each do |personal_information|
      if personal_information.chess_com_username != ""
        currentUsername = personal_information.chess_com_username
        
        currentStats = get_http_request_chess(currentUsername)

        #create new row
        chess = Chess.new
        chess.lichess_org_username = currentUsername
        chess.blitz = currentStats[0]
        chess.rapid = currentStats[1]
        chess.total_played = currentStats[2]
        chess.save
      end
    end
  end
  helper_method :update_chesses_table

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chess
      @chess = Chess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chess_params
      params.require(:chess).permit(:chess_com_username, :blitz, :rapid, :total_played)
    end
end
