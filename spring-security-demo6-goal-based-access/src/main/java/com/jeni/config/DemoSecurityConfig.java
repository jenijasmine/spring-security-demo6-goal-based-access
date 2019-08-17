package com.jeni.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub

		@SuppressWarnings("deprecation")
		UserBuilder users = User.withDefaultPasswordEncoder();

		auth.inMemoryAuthentication().withUser(users.username("amit").password("test123").roles("MANAGER","EMPLOYEE","SUPERVISOR"))
				.withUser(users.username("payal").password("test123").roles("EMPLOYEE","SUPERVISOR"))
				.withUser(users.username("priya").password("test123").roles("ADMIN","EMPLOYEE"));
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http.authorizeRequests()
			.antMatchers("/").hasRole("EMPLOYEE")
			.antMatchers("/leaders").hasRole("MANAGER")
			.antMatchers("/systems/**").hasRole("ADMIN")
			.antMatchers("/supervisors").hasRole("SUPERVISOR")
			.and()
			.formLogin()
				.loginPage("/showMyLoginPage")
				.loginProcessingUrl("/authenticateTheUser")
				.permitAll()
			.and()
			.logout()
				.permitAll()
			.and()
				.exceptionHandling()
				.accessDeniedPage("/access-denied");
				
	}

}
