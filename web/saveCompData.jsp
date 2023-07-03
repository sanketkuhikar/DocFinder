<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="cssRegEmp.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylsheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
    
        <style>
        .box1 {
            height: 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0px 30px;
        }

        .box2 {
            display: flex;
            justify-content: space-around;
            padding: 20px 20px;
            flex-wrap: wrap;
        }

        .innerbox {
            width: 75%;
            height: 500px;
            border: 1px solid black;
            box-shadow: 10px 15px 8px #888888;
            padding: 10px;
            margin-bottom: 35px;
            display: grid;
            grid-template-columns: 40% auto ;
        
        }
        .c2{
           
            padding-top: 30px;
        }

        .c3{
            background-color: rgb(212, 206, 198);
            grid-column: 1/4;
            height: 200px;
        }

        .innerbox:hover {
            box-shadow: 15px 20px 8px #888888;
        }

        .innerbox img {
            width: 300px;
            height: 150px;
            margin-left: 19%;
            box-shadow: 0px 15px 8px #888888;
        }



        .left {
            float: left;
            width: 48%;
            
        }

        .left label {
            font-weight: 600;
           margin: 30px;
        }

        .right {

            float: right;
            width: 50%;
            margin-left: 5px;
            
        }

        .lb {
            font-size: large;
            font-weight: 600;
        }

        .ach {
            height: 60px;
        }

        .b1 a {
            font-size: x-large;
            margin-left: 90px;
        }

        #n1 {
            width: 280px;
            height: 35px;
            padding: 5px;
        }
    </style>
    </head>

    <body>

        <%@ include file="Header.html" %> 
        <!-----about section------->

        <div class="box1">

            <div class="boxleft">

<!--                <select id="n1" name="criteria" class="form-control" onchange="this.form.submit();">
                    <option value="-1"> Select Criteria</option>
                    <option>BSc</option>
                    <option>BE</option>
                </select>-->

            </div>

            <div class="boxright">

                <a href="viewUserData.jsp"> View your details here </a>

            </div>



        </div>

<%
            String cname = request.getParameter("cname");
            String cemail = request.getParameter("cemail");
            String cri = request.getParameter("cri");
            String cdesig = request.getParameter("desig");
            String salary = request.getParameter("salary");
            String cid = request.getParameter("cid");
%>

        <div class="box2">

            <div class="innerbox">

                <div class="c1">
                     <img src="viewImage.jsp?cid1=<%=cid%>"><br><br>
                </div>

                <div class="c2">

                    <div class="left">
                        <label for="" class="lb">Company Name</label><br>
                        <label for="">Email Id</label><br>
                        <label for="">Qualification</label><br>
                        <label for="">Designation</label><br>
                        <label for="">Salary</label><br>
                    </div>

                    <div class="right">
                        <label for="" class="lb"><%=cname%></label><br>
                        <label for=""><%=cemail%></label><br>
                        <label for=""><%=cri%></label><br>
                        <label for=""><%=cdesig%></label><br>
                        <label for=""><%=salary%></label><br>
                    </div>

                </div>

                <div class="c3">

                </div>




                <div class="b1">
                    <h3>Thanks for Applying</h3>
                    <label for=""></label>    <a href="ShowCompData.jsp">Back</a>
                </div>

            </div>


        </div>



        <%
            String uname = (String) request.getAttribute("uname");
            String umo = (String) request.getAttribute("umo");
            String uemail = (String) request.getAttribute("uemail");
            String udesig = (String) request.getAttribute("udesig");
            String cpass = (String) request.getAttribute("cpass");
            String uid1 = (String) request.getAttribute("uid1");
 
            
//            out.println("-----");
//            out.println(uname);
//            out.println(cname);
//            out.println(uemail);
//            out.println(umo);
//            out.println(udesig);
//            out.println(cpass);
//            out.println(uid1);

            Connection con = null;
            PreparedStatement pst = null;
            try {
               Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CampusRec", "root", "");
                String sql = "insert into cdata(uname,umo,uemail,udesig,cpass,uid,cname) values(?,?,?,?,?,?,?)";
                pst = con.prepareStatement(sql);

                pst.setString(1, uname);
                pst.setString(2, umo);
                pst.setString(3, uemail);
                pst.setString(4, udesig);
                pst.setString(5, cpass);
                pst.setString(6, uid1);
                pst.setString(7, cname);

                pst.execute();
     
            } catch (Exception e) {
                out.print(e);
            }
        %>

 <%@ include file="Footer.html" %> 

        <!---------------services------->
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
