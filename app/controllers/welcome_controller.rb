class WelcomeController < ApplicationController
	 before_action :authenticate_user!
	before_action :authenticate_empaque!, only: [:dashboard]
	before_action :authenticate_administrador!,only: [:dashboard2,:dashboard5]

	def index
	end

	def dashboard
		@tomaturnos = Tomaturno.all
		@groups = Group.all
		@turns = Turn.all
	end

	def dashboard2
		@turns=Turn.tomados.all
	end

	def dashboard4
		@users=User.find(params[:id])
	end

	def dashboard5
		@tomaturnos = Tomaturno.all
		@groups = Group.all
		@turns = Turn.all
	end

end
