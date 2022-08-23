package com.controller.Goods;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ProductDTO;
import com.dto.SawonDTO;
import com.service.ProductService;


/**
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/ProductUpdateServlet")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProductUpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SawonDTO dto = (SawonDTO)session.getAttribute("login");
		String nextPage=null;
		if (dto!=null) {
			
			String pdno=request.getParameter("pdno");
			String pdnm=request.getParameter("pdnm");
			String pdprice=request.getParameter("pdprice");
			String ctno=request.getParameter("ctno");
			
			HashMap<String, Object> map= new HashMap<>();
			map.put("pdno", Integer.parseInt(pdno));
			map.put("pdnm", pdnm);
			map.put("pdprice", Integer.parseInt(pdprice));
			map.put("ctno", Integer.parseInt(ctno));
	
			
			ProductService service = new ProductService();
			int num = service.ProductUpdate(map);
			nextPage = "ProductListServlet";
			
		}else {
			nextPage = "LoginUIServlet";
			request.setAttribute("mesg", "로그인이 필요한 작업입니다.");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
