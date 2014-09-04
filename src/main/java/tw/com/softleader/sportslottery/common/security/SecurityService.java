package tw.com.softleader.sportslottery.common.security;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class SecurityService implements UserDetailsService {
	
	private Logger log = LoggerFactory.getLogger(SecurityService.class);
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		
		log.debug("username = {}", username);
		
		ArrayList<Manager> managers = new ArrayList<Manager>();
		managers.add(new Manager("admin", "admin"));
		
		for (Manager manager : managers) {
			if (manager.getUsername().equals(username)) {
				return manager;
			}
		}
		throw new UsernameNotFoundException("Error Manager");
	}

}
