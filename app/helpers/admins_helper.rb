module AdminsHelper
	def text_for_validation_status(validated)
		validated ? "Valid" : "Invalid / Not Yet Validated"
	end
end
