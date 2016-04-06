class Tomaturno < ActiveRecord::Base
   include AASM


	aasm column: "state" do 
	 	state :inactiva, initial: true
	 	state :activa

	 	#Inactivar grupo
			event :activartoma do
				transitions from: :inactiva, to: :activa
			end
		#Activar grupo
			event :desactivartoma do
				transitions from: :activa, to: :inactiva
			end

	 end
end
