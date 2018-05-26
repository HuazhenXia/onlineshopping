package edu.mum.onlineshoping.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	CustomSuccessHandler customSuccessHandler;
	@Autowired
	DataSource dataSource;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
		.authorizeRequests()
		.antMatchers("/vendor/**").access("hasRole('VENDOR')")
		.antMatchers("/user/**").access("hasRole('USER')").antMatchers("/admin/**")
				.access("hasRole('ADMIN')").antMatchers("/", "/home","/register/**","/index","/vendorRegister").permitAll().anyRequest().authenticated()
				.and()
				.formLogin()
				.loginPage("/login")
//				.failureUrl("/login?error")
				.permitAll()
				.successHandler(customSuccessHandler)
				.and()
				.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/login").permitAll();
//		http.rememberMe().rememberMeParameter("rememberMe");
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		auth.inMemoryAuthentication().withUser("admin").password("123").roles("ADMIN");
//		auth.inMemoryAuthentication().withUser("user@gmail.com").password("123").roles("USER");
//		auth.inMemoryAuthentication().withUser("channing@gmail.com").password("12345").roles("USER");
		auth.jdbcAuthentication().dataSource(dataSource)
		.passwordEncoder( new BCryptPasswordEncoder())
		.usersByUsernameQuery(
				"select username, password, enabled from user where username=?")
		.authoritiesByUsernameQuery(
				"select username, has_role from user where username=? ");
	}
	
	@Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/fonts/**");
        web.ignoring().antMatchers("/js/**");
        web.ignoring().antMatchers("/images/**");
    }
}