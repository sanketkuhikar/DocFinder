<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css1.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylsheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
        <style>
            * {
                box-sizing: border-box;
            }
            /* Create two unequal columns that floats next to each other */
            /* Left column */
            .leftcolumn {
                float: left;
                width: 75%;
            }

            /* Right column */
            .rightcolumn {
                float: left;
                width: 25%;
                background-color: #f1f1f1;
                padding-left: 20px;
            }

            /* Fake image */
            .fakeimg {
                background-color: #aaa;
                width: 100%;
              
            }

            /* Add a card effect for articles */
            .card {
                background-color: white;
                padding: 20px;
                margin-top: 20px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
        </style>

    </head>


    <body>
        
        <%
                    session.setAttribute("upass1", "null");
                    session.setAttribute("uname1", "null"); %>

        <%@ include file="Header.html" %> 
        
        <div>
            <img src="image/i1.jpg" width="100%" height="500px" alt="alt"/>
        </div>


        <div class="row">
            <div class="leftcolumn">
                <div class="card">
                    <h2>TITLE HEADING</h2>
                    <h5>Title description, Aug 2, 2023</h5>
                    <div class="fakeimg" style="height:200px;">
                       
                        <img src="image/s1_1.jpg" width="100%" height="200px" alt="alt"/>
                        
                    </div>
                    <p>Some text..</p>
                    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                        exercitation ullamco.</p>
                </div>
                <div class="card">
                    <h2>TITLE HEADING</h2>
                    <h5>Title description, Aug 2, 2023</h5>
                    <div class="fakeimg" style="height:200px;">
                        
                        <img src="image/s3.jpg" width="100%" height="200px" alt="alt"/>
                    </div>
                    <p>Some text..</p>
                    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                        exercitation ullamco.</p>
                </div>
            </div>
            <div class="rightcolumn">
                <div class="card">
                    <h2>About Me</h2>
                    <div class="fakeimg" style="height:100px;">
                        <img src="image/s6.jpg" width="100%" height="100px" alt="alt"/>
                    </div>
                  
                </div>
                <div class="card">
                    <h3>Popular Post</h3>
                    <div class="fakeimg">
                        <p>Image</p>
                    </div>
                    <div class="fakeimg">
                        <p>Image</p>
                    </div>
                    <div class="fakeimg">
                        <p>Image</p>
                    </div>
                </div>
                <div class="card">
                    <h3>Follow Me</h3>
                    <p>Some text..</p>
                </div>
            </div>
        </div>

        <h1 id="h">title</h1>



        <!-----about section------->

     
       
     <%@ include file="Footer.html" %> 
     
     <script>
         let e = sessionStorage.getItem("email");
         let p = sessionStorage.getItem("pass");
         if(e){
             
             
         }else{
              window.location.assign("http://localhost:8080/DocFinder/home.jsp")  
         }
     </script>
    </body>
</html>

