import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class uploadDoc extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
         
            
            Random ra = new Random();
            String cid = ("did" + ra.nextInt(10000 + 1));
            
            HttpSession session = request.getSession();
            String uid = (String) session.getAttribute("uid");
            
            String dtype = request.getParameter("dtype");
            String dname = request.getParameter("dname");
            String dno = request.getParameter("dno");
            Part file = request.getPart("dimg");     
            InputStream is = file.getInputStream();

            Connection con = null;
            PreparedStatement pst = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docfinder", "root", "");
                String sql = "insert into docdata values(?,?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                
                pst.setString(1, dtype);
                pst.setString(2, dname);
                pst.setString(3, dno);
                pst.setString(4, cid);
                pst.setBlob(5, is);
                pst.setString(6, uid);

               pst.execute();
               request.setAttribute("msg", "Data Successfully Saved");
               RequestDispatcher rd = request.getRequestDispatcher("ShowCompData.jsp");
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
