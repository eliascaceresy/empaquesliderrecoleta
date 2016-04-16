module PermissionsConcern
	extend ActiveSupport::Concern

	def is_empaque?
		self.permission_level >=1

	end

	def is_administrador?
		self.permission_level >= 2
	end
end
