package com.controller.sawon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.SawonDTO;
import com.service.SawonService;

@WebServlet("/SawonUpdateServlet")
public class SawonUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		SawonDTO dto = (SawonDTO)session.getAttribute("login");
		String nextPage=null;
		if (dto!=null) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String username = request.getParameter("username"); 
			String phonenumber1 = request.getParameter("phonenumber1");
			String phonenumber2 = request.getParameter("phonenumber2");
			String phonenumber3 = request.getParameter("phonenumber3");
			String birthday1 = request.getParameter("birthday1");
			String birthday2 = request.getParameter("birthday2");
			String birthday3 = request.getParameter("birthday3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String sawongrade = request.getParameter("sawongrade");
			
			SawonDTO dto2 =
					new SawonDTO(userid, passwd, username, phonenumber1, phonenumber2,
					phonenumber3, birthday1, birthday2, birthday3, email1, email2, sawongrade);
			
			SawonService service = new SawonService();
			int num = service.sawonUpdate(dto2);
			System.out.println("사원 업데이트 완료"+num);
			if (num==1) {
				dto2= service.SawonRetrieve(userid);
				session.setAttribute("login", dto2); //세션에 최신정보저장
				//session.setAttribute("sawonAdd", "회원정보가 수정되었습니다.");//세션에 최신정보저장
			}
			nextPage = "SawonListServlet";
			
		}else {
			nextPage = "LoginUIServlet";
			request.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
