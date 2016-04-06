class TurnsController < ApplicationController
  before_action :set_turn, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_empaque!,only: [:index,:liberarturno,:tomarturno]
  before_action :authenticate_administrador!,only: [:show,:new,:destroy,:edit,:update,:import]
  # GET /turns
  # GET /turns.json
  def index
    @turns = Turn.all
    respond_to do |format|
      format.html
      format.csv { send_data @turns.to_csv}
      format.xls { send_data @turns.to_csv(col_sep: "\t")}
    end
  end

  # GET /turns/1
  # GET /turns/1.json
  def show
  end

  # GET /turns/new
  def new
    @turn = Turn.new
  end

  # GET /turns/1/edit
  def edit
  end

  # POST /turns
  # POST /turns.json
  def create
    @turn = Turn.new(turn_create_params)

    respond_to do |format|
      if @turn.save
        format.html { redirect_to @turn, notice: 'Turno creado exitosamente.' }
        format.json { render :show, status: :created, location: @turn }
      else
        format.html { render :new }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turns/1
  # PATCH/PUT /turns/1.json
  def update
    respond_to do |format|
      if @turn.update(turn_update_params)
        format.html { redirect_to turns_path, notice: 'Turno actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @turn }
      else
        format.html { render :edit }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turns/1
  # DELETE /turns/1.json
  def destroy
    @turns = Turn.all
    @turn.each do |turno|
      turno.delete
    end
    redirect_to :back
  end

  def borrarturnos
    Turn.destroy_all
    redirect_to :back
  end

def import
    Turn.import(params[:file])
    redirect_to :back, notice: 'Turnos agregados exitosamente'
  end

  def tomarturno
    @turn = Turn.find(params[:id])
    if @turn.may_taken?
        @turn.user_id = current_user.id
        @turn.taken!
        @turn.save
        respond_to do |format|
        format.html { redirect_to turns_url,notice: 'Turno tomado exitosamente.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to turns_url,alert: 'Turno fue tomado por otro Empaque.' }
      end
    end
  end


  def liberarturno
    @turn = Turn.find(params[:id])
    @turn.user_id = nil
    @turn.liberate!
    @turn.save
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn
      @turn = Turn.find(params[:id])
    end

  def turn_create_params
    allow = [:dia,:numdia,:horainicio,:horatermino,:state]
    params.require(:turn).permit(allow)
  end

  def turn_update_params
    allow = [:dia,:numdia,:horainicio,:horatermino,:user_id]
    params.require(:turn).permit(allow)
  end
end
