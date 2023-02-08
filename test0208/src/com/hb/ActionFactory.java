package com.hb;

public class ActionFactory {
	public Action getAction(String cmd) {
		Action action = null;
		switch(cmd) {
		case "login":
			action = new loginPage();
			break;
		case "main":
			action = new mainPage();
			break;
		case "admin":
			action = new adminPage();
			break;
		case "signup":
			action = new signupPage();
			break;
		case "adminEdit":
			action = new adminEditPage();
			break;
		case "signupInsert":
			action = new signupInsert();
			break;
		case "loginCheck":
			action = new loginCheck();
			break;
		case "buy":
			action = new buy();
			break;
		}
		return action;
	}
}
