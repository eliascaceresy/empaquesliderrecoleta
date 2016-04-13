class User < ActiveRecord::Base
	include AASM
	include PermissionsConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:timeoutable, :timeout_in => 600.seconds
  belongs_to :group
  has_many :turns
  
  has_attached_file :cover, styles: {medium: "50X50", mini:"200x300"} 
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  def email_required?
    false
  end

def self.import (file)
  CSV.foreach(file.path, headers: true) do |row|
  	User.create! row.to_hash
  end
end


        aasm column: "state" do 
	 	state :activo, initial: true
	 	state :inactivo

	 	#Inactivar grupo
			event :desactivar do
				transitions from: :activo, to: :inactivo
			end
		#Activar grupo
			event :activar do
				transitions from: :inactivo, to: :activo
			end

	 end
end
