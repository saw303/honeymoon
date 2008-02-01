class LoginController {

	def allowedMethods = [index:'GET', login:'POST']	

    def index = { render(view:'login')}
	
	def login = { LoginCommand cmd ->
		
		if (! cmd.hasErrors()) 
		{
			User u = User.findByNickname(params.name)
			
			if (u && u.password == params.password && ! u.locked) 
			{
				session.user = u
				render(view:'success')
			}
			else
			{
				flash.message = 'Benutzerdaten sind nicht richtig'
				redirect(view:'login', model:[cmd: cmd])
			}
		}
		else
		{
			render(view:'login', model:[cmd: cmd])
		}
	}
	
	def logout =  {
		session.user = null
		redirect(uri:"/")
	}
}

class LoginCommand {
	String name
	String password
	
	static constraints = {
		name(blank:false)
		password(blank:false)
	}
	
	public String toString() {
		return "${name} / ${password}"
	}
}