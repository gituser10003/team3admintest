package com.controller.Goods;

import java.io.IOException;
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
 * Servlet implementation class ProductAddServlet
 */
@WebServlet("/ProductAddServlet")
public class ProductAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
	      SawonDTO sdto = (SawonDTO)session.getAttribute("login");
		 String nextPage = null;
	      if(sdto!=null) {//회원인경우 
		String pdno=request.getParameter("pdno");
		String pdnm=request.getParameter("pdnm");
		String pdprice=request.getParameter("pdprice");
		String ctno=request.getParameter("ctno");
	
		ProductDTO dto=new ProductDTO();
		System.out.println(pdno);
		System.out.println(pdnm);
		System.out.println(pdprice);
		System.out.println(ctno);
		dto.setPdno(Integer.parseInt(pdno));
		dto.setPdnm(pdnm);
		dto.setPdprice(Integer.parseInt(pdprice));
		dto.setCtno(Integer.parseInt(ctno));
	
		ProductService service=new ProductService();
		int n=service.ProductAdd(dto);
		
		nextPage = "ProductListServlet";
		session.setAttribute("ProductAdd", "상품기입성공");
		session.setMaxInactiveInterval(5);
		/* response.sendRedirect("ProductListServlet"); */

      }else {
		  nextPage = "LoginUIServlet";
		  session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
	  }
     
    response.sendRedirect(nextPage);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
