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
                height: 800px;
                display: flex;
                justify-content: center;
                background-image: url('image/i4.jpg');
                background-color: black;
            }

            .box {
                height: 400px;
                width: 450px;
                padding: 10px 20px;
                margin-top: 30px;
                opacity: 0.8;
                border-radius: 25px;
                background-color: white;
                display: grid;
                grid-template-columns: auto auto;
                grid-template-rows: auto auto auto 100px 50px;
            }

            .box:hover {
                opacity: 1;
            }

            .n1 {
                width: 280px;
                height: 38px;
                margin-bottom: 5px;
                font-size: larger;
                /* border: none; */
                outline: none;
                border-bottom: 1px solid black;
            }


            .f1 {
                width: 280px;
                height: 38px;
                margin-top: 10px;
                font-size: larger;

            }

            .but1 {
                width: 260px;
                height: 38px;
                font-size: larger;
                background-color: #0A3EF0;
                color: white;
                margin-left: 10px;
                margin-top: 15px;
                border: none;
            }

            .but1:hover {

                background-color: #1A41C5;
            }

            h2 {
                text-align: center;
            }

            h3 {
                color: green;
            }

            .firstbox {
                /* background-color: yellow; */
                grid-column: 1/3;
            }

            .boxleft {
                /* background-color: red; */
                grid-row: 2/3;
            }

            .boxright {
                /* background-color: blue; */
                grid-row: 2/3;

            }

            .boxmiddle {
                /* background-color: chartreuse; */
                grid-column: 1/3;

            }

            .lastbox {
                /* background-color: yellow; */
                grid-column: 1/3;
            }
            label{
                font-size: large;
                display: block;
                margin-bottom: -11px;
            }

        </style>
    </head>

    <body>


        <%@ include file="Header.html" %> 

        <%
            String upass = (String) session.getAttribute("upass1");
            String uname = (String) session.getAttribute("uname1");

            if (upass.equals("null") && uname.equals("null")) {
            
             response.sendRedirect("login.jsp");

            } else {

           
            }


        %>


        <div class="reg">

            <div class="box">

                <div class="firstbox">
                    <h2>Upload Document</h2>
                </div>

                <div class="boxright">
                    <form action="uploadDoc" method="post" enctype="multipart/form-data">


                        <table>
                            <tr>
                                <td>Document Type</td>
                                <td>
                                    <select class="n1" name="dtype" title="Select">
                                        <option value="-1"> Select Document</option>
                                        <option value="Addhar Card">Addhar Card</option>
                                        <option value="Pancard">Pancard</option>
                                        <option value="Driving license">Driving license</option>
                                        <option value="Birth Certificate">Birth Certificate</option>
                                        <option value="Other">Other</option>

                                    </select><br/>
                                </td>
                            </tr>
                            <tr>
                                <td>Holder Name</td>
                                <td>
                                    <input class="n1" type="text" name="dname" /><br />
                                </td>
                            </tr>
                            <tr>
                                <td>Document Number</td>
                                <td>
                                    <input class="n1" type="number" name="dno" /><br />
                                </td>
                            </tr>

                            <tr>
                                <td>Upload Document</td>
                                <td>
                                    <input class="n1" type="file" name="dimg"  />
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td> <input class="but1" type="submit" value="Save" /></td>
                            </tr>

                        </table>
                    </form>
                </div>




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
