package com.controller.Goods;

import java.io.File;
import java.io.IOException;

import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dto.ProductDTO;
import com.dto.SawonDTO;
import com.service.ProductService;

/**
 * Servlet implementation class ProductUploadServlet
 */
@WebServlet("/ProductAddUploadServlet")
public class ProductAddUploadServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//multipart 여부 검사
				request.setCharacterEncoding("UTF-8");
				HttpSession session = request.getSession();
			      SawonDTO sdto = (SawonDTO)session.getAttribute("login");
				 String nextPage = null;
				boolean isMultipart= ServletFileUpload.isMultipartContent(request);
				if(isMultipart) {
					System.out.println("파일요청맞음");
					// Create a factory for disk-based file items
					DiskFileItemFactory factory= new DiskFileItemFactory();
					// Configure a repository (to ensure a secure temp location is used)
					ServletContext servletContext= this.getServletConfig().getServletContext();
					File repository= (File)servletContext.getAttribute("javax.servlet.context.tempdir");
					factory.setRepository(repository);
					
					// Create a new file upload handler
					ServletFileUpload upload= new ServletFileUpload(factory);
					//파일크기지정
					//1kb=1024byte
					upload.setFileSizeMax(1024*1024*5); //5M
					upload.setFileSizeMax(1024*1024*10); //10M
					String fieldName=null;
					String fileName= null;
					String contentType= null;
					boolean isInMemory= false;
					long sizeInBytes=0;
					//request에서 파싱
					try {
						List<FileItem> items= upload.parseRequest(request);
						
						Iterator<FileItem> iter= items.iterator();
						String pdnm=null;
						String pdprice=null;
						String ctno=null;
						while (iter.hasNext()) {
							FileItem item= iter.next();
							if(item.isFormField()) {
								//type="file"이 아닌 것의 처리
								String name = item.getFieldName();
								if (name.equals("pdnm")) {
									pdnm = item.getString("utf-8");
								}
								if (name.equals("pdprice")) {
									pdprice = item.getString("utf-8");
								}
								if (name.equals("ctno")) {
									ctno = item.getString("utf-8");
								}
						}else {
							//type="file"의 처리 
							fieldName= item.getFieldName();
							fileName= item.getName();
							contentType= item.getContentType();
							isInMemory=item.isInMemory();
							sizeInBytes= item.getSize();
		System.out.println("fieldName====" + fieldName);					
		System.out.println("fileName====" + fileName);					
		System.out.println("contentType====" + contentType);					
		System.out.println("isInMemory====" + isInMemory);					
		System.out.println("sizeInBytes====" + sizeInBytes);		
						//file 저장
			File f= new File("C:\\upload", fileName);
			  nextPage = "LoginUIServlet";
			  session.setAttribute("mesg", "로그인이 필요한 작업입니다.");
			try {
				item.write(f);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
						}//end else
					}//end while
						ProductDTO dto=new ProductDTO();
						dto.setPdnm(pdnm);
						dto.setPdprice(Integer.parseInt(pdprice));
						dto.setCtno(Integer.parseInt(ctno));
						System.out.println(pdnm);
						System.out.println(pdprice);
						System.out.println(ctno);
						ProductService service=new ProductService();
						int n=service.ProductAdd(dto);
						nextPage = "ProductListServlet";
						session.setAttribute("ProductAdd", "상품기입성공");
						session.setMaxInactiveInterval(5);
						  response.sendRedirect(nextPage);
					}catch(FileUploadException e) {
						e.printStackTrace();
					}
				}
			}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
