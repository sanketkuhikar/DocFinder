<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='main.js'></script>
        <style>
            .box1 {
                height: 100px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0px 30px;
            }
            .box2{
                display: flex;
                justify-content: space-around;
                padding: 20px 20px;
                flex-wrap: wrap;
            }

            .innerbox{
                width: 25%;
                height: 330px;
                background-color: whitesmoke;
                border: 1px solid black;
                box-shadow: 10px 15px 8px #888888;
                padding: 10px;
                margin-bottom: 35px;
            }

            .innerbox img{
                width: 280px;
                height: 200px;
              
            }
            
            .left{
                float: left;
                width: 40%;
            }
            .left label{
                font-weight: 600;
            }
            .right{
                float: right;
                width: 58%;
                margin-left: 5px;
            }
            .lb{
                font-size: large;
                font-weight: 600;
            }
            #a1{
                background-color: #F0570A;
                font-size: x-large;
                border: 1px solid black;
            }


            #n1{
                width: 280px;
                height: 35px;
                padding: 5px;
            }

        </style>
    </head>

    <body>

        <%@ include file="Header.html" %> 

        <form action="ShowCompData.jsp" method="post">
            <div class="box1">

                <div class="boxleft">


                    <select id="n1" style="width: 210px;" name="dtype" class="form-control" onchange="this.form.submit();">
                        <option value="-1"> Select Document</option>
                        <option value="Addhar Card">Addhar Card</option>
                        <option value="Pancard">Pancard</option>
                        <option value="Driving license">Driving license</option>
                        <option value="Birth Certificate">Birth Certificate</option>
                        <option value="Other">Other</option>
                    </select>

                </div>

                <div class="boxright">
                    <a href="compReg.jsp">Upload Document </a>
                    <!--                    <a href="viewUserData.jsp">Click here for view your details </a>-->

                </div>



            </div>

            <div class="box2">


                <%!
                    Connection con;
                    PreparedStatement pst1 = null;
                    ResultSet rs;
                %>

                <%
                    try {

                        String uid = (String) session.getAttribute("uid");
                        String upass = (String) session.getAttribute("upass1");
                        String uname = (String) session.getAttribute("uname1");
                        String dtype = request.getParameter("dtype");

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docfinder", "root", "");
                        String sql1 = "select * from docdata where dtype=?";
                        pst1 = con.prepareStatement(sql1);
                        pst1.setString(1, dtype);
                        rs = pst1.executeQuery();

                        while (rs.next()) {

                            String dname = rs.getString("dname");
                            String dno = rs.getString("dno");
                            String cid = rs.getString("cid");
                            String uid1 = rs.getString("uid");

                %>




                <div class="innerbox">

                    <img src="viewImage.jsp?cid1=<%=cid%>" > <br><br>

                    <table>
                        <tr>
                            <td><label>Doc Holder Name : </label></td> <td><%=dname%></td>
                        </tr>

                        <tr>
                            <td> <label >Doc No. : </label></td> <td><%=dno%></td>
                        </tr>

                        <tr>
                            <td> <label >Doc Type</label></td> <td><%=dtype%></td>
                        </tr>

                          <tr>
                            <td></td>
                            <td>  <div class="apply">
                        <a id="a1" href="ViewData.jsp?cid=<%=cid%>&dname=<%=dname%>&dno=<%=dno%>&dtype=<%=dtype%>&uid=<%=uid%>&upass=<%=upass%>&uname=<%=uname%>&uid1=<%=uid1%>" class="btn btn-primary">View</a>
                    </div></td>
                        </tr>
                        
                    </table>

                  
                </div>



                <%
                        }
                    } catch (Exception e) {
                        out.println(e);
                    }


                %>


            </div>

            <div class="box2">
                <!------------------------------------------------>
                <%            try {

                         String uid = (String) session.getAttribute("uid");
                        String upass = (String) session.getAttribute("upass1");
                        String uname = (String) session.getAttribute("uname1");

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docfinder", "root", "");
                        String sql1 = "select * from docdata";
                        pst1 = con.prepareStatement(sql1);

                        rs = pst1.executeQuery();

                        while (rs.next()) {

                            String dname = rs.getString("dname");
                            String dno = rs.getString("dno");
                            String cid = rs.getString("cid");
                            String dtype = rs.getString("dtype");
                            String uid1 = rs.getString("uid");
                %>




              <div class="innerbox">

                    <img src="viewImage.jsp?cid1=<%=cid%>"> <br><br>

                    <table>
                        <tr>
                            <td><label>Doc Holder Name : </label></td> <td><%=dname%></td>
                        </tr>

                        <tr>
                            <td> <label >Doc No. : </label></td> <td><%=dno%></td>
                        </tr>

                        <tr>
                            <td> <label >Doc Type: </label></td> <td><%=dtype%></td>
                        </tr>
                        
                        
                 
                            <tr>
                            <td></td>
                            <td>  <div class="apply">
                        <a id="a1" href="ViewData.jsp?cid=<%=cid%>&dname=<%=dname%>&dno=<%=dno%>&dtype=<%=dtype%>&uid=<%=uid%>&upass=<%=upass%>&uname=<%=uname%>&uid1=<%=uid1%>" class="btn btn-primary">View</a>
                    </div></td>
                        </tr>

                    </table>

                    
                </div>




                <%
                        }

                    } catch (Exception e) {
                        out.println(e);
                    }
                %>

            </div>

        </form>
                
                     <%@ include file="Footer.html" %>
                     
                       <script>
         let e = sessionStorage.getItem("email");
         let p = sessionStorage.getItem("pass");
         if(e.equals("bhushan@gmail.com")){
             
             
         }else{
              window.location.assign("http://localhost:8080/DocFinder/home.jsp")  
         }
     </script>
    </body>

</html>
