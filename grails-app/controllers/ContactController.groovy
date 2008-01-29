class ContactController {    
	
	def allowedMethods = [bestMan:'GET', witness:'GET']
	def types = [bestman:1, witness: 2]
	
	def bestMan = {	
		render( view:'contact', model:[type:types['bestman']])
	}
	
	def witness = {	
		render( view:'contact', model:[type:types['witness']])
	}
	
	
}