class TomaturnosController < ApplicationController
   before_action :authenticate_user!
  before_action :set_tomaturno, only: [:show, :edit, :update, :destroy,:activartoma,:desactivartoma]
before_action :authenticate_administrador!
  # GET /tomaturnos
  # GET /tomaturnos.json
  def index
    @tomaturnos = Tomaturno.all
  end

  # GET /tomaturnos/1
  # GET /tomaturnos/1.json
  def show
  end

  # GET /tomaturnos/new
  def new
    @tomaturno = Tomaturno.new
  end

  # GET /tomaturnos/1/edit
  def edit
  end

  # POST /tomaturnos
  # POST /tomaturnos.json
  def create
    @tomaturno = Tomaturno.new(tomaturno_params)

    respond_to do |format|
      if @tomaturno.save
        format.html { redirect_to @tomaturno, notice: 'Tomaturno was successfully created.' }
        format.json { render :show, status: :created, location: @tomaturno }
      else
        format.html { render :new }
        format.json { render json: @tomaturno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tomaturnos/1
  # PATCH/PUT /tomaturnos/1.json
  def update
    respond_to do |format|
      if @tomaturno.update(tomaturno_params)
        format.html { redirect_to :back, notice: 'Toma de Turnos Actualizada.' }
        format.json { render :show, status: :ok, location: @tomaturno }
      else
        format.html { render :edit }
        format.json { render json: @tomaturno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tomaturnos/1
  # DELETE /tomaturnos/1.json
  def destroy
    @tomaturno.destroy
    respond_to do |format|
      format.html { redirect_to tomaturnos_url, notice: 'Tomaturno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activartoma
    @tomaturno.activartoma!
    redirect_to :back
  end

  def desactivartoma
    @tomaturno.desactivartoma!
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tomaturno
      @tomaturno = Tomaturno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tomaturno_params
      params.require(:tomaturno).permit(:state,:canmaxsemana)
    end
end
