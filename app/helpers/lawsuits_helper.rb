module LawsuitsHelper


	def dept_rules
		@lawsuit.dept.scan(/\d+/).join
	end

	def policies_and_procedures(dept)
		case dept

		when 60
			"https://www.sdcourt.ca.gov/sites/default/files/PAGE/SDCOURT/GENERALINFORMATION/LOCALRULESOFCOURT/ROCDEPARTMENTRULES/DEPARTMENT60/department_60_policies_and_procedures.pdf"
		when 64
			"https://www.sdcourt.ca.gov/sites/default/files/2023-04/department_64_policies_and_procedures_-_honorable_loren_g._freestone.pdf"
		when 65
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/rocdepartmentrules/department65/policy_and_procedures_dept_65.pdf"
		when 66
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/rocdepartmentrules/department66/department%2066%20policies%20and%20procedures%20-%20honorable%20kenneth%20j.%20medel.pdf"
		when 67
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/rocdepartmentrules/department67/department_67_rules_and_procedures.pdf"
		when 68
		 	"https://www.sdcourt.ca.gov/sites/default/files/2022-02/department_68_policies_and_procedures_-_honorable_richard_s._whitney.pdf"
		when 69
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/department_69_policies_and_procedures_-_honorable_katherine_a._bacal.pdf"
		when 70
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/rocdepartmentrules/department70/department%2070%20policies%20and%20procedures%20-%20honorable%20carolyn%20m.%20caietti.pdf"
		when 71
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/rocdepartmentrules/department71/department%2071%20policies%20and%20procedures%20-%20honorable%20gregory%20w.%20pollack.pdf"
		when 72
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/rocdepartmentrules/department72/Department_72_Policies_and_Procedures.pdf"
		when 73
			"https://www.sdcourt.ca.gov/sites/default/files/sdcourt/generalinformation/localrulesofcourt/rocdepartmentrules/department73/department%2073%20policies%20and%20procedures%20-%20honorable%20joel%20r.%20wohlfeil.pdf"
		else
			"Error"
		end
	end



end
