class AppFilters {
	def filters = {
		loginCheck(controller:'*', action:'delete') {
			before = {
				
				if (! session.user) {					
					redirect(controller:"login")					
					return false
				}
			}
		}
	}
}