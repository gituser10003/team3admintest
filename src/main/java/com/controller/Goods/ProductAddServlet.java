package com.controller.Goods;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ProductDTO;
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
		request.setCharacterEncoding("utf-8");
		String pdno=request.getParameter("pdno");
		String pdnm=request.getParameter("pdnm");
		String pdprice=request.getParameter("pdprice");
		String ctno=request.getParameter("ctno");
		String pdfile=request.getParameter("pdfile");
	
		ProductDTO dto=new ProductDTO(pdno, pdnm, 0, ctno, pdfile);
	
		ProductService service=new ProductService();
		int n=service.ProductAdd(dto);
		
		HttpSession session = request.getSession();
		session.setAttribute("ProductAdd", "상품기입성공");
		session.setMaxInactiveInterval(5);
		response.sendRedirect("ProductListServlet");
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
