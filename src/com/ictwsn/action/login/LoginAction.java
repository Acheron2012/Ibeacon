package com.ictwsn.action.login;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ictwsn.bean.RoleBean;
import com.ictwsn.service.login.LoginService;
import com.ictwsn.util.GetHttp;


/**
 * 系统用户登录控制类
 * @author YangYanan
 * @desc 包含系统用户登录注销的请求处理
 * @date 2017-8-18
 */
@Controller
public class LoginAction{

	static Logger logger = Logger.getLogger(LoginAction.class.getName());

	@Resource LoginService lService;	
	/**
	 * 登录请求
	 * @param request
	 * @param session
	 * @param model
	 * @param userName 用户名
	 * @param password 密码
	 * @param roleName
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(value="userName",required=false) String userName,
			@RequestParam(value="password",required=true) String password,
			@RequestParam(value="roleName",required=true) String roleName) throws UnsupportedEncodingException{
			request.setCharacterEncoding("UTF-8");
		try{
			if(session.getAttribute("RoleBean")!=null){
				return GetHttp.isMobileDevice(request)?"pages/manageCenter":"MobilePages/manageCenter";
			}
			RoleBean rb=lService.Login(userName,password,roleName); //获取登录的用户权限
			if(rb.getAuthroity()!=null&&!rb.getAuthroity().equals("")){
				session.setAttribute("RoleBean",rb);
				return GetHttp.isMobileDevice(request)?"pages/manageCenter":"MobilePages/manageCenter";
			}else{
				model.addAttribute("message","-1");//用户名或者密码错误
				model.addAttribute("userName",userName);
				model.addAttribute("password",password);
				return "login";
			}

		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			return "pages/error/404";
		}


	}
	@RequestMapping("/logoff.do")
	public String logoff(HttpServletRequest request,HttpSession session){
		try{
			session.removeAttribute("RoleBean");
			return "redirect:/login.jsp";
		}catch(Exception e){
			logger.error("logoff error"+e);
			e.printStackTrace();
			return "pages/error/404";
		}


	}



}
