package com.han.utils;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.han.vo.EmailVO;

public class EmailSenderUtil {
	
	@Autowired
	protected JavaMailSender mailSender;
	public void SendEmail(EmailVO email) throws Exception {
		
		MimeMessage msg = mailSender.createMimeMessage();
		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(RecipientType.TO , InternetAddress.parse(email.getReceiver()));
		} catch(MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		try {
			mailSender.send(msg);
		} catch(MailException e) {
			System.out.println("mailException Generate!");
			e.printStackTrace();
		}
	}
}


