package DAO;

import java.io.Serializable;

import Models.Account;

public interface IAccountDao extends Serializable{

	public Account findByUsername(String username);
	void insert(Account account);
	boolean checkExistUsername(String username);
	boolean activateByToken(String token);
}
