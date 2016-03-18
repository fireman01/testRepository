package com.user.controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;












import com.common.util.FormDataCollectUtil;
import com.user.service.UserService;


	@Controller
	@RequestMapping("/user")
	public class UserController {
		@Resource
		private UserService userService;
		
		
		/**
		 *   <p>【跳转到注册页面】</p>
		 *
		 * @author 林军雄  2014年12月2日 
		 *
		 * @param request
		 * @return
		 */
		@RequestMapping("/register")
		public  String register(HttpServletRequest request){
			
			return "user/register";
			
		}
		
		@RequestMapping("/bindUser")
		public  String bindUser(HttpServletRequest request){
			Object obj = request.getParameterMap();
			System.out.println(obj);
			return "user/bindUser";
			
		}
		
		
		
		@RequestMapping("/user_check")
		public  void check(HttpServletRequest request,HttpServletResponse response) throws IOException{
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request); 
			String result = userService.checkUser(map);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
			
		}
		@RequestMapping("/add_user")
		public  void addUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request); 
			String result = userService.saveUser(map);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
			
		}
		@RequestMapping("showUser")
		public String showUser(HttpServletRequest request){
			return "user/showUser";
		}
		
		@RequestMapping("user_index")
        public String toUserIndex(HttpServletRequest request){
			
			return "user/user_index";
		}
		
		@RequestMapping("user_info")
		public void showUserInfo(HttpServletRequest request,Model model){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
			HttpSession session = request.getSession();
			String account  = (String)session.getAttribute("account");
			map.put("account", account);
			model.addAttribute("userInfo", userService.showUserInfo(map));
		}
		@RequestMapping("user_edit")
		public void toUserSet(HttpServletRequest request,Model model){
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
			HttpSession session = request.getSession();
			String account  = (String)session.getAttribute("account");
			map.put("account", account);
			model.addAttribute("userInfo", userService.showUserInfo(map));
			model.addAttribute("phlist1", userService.getPHList1());
			model.addAttribute("phlist2", userService.getPHList2());
			model.addAttribute("phlist3", userService.getPHList3());
			model.addAttribute("phlist4", userService.getPHList4());
			model.addAttribute("phlist5", userService.getPHList5());
		}
		@RequestMapping("user_saveProject")
		public void saveProject(HttpServletRequest request, HttpServletResponse response) throws IOException{
			Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
			HttpSession session = request.getSession();
			String account  = (String)session.getAttribute("account");
			map.put("account", account);
			if(!"".equals(map.get("city"))&&map.get("city")!=null){
				map.put("address", map.get("city"));
			}else{
				map.put("address", map.get("province"));
			}
			String list =  map.get("list").toString();
			map.put("list",list.substring(0, list.length()-1));
			String str = userService.saveProject(map);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		}
		
	}


