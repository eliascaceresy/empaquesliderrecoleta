class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end
	def create
		super
	end
	def update
		super
	end
	private
	def sign_up_params
		allow = [:email, :name,:phone_number, :address,:group_id, :rut, :password, :password_confirmation]
		params.require(resource_name).permit(allow)
	end

	def account_update_params
		allow = [:email, :address,:phone_number, :password, :password_confirmation, :current_password,:cover]
		params.require(resource_name).permit(allow)
	end
end