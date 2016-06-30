package org.blambin.common;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/***
 * 根据图片地址转换成对对应的base64编码
 * @author blambin
 *
 */
public class imgTag extends SimpleTagSupport{

	private String imgAddress;
	String realPath ;
	String baseCode ;
	
	Logger logger = LoggerFactory.getLogger(imgTag.class);
	
	/***
	 * 设置图片地址
	 * @author blambin
	 * @since 2016年6月27日
	 * @category TODO:
	 * @throws 
	 * @param imgAddress
	 * void
	 */
	public void setImgAddress(String imgAddress) {
		this.imgAddress = imgAddress;
	}


	

	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		JspWriter out = getJspContext().getOut();
		
		HttpSession session=((PageContext)this.getJspContext()).getSession();
		realPath = session.getServletContext().getRealPath("/");
		
		//记录图片地址 
		//logger.info(realPath+imgAddress);
		
		baseCode = ImageBase64Util.convertImageToByte(realPath+imgAddress, "png");
		
		//logger.info(baseCode);
		
		out.print(baseCode);
		out.flush();
		
		
	}
	
	
}
