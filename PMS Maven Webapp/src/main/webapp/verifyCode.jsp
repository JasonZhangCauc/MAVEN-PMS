<!-- 验证码图片设置 -->
<%@ page language="java"   import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"  pageEncoding="UTF-8"%>  
<%
    //设置页面不缓存   
	response.setHeader("Pragma", "No-cache");   
	response.setHeader("Cache-Control", "no-cache");   
	response.setDateHeader("Expires", 0);   
	String chose = "1111";
	char display[] = { '0', ' ', '0', ' ', '0', ' ', '0' };   
	char ran[] = {'0', '0', '0', '0' };   
	char temp;   
	
	Random rand = new Random();   
	
	for (int i = 0; i < 4; i++) {   
	
	   temp = chose.charAt(rand.nextInt(chose.length()));   
	
	   display[i * 2] = temp;   
	
	   ran[i] = temp;   
	}   
	
	String random = String.valueOf(display);   
	  
	int width = 120, height = 35;   
	BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);   
	Graphics g = image.getGraphics();   
	//以下填充背景颜色   
	
	g.setColor(new Color(206,207,207));
	
	g.fillRect(0, 0, width, height);   
	//设置字体颜色   
	g.setColor(Color.DARK_GRAY);   
	Font font = new Font("Arial", Font.PLAIN, 28);   
	g.setFont(font);   
	g.drawString(random, 20, 25);   
	//产生随机线条   
	for (int i = 0; i < 10; i++) {   
	    int x = rand.nextInt(width - 1);   
	    int y = rand.nextInt(height - 1);   
	    int x1 = rand.nextInt(6) + 1;   
	    int y1 = rand.nextInt(12) + 1;   
	    g.drawLine(x, y, x + x1, y + y1);   
	}   
	  
	g.dispose();   
	  
	//去掉验证码中的空格   
	String [] interceptString = random.split(" ");   
	String returnVerifyCode = "";   
	for(int i = 0;i<interceptString.length;i++){   
	    returnVerifyCode += interceptString[i];   
	}   
	session.setAttribute("verifyCode", returnVerifyCode);
	response.setContentType("image/jpeg");
	 
	response.reset();//必须，否则不显示
	ServletOutputStream outs = response.getOutputStream();	
	ImageIO.write(image, "JPEG", outs); 
	outs.flush();
	outs.close();
	outs=null;
	response.flushBuffer();
	out.clear();
	out = pageContext.pushBody();

%>