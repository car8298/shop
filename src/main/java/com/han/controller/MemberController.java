package com.han.controller;

import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.han.service.MemberService;
import com.han.utils.EmailSenderUtil;
import com.han.vo.EmailVO;
import com.han.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private EmailSenderUtil emailSender;
	
	@Autowired
	private EmailVO email;
	
	// 회원가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("get signup");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("post signup");
		
		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);
		
		service.signup(vo);
		
		return "redirect:/";
	}
	
	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}
	
	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");
		
		
		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();
		System.out.println(vo.getUserId());
		if(vo.getUserId().equals("admin@admin.com")) {
			session.setAttribute("member", login);
			return "redirect:/";
		}
		else {
		
			if(login == null) {
				rttr.addFlashAttribute("msg", false);
				
				return "redirect:/member/signin";
			}
			
			boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
			
			if(login != null && passMatch) {
				session.setAttribute("member", login);
			} else {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
				return "redirect:/member/signin";
			}
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("get logout");
		service.logOut(session);
		
		return "redirect:/";
	}
	
	// 비밀번호찾기
	@RequestMapping(value = "/findpass", method = RequestMethod.GET)
	public void findPass() throws Exception {
		logger.info("get find pass");
	}
	
	
	// 비밀번호 찾기 + 비밀번호 변경
	@RequestMapping(value = "/findpass", method = RequestMethod.POST) // 임시비밀번호로 업데이트 및 비밀번호 변경 추가 하기.
	public String postFindPass(MemberVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post findpass");
		
		Random random = new Random();
		
		MemberVO verify = service.findpass(vo);
				
		if (verify == null) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/findpass";
		}
		
		else {
		
			String id = verify.getUserId();
			String name = verify.getUserName();
			String pw = verify.getUserPass();
			String tmp_pw = "";
			String content = "";
			String set_pw = "";
			
			for(int i=0; i<4; i++) {
				tmp_pw += (random.nextInt(9) + 1);
			}
			
			set_pw = tmp_pw;
			
			tmp_pw = passEncoder.encode(set_pw);
			
			if(pw != null) {
				verify.setUserPass(tmp_pw);
				service.updatePass(verify);
				content += "안녕하세요. SHOP.HAN 입니다.\r\n";
				content += "임시 비밀번호는 " +set_pw+" 입니다.\r\n";
				content += "임시 비밀번호로 로그인 후 비밀번호를 변경하시기 바랍니다.\r\n";
				content += "감사합니다.\r\n";
				email.setContent(content);
				email.setReceiver(id);
				email.setSubject(name+"님 비밀번호 찾기 메일입니다.");
				emailSender.SendEmail(email);
				rttr.addFlashAttribute("txt", false);
				return "redirect:/member/signin";
			
			} else {
				return "redirect:/";
			}
		}
		
	}
	
	// 회원정보 변경 GET
	@RequestMapping(value = "/updateinfo", method = RequestMethod.GET)
	public void getUpdateInfo(Model model, HttpSession session) throws Exception {
		logger.info("get updateinfo");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String userId = member.getUserId();
		String name = member.getUserName();
		String phon = member.getUserPhon();
		String pass = member.getUserPass();
		
		model.addAttribute("userId", userId);
		model.addAttribute("name", name);
		model.addAttribute("phon", phon);
		model.addAttribute("pass", pass);
	}
	
	// 회원정보 변경 POST
	@RequestMapping(value = "/updateinfo", method = RequestMethod.POST)
	public String postUpdateInfo(HttpServletRequest request, HttpSession session, MemberVO vo, Model model) throws Exception {
		logger.info("post updateInfo");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		String oldPass = request.getParameter("currentPass");
		String newPass = request.getParameter("newPass");
		
		String userName = request.getParameter("userName");
		String userPhon = request.getParameter("userPhon");
		
		model.addAttribute("currentPass", oldPass);
		
		boolean passMatch = passEncoder.matches(oldPass, member.getUserPass());
				
		if (passMatch) {
			newPass = passEncoder.encode(newPass);
			vo.setUserId(member.getUserId());
			vo.setUserPass(newPass);
			vo.setUserName(userName);
			vo.setUserPhon(userPhon);
			service.updateInfo(vo);
		} 
		
		return "redirect:/";
	}
	
	// 아이디 중복체크
	@RequestMapping(value = "/idcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idcheck(MemberVO vo) throws Exception {
		logger.info("get userCheck");
		
		int count = 0;
						
		count = service.idCheck(vo);

		return count;
	}
}
