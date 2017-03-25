class Turn < ActiveRecord::Base

	include AASM
	belongs_to :user

def self.import (file)
  CSV.foreach(file.path, headers: true) do |row|
  	@cantidad = row[4]
		for i in 0..(@cantidad.to_i)-1
			Turn.create(dia: row[0],numdia: row[1],horainicio: row[2],horatermino: row[3])
		end
  end
end

def self.to_csv(options = {})
	attributes = %w{horainicio horatermino {User.find(turn.user_id).name} user_id}
	CSV.generate(options) do |csv|
		csv << ["","","Planilla de Turnos"]

		csv << [""]
		csv << ["","","Lunes " ,Turn.find_by(dia:'Lunes').numdia]
		csv << ["Inicio","Término","Nombre Empaque","N°","E","S","Observación"]
		all.lunes.each do |turn|
			if turn.may_liberate?
				csv << [turn.horainicio,turn.horatermino,User.find(turn.user_id).name,turn.user_id," "," "," "]
			else
				csv << [turn.horainicio,turn.horatermino," ",turn.user_id," "," "," "]
			end
		end
			csv << [" "]
			csv << ["","","Reemplazos"]
			csv << ["R#","","Nombre Empaque"]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]

			csv << [""]
		csv << ["","","Martes " ,Turn.find_by(dia:'Martes').numdia]
		csv << ["Inicio","Término","Nombre Empaque","N°","E","S","Observación"]
		all.martes.each do |turn|
			if turn.may_liberate?
				csv << [turn.horainicio,turn.horatermino,User.find(turn.user_id).name,turn.user_id," "," "," "]
			else
				csv << [turn.horainicio,turn.horatermino," ",turn.user_id," "," "," "]
			end
		end
			csv << [" "]
			csv << ["","","Reemplazos"]
			csv << ["R#","","Nombre Empaque"]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]

			csv << [""]
		csv << ["","","Miercoles " ,Turn.find_by(dia:'Miercoles').numdia]
		csv << ["Inicio","Término","Nombre Empaque","N°","E","S","Observación"]
		all.miercoles.each do |turn|
			if turn.may_liberate?
				csv << [turn.horainicio,turn.horatermino,User.find(turn.user_id).name,turn.user_id," "," "," "]
			else
				csv << [turn.horainicio,turn.horatermino," ",turn.user_id," "," "," "]
			end
		end
			csv << [" "]
			csv << ["","","Reemplazos"]
			csv << ["R#","","Nombre Empaque"]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]

			csv << [""]
		csv << ["","","Jueves " ,Turn.find_by(dia:'Jueves').numdia]
		csv << ["Inicio","Término","Nombre Empaque","N°","E","S","Observación"]
		all.jueves.each do |turn|
			if turn.may_liberate?
				csv << [turn.horainicio,turn.horatermino,User.find(turn.user_id).name,turn.user_id," "," "," "]
			else
				csv << [turn.horainicio,turn.horatermino," ",turn.user_id," "," "," "]
			end
		end
			csv << [" "]
			csv << ["","","Reemplazos"]
			csv << ["R#","","Nombre Empaque"]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]

			csv << [""]
		csv << ["","","Viernes " ,Turn.find_by(dia:'Viernes').numdia]
		csv << ["Inicio","Término","Nombre Empaque","N°","E","S","Observación"]
		all.viernes.each do |turn|
			if turn.may_liberate?
				csv << [turn.horainicio,turn.horatermino,User.find(turn.user_id).name,turn.user_id," "," "," "]
			else
				csv << [turn.horainicio,turn.horatermino," ",turn.user_id," "," "," "]
			end
		end
			csv << [" "]
			csv << ["","","Reemplazos"]
			csv << ["R#","","Nombre Empaque"]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]

			csv << [""]
		csv << ["","","Sábado " ,Turn.find_by(dia:'Sábado').numdia]
		csv << ["Inicio","Término","Nombre Empaque","N°","E","S","Observación"]
		all.sabado.each do |turn|
			if turn.may_liberate?
				csv << [turn.horainicio,turn.horatermino,User.find(turn.user_id).name,turn.user_id," "," "," "]
			else
				csv << [turn.horainicio,turn.horatermino," ",turn.user_id," "," "," "]
			end
		end
			csv << [" "]
			csv << ["","","Reemplazos"]
			csv << ["R#","","Nombre Empaque"]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]

			csv << [""]
		csv << ["","","Domingo " ,Turn.find_by(dia:'Domingo').numdia]
		csv << ["Inicio","Término","Nombre Empaque","N°","E","S","Observación"]
		all.domingo.each do |turn|
			if turn.may_liberate?
				csv << [turn.horainicio,turn.horatermino,User.find(turn.user_id).name,turn.user_id," "," "," "]
			else
				csv << [turn.horainicio,turn.horatermino," ",turn.user_id," "," "," "]
			end
		end
			csv << [" "]
			csv << ["","","Reemplazos"]
			csv << ["R#","","Nombre Empaque"]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
			csv << [""]
	end
end


	scope :lunes, -> {where(dia:"Lunes")}
	scope :martes, -> {where(dia:"Martes")}
	scope :miercoles, -> {where(dia:"Miercoles")}
	scope :jueves, -> {where(dia:"Jueves")}
	scope :viernes, -> {where(dia:"Viernes")}
	scope :sabado, -> {where(dia:"Sábado")}
	scope :domingo, -> {where(dia:"Domingo")}
	scope :libres, -> {where(user_id: nil)}
	scope :tomados, ->{where(state: "take")}

aasm column: "state" do
	 	state :free, initial: true
	 	state :take

	 	#Inactivar grupo
			event :liberate do
				transitions from: :take, to: :free
			end
		#Activar grupo
			event :taken do
				transitions from: :free, to: :take
			end

	 end

end
