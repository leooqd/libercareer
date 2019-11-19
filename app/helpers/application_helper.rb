module ApplicationHelper
	def resource_name
		:user
	end
	def resource
		@resource ||= User.new
	end
	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
	def custom_date date
		begin
			l date.to_date, format: :short
		rescue 
			date
		end
	end
	def person_license_valid person
		begin
			if person.blank? or person.license.blank? or person.license.expiration.to_date < Date.today
				"<i class='material-icons red-text f20'>close</i>".html_safe
			else
				"<i class='material-icons green-text f20'>check</i>".html_safe
			end
		rescue
			"<i class='material-icons red-text f20'>close</i>".html_safe
		end
	end
	def get_cost start_date, end_date, automobile_cost
		days = end_date-start_date
		automobile_cost*days
	end
end
