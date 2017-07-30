package com.lanshiqin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import com.lanshiqin.filter.HTTPFilter;

@SpringBootApplication
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class CmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(CmsApplication.class, args);
	}
	
	@Bean
    public FilterRegistrationBean  filterBean() {  
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();  
        HTTPFilter httpFilter = new HTTPFilter();
        registrationBean.setFilter(httpFilter);  
        List<String> urlPatterns = new ArrayList<String>();  
        urlPatterns.add("/*");
        registrationBean.setUrlPatterns(urlPatterns);  
        return registrationBean;
    }
}
