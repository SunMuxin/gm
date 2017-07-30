package com.lanshiqin.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Created by 蓝士钦 on 2017/5/2.
 * 自定义web安全配置
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    /**
     * 定义校验规则
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

    }

    /**
     * 定义安全策略
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        /* http.authorizeRequests().antMatchers("/","/manager","/css/*","/js/*","font/*","/fonts/*","/avatars/*","/about","/article/allArticle").permitAll() // 定义不需要验证的请求
                .anyRequest().authenticated()   // 其余的需要验证
                .and().logout().permitAll() // 定义退出不需要验证
                .and().formLogin().loginPage("/login").permitAll(); // 定义登录页面
                */
    	http.csrf().disable();
    }
}
