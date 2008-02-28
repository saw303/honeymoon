import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;

class MailService {

	JavaMailSender mailSender
	
    boolean transactional = false

    public void sendMail(String sender, String recepient, String subject, String message) throws MailException {
	
		def recepients = [recepient]
	
		SimpleMailMessage msg = new SimpleMailMessage()
		msg.to = recepients
		msg.from = sender
		msg.replyTo = sender
		msg.bcc = ['silvio.wangler@gmail.com']
		msg.subject = subject
		msg.text = message
		
		println(msg.toString())
		
		mailSender.send(msg)
    }
}