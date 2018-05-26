package edu.mum.onlineshoping.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.validation.constraints.Size;
import edu.mum.onlineshoping.validation.UsernameUnique;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class User {
	@javax.persistence.Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@NotEmpty
	@UsernameUnique
	private String username;
	@NotEmpty
	@Size(min=5)
	private String password;
	@Enumerated(EnumType.STRING)
	private Role hasRole;
	private boolean enabled;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String userName) {
		this.username = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Role getHasRole() {
		return hasRole;
	}
	public void setHasRole(Role hasRole) {
		this.hasRole = hasRole;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
}
