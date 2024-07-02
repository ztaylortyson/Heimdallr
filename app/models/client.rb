class Client < ApplicationRecord

	has_many :user_clients
  	has_many :users, through: :user_clients

end

# see FOLDER/ATTY/notes.txt

# add columns
# status: active inactive

# employer_client join table:
	# job title
	# work email
	# pay_rate_amount $
	# pay_rate_type hourly salary commissions hibrid
	# pay_period: bi-weekly

	# 10-1 back wages; 11-3

# Employer - model
# isDefendant? 
# currentEmployer?
# name
# dba
# address
# city
# state
# zip
# agent_service_of_process
# notes:text

# number of employees