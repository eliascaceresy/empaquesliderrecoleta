class UsersController < ApplicationController
   before_action :authenticate_user!
before_action :set_user, only: [:show, :edit, :update, :destroy,:activar,:desactivar]

	def index
    @users = User.paginate(page: params[:page],per_page: 40).all
  end

  

  def new
    @user = User.new
  end

  # GET /groups/1/edit
  def edit
  end

  def show
  end

  # POST /groups
  # POST /groups.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Empaque creado exitosamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :back, notice: 'Empaque actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Empaque eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def import
    User.import(params[:file])
    redirect_to :back, notice: 'Empaques importados exitosamente'
  end

def activar
    @user.activar!
    redirect_to :back
  end

  def desactivar
    @user.desactivar!
    redirect_to :back
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :address, :phone_number,:rut, :password, :password_confirmation, :current_password,:cover,:permission_level)
    end
end
