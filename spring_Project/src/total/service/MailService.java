package total.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	@Autowired
	JavaMailSender mailSender;
	
	public boolean sendWelcomeMail(String target) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			// 받을 사람
			message.setRecipient(RecipientType.TO, new InternetAddress(target));
			// 보내는 이.. 구글 서버같은 경우 이 설정을 무시함.
			message.setFrom(new InternetAddress("admin@spring.io"));
			// 제목
			message.setSubject("[Member]가입을 축하드립니다.");
			// 내용
			String content = "가입을 축하드립니다.<br/>회원의 lv은 1이 되겠습니다.";
			content+="<a href=\"http://192.168.10.82/chap05\">사이트 둘러보기</a>";
			message.setContent(content, "text/plain;charset=utf-8");
			// content 설정을 text/plain;charset=utf-8로 보내면 HTML로 보낼 수 도 있지만 html형식을 String으로 짜야 한다는 번거로움이 있다.
			
			mailSender.send(message);
			return true;
		}catch(MessagingException e) {// 사용자 이메일 주소가 없을 시 MessagingException
			e.printStackTrace();
			return false;
		}
	}
}
