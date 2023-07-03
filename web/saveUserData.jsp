<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    <body>
        
        
        
        <%
            String uname1 = (String) session.getAttribute("uname1");
            String cname = request.getParameter("cname");
            String cemail = request.getParameter("cemail");
            String cri = request.getParameter("cri");
            String cdesig = request.getParameter("desig");
            String salary = request.getParameter("salary");
            String uid = request.getParameter("uid");
            String upass = request.getParameter("upass");
            String cpass = request.getParameter("cpass");
            String cid = request.getParameter("cid");
            

            Connection con = null;
            PreparedStatement pst = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CampusRec", "root", "");
                String sql = "insert into udata(cname,cemail,cri,cdesig,salary,upass,cid,uname) values(?,?,?,?,?,?,?,?)";
                pst = con.prepareStatement(sql);

                pst.setString(1, cname);
                pst.setString(2, cemail);
                pst.setString(3, cri);
                pst.setString(4, cdesig);
                pst.setString(5, salary);
                pst.setString(6, upass);
                pst.setString(7, cid);
                pst.setString(8, uname1);

                pst.execute();
             

            } catch (Exception e) {
                out.print( "sUD 1"+e);
            }
        %>

        
        
        
        <%
            ResultSet rs1;
            Connection con1 = null;
            PreparedStatement pst1 = null;
            try {

                Class.forName("com.mysql.jdbc.Driver");
                con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/CampusRec", "root", "");
                String sql1 = "select * from userdata where uid=?";
                pst1 = con1.prepareStatement(sql1);
                pst1.setString(1, uid);

                rs1 = pst1.executeQuery();
                if (rs1.next()) {
                    String uname = rs1.getString("uname");
                    String umo = rs1.getString("umo");
                    String uemail = rs1.getString("uemail");
                    String udesig = rs1.getString("desig");
                    String uid1 = rs1.getString("uid");
                    
                    
                    RequestDispatcher rd = request.getRequestDispatcher("saveCompData.jsp");

                    request.setAttribute("uname", uname);
                    request.setAttribute("umo", umo);
                    request.setAttribute("uemail", uemail);
                    request.setAttribute("udesig", udesig);
                    request.setAttribute("cpass", cpass);
                    request.setAttribute("uid1", uid1);
                    request.setAttribute("cname", cname);
                    request.setAttribute("cemail", cemail);
                    request.setAttribute("cri", cri);
                    request.setAttribute("cdesig", cdesig);
                    request.setAttribute("salary", salary);
                    request.setAttribute("cid", cid);
                    rd.forward(request, response);

                } else {

                    response.sendRedirect("userlogin.jsp");

                }

//           con1.close();
//           rs1.close();
            } catch (Exception e) {
                 out.print( "sUD 2"+e);
            }
        %>


    </body>
</html>
