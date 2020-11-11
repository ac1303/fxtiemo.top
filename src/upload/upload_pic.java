package upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class upload_pic
 */
@MultipartConfig(maxFileSize=1024*1024*10)
public class upload_pic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_pic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html;charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>File Upload Servlet</title>");
        out.println("<script src=\"./lib/layui/layui.js\" charset=\"utf-8\"></script>");
        out.println("<link rel=\"stylesheet\" href=\"./css/xadmin.css\">");
        out.println("<script type=\"text/javascript\" src=\"./js/xadmin.js\"></script>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>文件写入中。。。。</h1>");
		    String id=request.getParameter("id");
		for(Part part:request.getParts()) {
			if(part.getName().startsWith("pic")) {
				part.write(configure.Configure.getPath()+id+"\\pic.jpg");
			}
		}
		
		File file=new File(configure.Configure.getPath()+id+"\\pic.jpg");
        if(!file.exists()){
        	out.println("写入失败，请重试，多次失败可能是系统出现bug");
        }else {
        	out.println("写入成功<br><br>");
        }
		out.println("<button onclick=\"window.location.href='close.jsp'\">关闭并刷新</button>");
        out.println("</body>");
        out.println("</html>");
	}

}
