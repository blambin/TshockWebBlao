package org.blambin.common.exception.resolver;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class PlatformMappingExceptionResolver extends SimpleMappingExceptionResolver {

	static Logger logger = LoggerFactory.getLogger(PlatformMappingExceptionResolver.class);
	
	Properties mappings;
	
	@Override
	protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		
		//InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("exception.properties");
		
		
		try {
			mappings = PropertiesLoaderUtils.loadAllProperties("exception.properties");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		setExceptionMappings(mappings);
		
		String viewName = determineViewName(ex, request);
		if (viewName != null) {
			return getModelAndView(viewName, ex, request);	
		}
		return null;
		
	}

	
}
