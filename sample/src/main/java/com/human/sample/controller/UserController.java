package com.human.sample.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.sample.entity.User;
import com.human.sample.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired private UserService userService;

	@ResponseBody
	@GetMapping(value = {"/update/{uid}", "update"})
	public String updateForm(@PathVariable(required = false) String uid) {
		if (uid == null)
			return "redirect:/user/login";
		User user = userService.getUser(uid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("uid", user.getUid());
		jsonObject.put("uname", user.getUname());
		jsonObject.put("email", user.getEmail());
		return jsonObject.toJSONString();
	}
	
	@PostMapping("/update")
	public String updateProc(String pwd, String pwd2, String uname, 
							 String email, HttpSession session, Model model) {
		String sessUid = (String) session.getAttribute("sessUid");
		if (sessUid == null)
			return "redirect:/user/login";
		
		User user = userService.getUser(sessUid);
		// System.out.println("pwd=" + pwd + ", pwd2=" + pwd2);
		if (pwd.length() >= 4 && pwd.equals(pwd2)) {
			String hashedPwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
			user.setPwd(hashedPwd);
		} else if (pwd.equals("") && pwd2.equals("")) {
			;				// 아무일도 하지 않는다
		} else {
			model.addAttribute("msg", "패스워드를 다시 입력하고 수정하세요.");
			model.addAttribute("url", "/sample/user/list/" + session.getAttribute("currentUserPage"));
			return "common/alertMsg";
		}
		user.setUname(uname);
		user.setEmail(email);
		userService.updateUser(user);
		
		return "redirect:/user/list/" + session.getAttribute("currentUserPage");
	}
	
	@GetMapping("/delete/{uid}")
	public String delete(@PathVariable String uid, HttpSession session) {
		String sessUid = (String) session.getAttribute("sessUid");
		if (sessUid == null)
			return "redirect:/user/login";
		userService.deleteUser(uid);
		return "redirect:/user/list/" + session.getAttribute("currentUserPage");
	}
	
	@GetMapping("/list/{page}")
	public String list(@PathVariable int page, HttpSession session, Model model) {
		List<User> list = userService.getUserList(page);
		model.addAttribute("userList", list);
		
		int totalUsers = userService.getUserCount();
		int totalPages = (int) Math.ceil((double)totalUsers / userService.RECORDS_PER_PAGE);
		List<String> pageList = new ArrayList<>();
		for (int i=1; i<=totalPages; i++)
			pageList.add(String.valueOf(i));
		model.addAttribute("pageList", pageList);
		session.setAttribute("currentUserPage", page);
		model.addAttribute("menu", "user");
		
		return "user/list";
	}
	
	
	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String loginProc(String uid, String pwd, HttpSession session, Model model) {
		int result = userService.login(uid, pwd);
		if (result == userService.CORRECT_LOGIN) {
			session.setAttribute("sessUid", uid);
			User user = userService.getUser(uid);
			session.setAttribute("sessUname", user.getUname());
			session.setAttribute("sessEmail", user.getEmail());
			
			// 환영 메세지
			model.addAttribute("msg", user.getUname() + "님 환영합니다.");
			model.addAttribute("url", "/sample/home");
		} else if (result == userService.WRONG_PASSWORD) {
			model.addAttribute("msg", "패스워드 입력이 잘못되었습니다.");
			model.addAttribute("url", "/sample/user/login");
		} else {		// UID_NOT_EXIST
			model.addAttribute("msg", "ID 입력이 잘못되었습니다.");
			model.addAttribute("url", "/sample/user/login");
		}
		return "common/alertMsg";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}
	
	@GetMapping("/register")
	public String registerForm() {
		return "user/register";
	}
	
	@PostMapping("/register")
	public String registerProc(String uid, String pwd, String pwd2, 
								String uname, String email, Model model) {
		if (userService.getUser(uid) != null) {
			model.addAttribute("msg", "사용자 ID가 중복되었습니다.");
			model.addAttribute("url", "/sample/user/register");
		}
		if (pwd.equals(pwd2) && pwd.length() >= 4) {	// pwd와 pwd2가 같고, 길이가 4이상이면
			String hashedPwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
			User user = new User(uid, hashedPwd, uname, email);
			userService.insertUser(user);
			model.addAttribute("msg", "등록을 마쳤습니다. 로그인 하세요.");
			model.addAttribute("url", "/sample/user/login");
		} else {
			model.addAttribute("msg", "패스워드 입력이 잘못되었습니다.");
			model.addAttribute("url", "/sample/user/register");
		}
		return "common/alertMsg";
	}
	
}
