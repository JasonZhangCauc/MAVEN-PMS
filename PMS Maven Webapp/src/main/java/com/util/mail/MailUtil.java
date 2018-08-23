package com.util.mail;

import java.io.IOException;
import java.util.Map;

import javax.mail.MessagingException;

import freemarker.template.TemplateException;

/**
 * 邮件发送工具类
 * 
 * @date 2017年4月26日 下午2:52:06
 * @author 周敏
 * @Description:
 * @project mailUtil
 */
public class MailUtil {

	/**
	 * 根据模板名称查找模板，加载模板内容后发送邮件
	 * 
	 * @date 2017年4月26日 下午2:52:06
	 * @author 周敏
	 * @param receiver  收件人地址
	 * @param subject  邮件主题
	 * @param map 邮件内容与模板内容转换对象
	 * @param templateName 模板文件名称
	 * @throws IOException
	 * @throws TemplateException
	 * @throws MessagingException
	 * @Description:
	 * @return void
	 */
	public static void sendMailByTemplate(String receiver, String subject,
			Map<String, String> map, String templateName) throws IOException,
			TemplateException, MessagingException {
		String maiBody = "";
		String server = MailLoader.getServer();
		String sender = MailLoader.getSender();
		String username = MailLoader.getUsername();
		String password = MailLoader.getPassword();
		String nickname = MailLoader.getNickname();
		MailSender mail = new MailSender(server);
		mail.setNeedAuth(true);
		mail.setNamePass(username, password, nickname);
		maiBody = MailFactory.generateHtmlFromFtl(templateName, map);
		mail.setSubject(subject);
		mail.setBody(maiBody);
		mail.setReceiver(receiver);
		mail.setSender(sender);
		mail.sendout();
	}

	/**
	 * 根据模板名称查找模板，加载模板内容后发送邮件
	 * 
	 * @date 2017年4月26日 下午2:52:06
	 * @author 周敏
	 * @param receiver 收件人地址
	 * @param subject  邮件主题
	 * @param map  邮件内容与模板内容转换对象
	 * @param templateName  模板文件名称
	 * @throws IOException
	 * @throws TemplateException
	 * @throws MessagingException
	 * @Description:
	 * @return void
	 */
	public static void sendMailAndFileByTemplate(String receiver,
			String subject, String filePath, Map<String, String> map,
			String templateName) throws IOException, TemplateException,
			MessagingException {
		String maiBody = "";
		String server = MailLoader.getServer();
		String sender = MailLoader.getSender();
		String username = MailLoader.getUsername();
		String password = MailLoader.getPassword();
		String nickname = MailLoader.getNickname();
		MailSender mail = new MailSender(server);
		mail.setNeedAuth(true);
		mail.setNamePass(username, password, nickname);
		maiBody = MailFactory.generateHtmlFromFtl(templateName, map);
		mail.setSubject(subject);
		mail.addFileAffix(filePath);
		mail.setBody(maiBody);
		mail.setReceiver(receiver);
		mail.setSender(sender);
		mail.sendout();
	}

	/**
	 * 普通方式发送邮件内容
	 * 
	 * @date 2017年4月26日 下午2:52:06
	 * @author 周敏
	 * @param receiver 收件人地址
	 * @param subject  邮件主题
	 * @param maiBody 邮件正文
	 * @throws IOException
	 * @throws MessagingException
	 * @Description:
	 * @return void
	 */
	public static boolean sendMail(String receiver, String subject, String maiBody)
			throws IOException, MessagingException {
		try {
			//指定系统属性值
			//System.setProperty("java.net.preferIPv4Stack", "true");
			//System.setProperty("java.net.preferIPv6Addresses", "true");
			String server = MailLoader.getServer();
			String sender = MailLoader.getSender();
			String username = MailLoader.getUsername();
			String password = MailLoader.getPassword();
			String nickname = MailLoader.getNickname();
			MailSender mail = new MailSender(server);
			mail.setNeedAuth(true);
			mail.setNamePass(username, password, nickname);
			mail.setSubject(subject);
			mail.setBody(maiBody);
			mail.setReceiver(receiver);
			mail.setSender(sender);
			mail.sendout();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	/**
	 * 普通方式发送邮件内容，并且附带文件附件
	 * 
	 * @date 2017年4月26日 下午2:52:06
	 * @author 周敏
	 * @param receiver 收件人地址
	 * @param subject 邮件主题
	 * @param filePath 文件的绝对路径
	 * @param maiBody  邮件正文
	 * @throws IOException
	 * @throws MessagingException
	 * @Description:
	 * @return void
	 */
	public static void sendMailAndFile(String receiver, String subject,
			String filePath, String maiBody) throws IOException,
			MessagingException {
		String server = MailLoader.getServer();
		String sender = MailLoader.getSender();
		String username = MailLoader.getUsername();
		String password = MailLoader.getPassword();
		String nickname = MailLoader.getNickname();
		MailSender mail = new MailSender(server);
		mail.setNeedAuth(true);
		mail.setNamePass(username, password, nickname);
		mail.setSubject(subject);
		mail.setBody(maiBody);
		mail.addFileAffix(filePath);
		mail.setReceiver(receiver);
		mail.setSender(sender);
		mail.sendout();
	}
}
