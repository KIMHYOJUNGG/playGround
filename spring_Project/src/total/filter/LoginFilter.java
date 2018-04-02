package total.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import total.service.LevelCheckService;

public class LoginFilter implements Filter {

	@Autowired
	LevelCheckService lcservice;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		
		HttpServletRequest req = (HttpServletRequest)request;
		String cp = req.getContextPath();
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		if( session.getAttribute("logon") == null) {
			session.setAttribute("uri", req.getRequestURI());
			resp.sendRedirect("/member/log");
		} else {
			String path=req.getRequestURI();
			System.out.println(req.getRequestURI());
			
			int lv=lcservice.levelCheck((String)session.getAttribute("logon"));
			if(lv==0) {
				if(path.equals("/board/register")||
						path.equals("/member/log")||path.equals("/bookPage")) {
					chain.doFilter(req, resp);
					return;
				}else {
					resp.setContentType("text/html;charset=utf-8");
					PrintWriter out=resp.getWriter();
					out.println("<script>window.alert(\"권한이 없습니다.!\"); location.href=\"" + cp + "/bookPage\";</script>"); // 한글
					out.close();
					
					
				}
						
				
				
			}else {
				
				
			}
			
			
			chain.doFilter(req, resp);
		}
	}
	/*lv 2 ==> 권한막은거(0) 

			회원의 lv이 1이면 글쓰기, 댓글, 책

			회원의 lv이 0이면 구독,좋아요.

			비회원 본다 검색한다.
			session.getAttribute("logon")


			글쓰기, 댓글, 책 --->  

			첫번째 로그인->
			로그인 -<>
			select lv form member id= #{id}
			if(lv==1)*/
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
