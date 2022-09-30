class ChessesController < ApplicationController
  before_action :set_chess, only: %i[ show edit update destroy ]

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
