class ContactController {

    MailService mailService
	
	def static allowedMethods = [bestMan:'GET', witness:'GET', send:'POST']	
	
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
			String recepient = ""
		
			if (params.redir == 'bestMan') {
				log.debug('Versuche Mailtexte für den Trauzeugen zu lesen')				
				subject = message(code:'mail.contact.bestman.subject', args:[cmd.email])				
				recepient = User.findByNickname('mats').email
			}
			else
			{
				log.debug('Versuche Mailtexte für die Trauzeugin zu lesen')				
				subject = message(code:'mail.contact.witness.subject', args:[cmd.email])
				recepient = User.findByNickname('carmen').email
			}
			
			body = cmd.message
			
			log.debug("Emailadresse des Trauzeugen ist ${recepient}")
			log.debug("Subject text ist: ${subject}")
			log.debug("Mailbody ist: ${body}")
			
			// send mail to witness/bestman
			try 
			{
				mailService.sendMail("saw@silviowangler.ch", [recepient], subject, body)
				log.info("Trauzeugen Mail erfolgreich versandt")
				
				// send mail to customer
				log.info("Versuche Mail an den Kontakt zu schicken")
				
				body = message(code:'mail.contact.customer', args:[cmd.name])
				subject = message(code:'mail.contact.customer.subject', args:[])
				recepient = cmd.email
				
				mailService.sendMail("saw@silviowangler.ch", [recepient], subject, body)
				log.info("Kontakt Mail erfolgreich versandt")
				
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