module AdminsHelper
	def text_for_validation_status(validated)
		validated ? "Invalidate" : "Validate"
	end
end
