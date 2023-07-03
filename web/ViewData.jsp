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
                width: 50%;
                height: 540px;
                background-color: whitesmoke;
                border: 1px solid black;
                box-shadow: 10px 15px 8px #888888;
                padding: 10px;
                margin-bottom: 35px;
            }

            .innerbox img{
                width: 480px;
                height: 300px;
                margin-left: 70px;
                border-radius: 15px;
                    
              
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
            .A{
                display: flex;
                justify-content: space-evenly;
            }
        </style>
    </head>

    <body>

        <%@ include file="Header.html" %> 
        
        <%
        String cid = request.getParameter("cid");
        String dname = request.getParameter("dname");
        String dno = request.getParameter("dno");
        String dtype = request.getParameter("dtype");
        String uid = request.getParameter("uid");
        String upass = request.getParameter("upass");
        String uname = request.getParameter("uname");
        String uid1 = request.getParameter("uid1");
        %>

        <form action="ShowCompData.jsp" method="post">


            <div class="box2">


                <%!
                    Connection con;
                    PreparedStatement pst1 = null;
                    ResultSet rs;
                %>

                <%
                    try {

                        
                  
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/docfinder", "root", "");
                        String sql1 = "select * from userdata where uid=?";
                        pst1 = con.prepareStatement(sql1);
                        pst1.setString(1, uid1);
                        rs = pst1.executeQuery();

                        while (rs.next()) {

                            String uemail = rs.getString("uemail");
                            String umo = rs.getString("umo");
                            String uname1 = rs.getString("uname");
                            String uaddress = rs.getString("uaddress");
                            String name = rs.getString("name");

                %>




                <div class="innerbox">

                    <img src="viewImage.jsp?cid1=<%=cid%>" > <br><br>
                    
                    <div class="A">
                        
                        <div>
                      
                    <h1><b>User details</b></h1>

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
                        
                     </table>
                        
                        </div>
                        
                          <div>
                              
                              <h1><b>Founder details</b></h1>
                      <table>
                        
                             <tr>
                            <td> <label >Contact No. : </label></td> <td><%=umo%></td>
                        </tr>
                     
                        <tr>
                            <td><label>Email : </label></td> <td><%=uemail%></td>
                        </tr>

                     

                        <tr>
                            <td> <label >Name :</label></td> <td><%=name%></td>
                        </tr>
                        
                           <tr>
                            <td> <label >Address :</label></td> <td><%=uaddress%></td>
                        </tr>
                        
                       </table>
                        
                        </div>
                    </div>    
                      <table>
                       
                        <tr>
                            <td></td>
                            <td>  <div class="apply">
                        <a id="a1" href="ShowCompData.jsp" class="btn btn-primary">View</a>
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
