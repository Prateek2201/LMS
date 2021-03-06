<%-- 
    Document   : load
    Created on : May 2, 2019, 11:27:09 PM
    Author     : Prateek Agrahari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var i=0;
            function runBar() 
            {
                var bar=document.getElementById("bar");
                bar.value=i;
                if(i<100)
                {
                    i++;
                    window.setTimeout("runBar()",25);
                }
                else
                {
                    window.location.href="adminzone/adminhome.jsp";
                }
            }
        </script>
        <style>
            #bar
            {
                height: 50px;
                width: 500px;
                border: 2px solid black;
                margin-top: 100px;
                margin-left: 400px;
            }
        </style>
    </head>
    <body onload="runBar();">
        <h1 style="text-align: center;color: darkcyan;">#Smart Library 1.1</h1>
        <progress value="10" min="0" max="100" id="bar"></progress>
        <h3 style="text-align: center;color: darkred;">Please wait...</h3>
    </body>
</html>
