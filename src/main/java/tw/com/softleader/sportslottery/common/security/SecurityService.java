package tw.com.softleader.sportslottery.common.security;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class SecurityService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		
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
