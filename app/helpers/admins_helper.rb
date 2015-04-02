module AdminsHelper
	def text_for_validation_status(validated)
		validated ? "Validated" : "Not Yet Validated"
	end
end
