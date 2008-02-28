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
	
		log.debug(cmd)
		log.debug("MailService got injected? ${mailService != null}")
		
		if (cmd.hasErrors())
		{
			log.debug("fehler. Redirect to action: ${params.redir}")
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
			String subject = ""
			String body = ""
		
			if (params.redir == 'bestMan') {
				log.debug('Versuche Mailtexte für den Trauzeugen zu lesen')
				body = message(code:'mail.contact.bestman', args:[])
				subject = message(code:'mail.contact.bestman.subject', args:[cmd.email])				
			}
			else
			{
				log.debug('Versuche Mailtexte für die Trauzeugin zu lesen')
				body = message('mail.contact.witness', args:[])
				subject = message('mail.contact.witness.subject', args:[cmd.email])
			}
			
			log.debug("Subject text ist: ${subject}")
			log.debug("Mailbody ist: ${body}")
			
			// send mail
			try 
			{
				mailService.sendMail("saw@silviowangler.ch", "silvio.wangler@gmail.com", subject, body)
				log.info("mail erfolgreich versandt")
				render(view:'success')
			}
			catch(Exception e) 
			{
                log.error("Mail konnte nicht versandt werden. ${e.getMessage()}")
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