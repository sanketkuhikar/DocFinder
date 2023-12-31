

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheck extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            
            
            ResultSet rs1;
            Connection con = null;
            PreparedStatement pst1 = null;
            HttpSession session = request.getSession();

            String uname = request.getParameter("uname");
            String upass = request.getParameter("upass");
            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docfinder", "root", "");
                String sql1 = "select * from userdata where uname=? and upass=?";
                pst1 = con.prepareStatement(sql1);
                pst1.setString(1, uname);
                pst1.setString(2, upass);

                rs1 = pst1.executeQuery();
                if (rs1.next()) {
                    String uid = rs1.getString("uid");
                    String upass1 = rs1.getString("upass");
                    String uname1 = rs1.getString("uname");
                    
                    session.setAttribute("uid", uid);
                    session.setAttribute("upass1", upass1);
                    session.setAttribute("uname1", uname1);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("ShowCompData.jsp");
                    rd.forward(request, response);
                

                } else {

                            response.sendRedirect("login.jsp");

                
                }

                con.close();
                rs1.close();

            } catch (Exception e) {
                out.print(e);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
