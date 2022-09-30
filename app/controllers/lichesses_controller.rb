class LichessesController < ApplicationController
  before_action :set_lichess, only: %i[ show edit update destroy ]
  require 'net/http'
  require 'json'
  # GET /lichesses or /lichesses.json
  def index
    @lichesses = Lichess.all
  end

  # GET /lichesses/1 or /lichesses/1.json
  def show
  end

  # GET /lichesses/new
  def new
    @lichess = Lichess.new
  end

  # GET /lichesses/1/edit
  def edit
  end

  # POST /lichesses or /lichesses.json
  def create
    @lichess = Lichess.new(lichess_params)

    respond_to do |format|
      if @lichess.save
        format.html { redirect_to lichess_url(@lichess), notice: "Lichess was successfully created." }
        format.json { render :show, status: :created, location: @lichess }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lichess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lichesses/1 or /lichesses/1.json
  def update
    respond_to do |format|
      if @lichess.update(lichess_params)
        format.html { redirect_to lichess_url(@lichess), notice: "Lichess was successfully updated." }
        format.json { render :show, status: :ok, location: @lichess }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lichess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lichesses/1 or /lichesses/1.json
  def destroy
    @lichess.destroy

    respond_to do |format|
      format.html { redirect_to lichesses_url, notice: "Lichess was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  helper_method :get_http_request

  def get_http_request(username)
    uri = URI('https://lichess.org/api/user/' + username)
    # blitz, rapids, total
    stats = [0, 0, 0]
    #username = 'alireza2003'
    res = Net::HTTP.get_response(uri)
    #Net::http.request_get(url + username) {|res|
    full_data = JSON.parse(res.body)

    #puts full_data["perfs"]["blitz"]["rating"]
    #puts full_data["perfs"]["rapid"]["rating"]
    #puts full_data["count"]["all"]
    stats <<  full_data["perfs"]["blitz"]["rating"]
    stats <<  full_data["perfs"]["rapid"]["rating"]
    stats <<  full_data["count"]["all"]
    puts stats
    return stats
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lichess
      @lichess = Lichess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lichess_params
      params.require(:lichess).permit(:lichess_org_username, :blitz, :rapid, :total_played)
    end
end
