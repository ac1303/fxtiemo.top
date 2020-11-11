package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub

    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        // ��������������Ҫ�õ�request,response,session����
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        // ����û������URI
        String path = servletRequest.getRequestURI();
        System.out.println(path);

        // ��session��ȡԱ��������Ϣ
        String userinfo = (String) session.getAttribute("userinfo");

        // ��½ҳ��ʹ����¼���߼�ҳ���������,
        if(path.indexOf("login.jsp") > -1||path.indexOf("login_java.jsp")>-1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }
        // �ж����û��ȡ��Ա����Ϣ����ϢΪ��,����ת����½ҳ��
        if (userinfo == null || "".equals(userinfo)) {
            // ��ת����½ҳ��
            servletResponse.sendRedirect("login.jsp");
        } else {
            // �Ѿ���½,�����˴�����
            chain.doFilter(request, response);
        }

    }

    public void destroy() {
        // TODO Auto-generated method stub

    }

}
