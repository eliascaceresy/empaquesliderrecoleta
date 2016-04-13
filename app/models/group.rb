class Group < ActiveRecord::Base
	 include AASM

	 validates :name, presence: true
	 validates :state, presence: true
	 has_many :users


	 aasm column: "state" do 
	 	state :inactivo, initial: true
	 	state :activo

	 	#Inactivar grupo
			event :inactivate do
				transitions from: :activo, to: :inactivo
			end
		#Activar grupo
			event :activate do
				transitions from: :inactivo, to: :activo
			end

	 end
end
