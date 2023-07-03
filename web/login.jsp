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
                    background-image: url('image/i4.jpg');

            }

            .box {
                height: 300px;
                border: 1px solid black;
                padding: 30px 20px;
                box-shadow: 10px 15px 8px #888888;
                margin-top: 30px;
                border-radius: 15px;
                    
            }

            .box:hover {
                box-shadow: 15px 20px 8px #888888;
            }

            .n1 {
                width: 280px;
                height: 38px;
                margin-bottom: 5px;
                font-size: larger;
                border: none;
                outline: none;
                border-bottom: 1px solid black;
            }

            .but1 {
                width: 260px;
                height: 38px;
                font-size: larger;
                background-color: #0A3EF0;
                color: white;
                margin-left: 10px;
                margin-bottom: 5px;
                  border-radius: 15px;
            }

            .but1:hover {
                box-shadow: 5px 5px 2px #888888;
                background-color: #1A41C5;
            }
            label{
                margin-left: 35px;
            }
            h1{
                text-align: center;
            }
            input {
                 border-radius: 15px;
            }
        </style>
    </head>

    <body>

        <%@ include file="Header.html" %> 

        <div class="reg">


     <%
                   String msg1=(String)request.getAttribute("msg");
                   if(msg1!=null)
                   {
                      out.print(msg1); 
                   }else
                   {
                       
                   }
                   
               %> 

            <div class="box">

                <h1>Login</h1>
                <form action="LoginCheck" method="post">
                    <div class="innerbox">
                        <table>
                            <tr>
                                <td>Enter UserName: </td>
                                <td>
                                    <input class="n1" type="text" name="uname" placeholder="Username" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    Enter Password: 
                                </td>
                                <td>
                                    <input class="n1" type="password" name="upass" placeholder="Password" />
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td><input class="but1" type="submit" value="Sign In " /></td>
                            </tr>
                            
                            <tr>
                                <td></td>
                                <td>    <div class="box2">
                <label>Don't have an account:?</label> <a href="userReg.jsp">Sign Up</a>
            </div></td>
                            </tr>
                        
                        </table>
                    </div>


                </form>
                
             
            </div>



        </div>

        <%@ include file="Footer.html" %> 

    </body>

</html>
