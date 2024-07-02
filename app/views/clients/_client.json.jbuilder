json.extract! client, :id, :fname, :mname, :lname, :email, :phone, :address, :city, :state, :zip, :dob, :ssn, :gender, :married, :summary, :doh, :dot, :job_title, :work_email, :exempt, :commissions, :pay_type, :pay_rate, :emergency_contact, :emergency_phone, :created_at, :updated_at
json.url client_url(client, format: :json)
