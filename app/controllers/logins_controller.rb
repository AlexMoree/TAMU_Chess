class LoginsController < ApplicationController
  before_action :set_login, only: %i[ show edit update destroy ]

  # GET /logins or /logins.json
  def index
    @logins = Login.all
  end

  def store
    @logins = Login.show
  end

  def authorize
    @logins = Login.show
    @chesses = chesses.show
    @homes = homes.show
    @attendences = attendences.show
    
  end

  # GET /logins/new
  def new
    @login = Login.new
  end

  # POST /logins or /logins.json
  def create
    @login = Login.new(login_params)

    respond_to do |format|
      if @login.save
        format.html { redirect_to login_url(@login), notice: "Login was successfully created." }
        format.json { render :show, status: :created, location: @login }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logins/1 or /logins/1.json
  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to login_url(@login), notice: "Login was successfully updated." }
        format.json { render :show, status: :ok, location: @login }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def login_params
      params.require(:login).permit(:username, :password)
    end
end
