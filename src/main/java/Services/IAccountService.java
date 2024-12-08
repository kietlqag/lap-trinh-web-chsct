package Services;

import java.io.Serializable;

import Models.Account;

public interface IAccountService extends Serializable{

	public Account findByUsername(String username);
	public Account Login(String username, String password, String role);
	boolean register(String email, String username, String password, String role, String token);
	boolean checkExistUsername(String username);
	boolean activateAccount(String token);
}
