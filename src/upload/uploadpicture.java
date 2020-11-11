package upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import org.apache.commons.lang.StringUtils;

/**
 * Servlet implementation class uploadpicture
 */

@MultipartConfig(maxFileSize=1024*1024*10)
public class uploadpicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadpicture() {
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		设置编码防止乱码
		response.setContentType("text/html;charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8"); 
		
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
		String path=configure.Configure.getPath();
		String id=request.getParameter("id");
		path=path+id+"\\pic\\";
		out.println("<p>文件写入路径为"+path+":</p><br>");
		for(Part part:request.getParts()){
			if(part.getName().startsWith("filenam")){
				String filename=getFilename(part);
				out.println("<p>开始写入文件"+filename+";文件大小为："+part.getSize()+"</p>");
				try {
					part.write(path+filename);
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					File file=new File(path+filename);
                    if(!file.exists()){
                    	out.println(path+filename+"写入失败，请重试，多次失败可能是系统出现bug");
                    }else {
                    	out.println(path+filename+"写入成功<br><br>");
                    }
				}
			}
		}
		out.println("<button onclick=\"window.location.href='close.jsp'\">关闭并刷新</button>");
        out.println("</body>");
        out.println("</html>");
	}

	private String getFilename(Part part) {
		// TODO Auto-generated method stub
		if(part==null)
			return null;
		String fileName=part.getHeader("content-disposition");
		if(StringUtils.isBlank(fileName)){
			return null;
		}
		return StringUtils.substringBetween(fileName, "filename=\"", "\"");
	}

}
