import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import javax.mail.internet.InternetAddress;

class MailService {

	JavaMailSender mailSender
	
    boolean transactional = false

    public synchronized void sendMail(String sender, String recepient, String subject, String message) throws MailException {
	
		def recepients = [recepient]
	
		SimpleMailMessage msg = new SimpleMailMessage()
		msg.to = recepients
		msg.from = sender
		msg.subject = subject
		msg.text = message
		
		println(msg.toString())
		
		mailSender.send(msg)
    }
}