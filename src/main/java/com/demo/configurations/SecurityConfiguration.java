package com.demo.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.demo.entities.SignIn;
import com.demo.security.oauth2.CustomOAuth2UserService;
import com.demo.security.oauth2.OAuth2LoginSuccessHandler;
import com.demo.services.AccountService;
import com.demo.services.SignInService;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private SignInService signInService ; 
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.cors().and().csrf().disable() ; 
		
		http.authorizeRequests()
			.antMatchers("/user/**").permitAll() 
			.antMatchers("/oauth2/**").permitAll() 
			
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.and()
			.formLogin()
				.loginPage("/user/login/login")
				.permitAll()
				.loginProcessingUrl("/user/login/processlogin") 
				.defaultSuccessUrl("/user/home/index?local") 
				.failureUrl("/user/login/login?error")
				.usernameParameter("email")
				.passwordParameter("password")
				
			.and()
			.oauth2Login()
				.loginPage("/user/login/login")
				.userInfoEndpoint()
					.userService(oauth2UserService)
				.and()
				.successHandler(auth2LoginSuccessHandler)
			.and()			
			.exceptionHandling().accessDeniedPage("/user/login/notfound")
			.and()
			.logout().logoutUrl("/user/login/logout")
			.logoutSuccessUrl("/user/login/login?logout")
			;
	}	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(accountService);
	}
	
	
	
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private CustomOAuth2UserService oauth2UserService ;
	
	@Autowired
	private OAuth2LoginSuccessHandler auth2LoginSuccessHandler ; 
}
