class ContactController {

    MailService mailService		
	
	def allowedMethods = [bestMan:'GET', witness:'GET', send:'POST']	
	
	def bestMan = {	
		render( view:'contact', model:[redir:'bestMan'])
	}
	
	def witness = {	
		render( view:'contact', model:[redir:'witness'])
	}
	
	def send = { ContactCommand cmd ->
	
		println(cmd)
		println("MailService got injected? ${mailService != null}")
		
		if (cmd.hasErrors())
		{
			println("fehler. Redirect to action: ${params.redir}")
			if (params.redir == 'bestMan')
			{
				redirect(controller:"contact",action:"bestMan")				
			}
			else
			{				
				redirect(controller:"contact",action:"witness")				
			}
		}
		else
		{
			println("keine fehler")
			// send mail
			try {
				mailService.sendMail(cmd.email, "silvio.wangler@gmail.com", 'test', 'noch ein test')
				render(view:'success')
			}
			catch(Exception e) {			
				render(view:'failed')
			}
		}
	}
}

class ContactCommand {
	String name
	String email
	String message
	
	static constraints = {
		name(blank: false)
		email(email: true)
		message(blank:false)
	}
	
	public String toString()
	{
		return "${name} - ${email} - ${message}"
	}
}