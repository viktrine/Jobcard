import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class ProfileAdmin
 */
@WebServlet("/ProfileAdmin")
public class ProfileAdmin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileAdmin() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement ps = null;
		
		
		if (request.getSession().getAttribute("adminLog") != null)
		{
			int id_value = (int) request.getSession(false).getAttribute("adminLog");
			
			out.println("<html>");
			out.println("<head><title>Admin Profile</title>");
		    
		    out.println("<link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">");
		    out.println("<script src=\"js/bootstrap.min.js\"></script>");
		    out.println("<script src=\"jquery.min.js\"></script>");
		    
		    out.println("</head>");
		    
		    out.println("<body>");
			
			try
			{
				con = Methods.getConnection();
				
				String field_Engineer_Details = "select * from adminDetails where id = ?";
				ps = con.prepareStatement(field_Engineer_Details);
				ps.setInt(1, id_value);
				
				ResultSet rs = (ResultSet) ps.executeQuery();
				
				
				DateFormat df_day = new SimpleDateFormat("dd-MM-yyyy");
				
				out.print("<table width=25% border=1>");
		    	  
		    	
				if(!rs.next())
				{
					request.getSession().setAttribute("no_Details", "No Details to display");
					
					response.sendRedirect(request.getHeader("Referer"));
				}
				else
				{
					String pfname = rs.getString("fname");
					String psname = rs.getString("oname");
					String pemail = rs.getString("email");
					String pphone = rs.getString("phone");
					String pstaff_no = rs.getString("staff_no");
					String pcompany_name = rs.getString("company_name");
					String pregistration_date = df_day.format(rs.getTimestamp("registration_date"));
					
					
					
					String pname = pfname + " " + psname;
					
					request.getSession().setAttribute("pname", pname); 
					request.getSession().setAttribute("pemail", pemail); 
					request.getSession().setAttribute("pphone", pphone); 
					request.getSession().setAttribute("pstaff_no", pstaff_no); 
					request.getSession().setAttribute("pregistration_date", pregistration_date); 
					request.getSession().setAttribute("pcompany_name", pcompany_name); 
					
					response.sendRedirect("/jobcard/adminDetails.jsp");
				}
				out.print("</table>");
				
			}
			catch (Exception e) 
			{
				request.getSession().setAttribute("DatabaseError", "Database Error...");
				
				response.sendRedirect(request.getHeader("Referer"));
			}
		}
		else
		{
			request.getSession().setAttribute("priv", "No Privilege to view the registered Field Engineers");
            
			response.sendRedirect(request.getHeader("Referer"));
		}
		
	    out.println("</body>");
	    out.println("</html>");
	    out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
