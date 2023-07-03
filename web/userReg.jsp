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
            .reg {
                height: 600px;
                display: flex;
                justify-content: center;
                background-image: url('image/i3.jpg');
                /*                background-repeat: no-repeat;*/
            }

            .box{
                height: 460px;
                /*                border: 1px solid black;*/
                padding: 10px 20px;
                /*                box-shadow: 10px 15px 8px #888888;*/
                margin-top: 20px;
                background-color: white;
                opacity: 0.6;
                border-radius: 25px;
                margin-left: 200px;
            }

            .box:hover{
                /*                box-shadow: 15px 20px 8px #888888;*/
                opacity: 1;
            }

            .n1{
                width: 280px;
                height: 38px;
                margin-bottom: 5px;
                font-size: larger;

                border: none;
                outline: none;
                border-bottom: 1px solid black;
            }

            .f1 {
                width: 280px;
                height: 38px;
                margin-top: 10px;
                font-size: larger;

            }

            .but1{
                width: 260px;
                height: 38px;
                font-size: larger;
                background-color: #0A3EF0;
                color: white;
                margin-left: 10px;
                margin-top: 10px;
                border: none;
            }

            .but1:hover{

                background-color: #1A41C5;
            }
            h2{
                text-align: center;
            }
            h3{
                color: green;
            }
        </style>

    </head>


    <body>

        <%@ include file="Header.html" %> 
        
        


        <!-----about section------->

        <div class="reg">

            <div class="box">

                <h2>CREATE ACCOUNT</h2>
                <form action="UserData" method="post">

                    <table>
                        <tr>
                            <td>Enter Full Name</td>
                            <td>
                                <input class="n1" type="text" name="name"  />
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Contact Number</td>
                            <td>
                                <input class="n1" type="number" name="umo"  />
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Email Id</td>
                            <td>
                                <input class="n1" type="email" name="uemail" />
                            </td>
                        </tr>
                        <tr>
                            <td>Enter User Name</td>
                            <td>
                                <input class="n1" type="text" name="uname"  />
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Password</td>
                            <td>
                                <input class="n1" type="Password" name="upass" />
                            </td>
                        </tr>
                        <tr>
                            <td>ReEnter Password</td>
                            <td>
                                <input class="n1" type="Password" name="reupass" />
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Address</td>
                            <td>
                                <input class="n1" type="text" name="uaddress"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td> <input class="but1" type="submit" value="Save" /></td>
                        </tr>
                    </table>

                    <%
                        String msg1 = (String) request.getAttribute("msg");
                        if (msg1 != null) {
                    %>

                    <h3>Data Successfully Saved</h3>
                    <%
                        } else {

                        }

                    %> 

                </form>

            </div>

        </div>
        <!---------------services------->

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



