
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserData extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            Random ra = new Random();
            String uid = ("uid" + ra.nextInt(10000 + 1));
            HttpSession session = request.getSession();

            String name = request.getParameter("name");
            String uname = request.getParameter("uname");
            String umo = request.getParameter("umo");
            String uemail = request.getParameter("uemail");
            String upass = request.getParameter("upass");
            String reupass = request.getParameter("reupass");
            String uaddress = request.getParameter("uaddress");

            Connection con = null;
            PreparedStatement pst = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docfinder", "root", "");

                String sql = "insert into userdata values(?,?,?,?,?,?,?,?)";
                pst = con.prepareStatement(sql);

                pst.setString(1, name);
                pst.setString(2, uname);
                pst.setString(3, umo);
                pst.setString(4, uemail);
                pst.setString(5, upass);
                pst.setString(6, reupass);
                pst.setString(7, uaddress);
                pst.setString(8, uid);

                pst.execute();

                session.setAttribute("uid", uid);
                session.setAttribute("upass1", upass);
                session.setAttribute("uname1", uname);

                request.setAttribute("msg", "Data Successfully Saved");
                RequestDispatcher rd = request.getRequestDispatcher("compReg.jsp");
                rd.forward(request, response);

            } catch (Exception e) {
                out.println(e);
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
