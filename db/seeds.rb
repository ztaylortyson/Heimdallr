# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Lawsuit 1:Keppel 2:Digdigan 7:Britton
# heuberger = Lawsuit.create!(
# 	cn: "37-2023-00028893-CU-WT-CTL",
# 	ct: "Heuberger vs Teepee III LLC [IMAGED]", 
# 	forum: "SDSC",
# 	location: "SAN DIEGO",
# 	stage: "Pleading",
# 	status: "Pending",
# 	judge: "Richard S. Whitney",
# 	dept: "C-68",
# 	lroa: "22",
# 	atty_for: "ERINN HEUBERGER",
# 	plt_caption: "ERINN HEUBERGER, an individual",
# 	def_caption: "TEEPEE III, LLC, an unknown business entity; JOHN T. POTTS, an individual; TIM MATTHEWS, an individual; and DOES 1 through 25, inclusive,",
# 	dname: "TEEPEE III, LLC"
# 	)

# gannon = Lawsuit.create!(
# 	cn: "",
# 	ct: "", 
# 	forum: "",
# 	location: "",
# 	stage: "",
# 	status: "",
# 	judge: "",
# 	dept: "",
# 	lroa: "",
# 	atty_for: "",
# 	plt_caption: "",
# 	def_caption: "",
# 	dname: ""
# 	)

# keppel = Lawsuit.find(1)
# britton = Lawsuit.find(7)
# dig = Lawsuit.find(2)

# Courtdate 8:keppel 9:Britton
# ##################################################
# Court Dates 
# ##################################################
# keppel = Courtdate.create!(
# 	complaint: ,
# 	paga: ,
# 	answer: ,
# 	cmc: ,
# 	first_expert_exchange: ,
# 	second_expert_exchange: ,
# 	discovery_cutoff: ,
# 	trc: ,
# 	trial: 
# 	lawsuit_id: 
# 	)
# britton = Courtdate.create!(
# 	complaint: ,
# 	paga: ,
# 	answer: ,
# 	cmc: ,
# 	first_expert_exchange: ,
# 	second_expert_exchange: ,
# 	discovery_cutoff: ,
# 	trc: ,
# 	trial: 
# 	lawsuit_id: 
# 	)
heuberger = Courtdate.create!(
	complaint: "07/07/2023",
	paga: "03/03/2023",
	answer: "",
	cmc: "11/22/2024",
	first_expert_exchange: "",
	second_expert_exchange: "",
	discovery_cutoff: "",
	trc: "",
	trial: "", 
	lawsuit_id: 12 
	)

if heuberger.save
	puts "SAVED!!!"
else
	puts "Did not save."
end

# gannon = Courtdate.create!(
# 	complaint: ,
# 	paga: ,
# 	answer: ,
# 	cmc: ,
# 	first_expert_exchange: ,
# 	second_expert_exchange: ,
# 	discovery_cutoff: ,
# 	trc: ,
# 	trial: 
# 	lawsuit_id: 
# 	)
# dig = Courtdate.create!(
# 	complaint: "Thu, 03 Nov 2022",
# 	paga: "Thu, 03 Nov 2022",
# 	answer: "Thu, 03 Nov 2022",
# 	trial: "Thu, 03 Nov 2022",
# 	lawsuit_id: 2
# 	)

# if dig.save
# 	puts "SAVED!!!"
# else
# 	puts "Did not save."
# end
