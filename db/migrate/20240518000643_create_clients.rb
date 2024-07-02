class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.date :dob
      t.string :ssn
      t.string :gender
      t.boolean :married
      t.text :summary
      t.date :doh
      t.date :dot
      t.string :job_title
      t.string :work_email
      t.boolean :exempt
      t.boolean :commissions
      t.integer :pay_type
     
      t.string :emergency_contact
      t.string :emergency_phone

      t.timestamps
    end
  end
end
