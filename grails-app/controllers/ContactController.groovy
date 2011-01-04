import ch.silviowangler.honeymoon.User

class ContactController {
  def static allowedMethods = [bestMan: 'GET', witness: 'GET', send: 'POST']

  def bestMan = {
    render(view: 'contact', model: [redir: 'bestMan'])
  }

  def witness = {
    render(view: 'contact', model: [redir: 'witness'])
  }

  def send = {ContactCommand cmd ->

    log.debug(cmd)

    if (cmd.hasErrors()) {
      log.debug("fehler. Redirect to action: ${params.redir}")
      if (params.redir == 'bestMan') {
        redirect(controller: "contact", action: "bestMan")
      }
      else {
        redirect(controller: "contact", action: "witness")
      }
    }
    else {
      String messageSubject = ""
      String messageBody = ""
      String recipient = ""

      if (params.redir == 'bestMan') {
        log.debug('Versuche Mailtexte für den Trauzeugen zu lesen')
        messageSubject = message(code: 'mail.contact.bestman.subject', args: [cmd.email])
        recipient = User.findByNickname(grailsApplication.config.honeymoon.bestman).email
      }
      else {
        log.debug('Versuche Mailtexte für die Trauzeugin zu lesen')
        messageSubject = message(code: 'mail.contact.witness.subject', args: [cmd.email])
        recipient = User.findByNickname(grailsApplication.config.honeymoon.bridesmaid).email
      }

      messageBody = cmd.message

      log.debug("Emailadresse des Trauzeugen ist ${recipient}")
      log.debug("Subject text ist: ${messageSubject}")
      log.debug("Mailbody ist: ${messageBody}")

      // send mail to witness/bestman
      try {
        sendMail {
          to([recipient].toArray())
          bcc 'silvio.wangler@gmail.com'
          subject messageSubject
          body messageBody
        }
        log.info("Trauzeugen Mail erfolgreich versandt")

        // send mail to customer
        log.info("Versuche Mail an den Kontakt (${cmd.email}) zu schicken")

        messageBody = message(code: 'mail.contact.customer', args: [cmd.name])
        messageSubject = message(code: 'mail.contact.customer.subject', args: [])
        recipient = cmd.email

        sendMail {
          to([recipient].toArray())
          bcc 'silvio.wangler@gmail.com'
          subject messageSubject
          body messageBody
        }

        log.info("Kontakt Mail erfolgreich versandt")

        render(view: 'success')
      }
      catch (Exception e) {
        log.error("Mail konnte nicht versandt werden. ${e.getMessage()}", e)
        render(view: 'failed')
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
    message(blank: false)
  }

  public String toString() {
    return "${name} - ${email} - ${message}"
  }
}