<%-- 
    Document   : index
    Created on : May 19, 2022, 1:26:28 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
//Start Session
<%@ page session = "true" %>
<%
    //Declare page title string
    String page_title = "page_title";
    session.setAttribute("page_title","page_title");  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Print Page Title Here -->
        <title><% request.getSession().getAttribute("page_title"); %></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
              font-family: Arial, Helvetica, sans-serif;
            }

            .navbar {
              overflow: hidden;
              background-color: #333;
            }

            .navbar a {
              float: left;
              font-size: 16px;
              color: white;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
            }

            .dropdown {
              float: left;
              overflow: hidden;
            }

            .dropdown .dropbtn {
              font-size: 16px;  
              border: none;
              outline: none;
              color: white;
              padding: 14px 16px;
              background-color: inherit;
              font-family: inherit;
              margin: 0;
            }

            .navbar a:hover, .dropdown:hover .dropbtn {
              background-color: red;
            }

            .dropdown-content {
              display: none;
              position: absolute;
              background-color: #f9f9f9;
              min-width: 160px;
              box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
              z-index: 1;
            }

            .dropdown-content a {
              float: none;
              color: black;
              padding: 12px 16px;
              text-decoration: none;
              display: block;
              text-align: left;
            }

            .dropdown-content a:hover {
              background-color: #ddd;
            }

            .dropdown:hover .dropdown-content {
              display: block;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <%
                //3D Array Definition
                String[][][] menus = new String[][][]
                {
                    {{"menu1","menu1_link_url"}},
                    {{"menu3"}, {"submenu3_1", "submenu3_1_link_url"}, {"submenu3_2","submenu3_2_link_url"}},
                    {{"menu2"},{"submenu2_1", "submenu2_1_link_url"}, {"submenu2_2", "submenu2_2_link_url"}, {"submenu2_3", "submenu2_3_link_url"}}
                };
                
                //try and catch for the iteration of the 2D Array
                try {
                    for (String[][] strings : menus) {
                        //get elements with no sub menu here
                        if(strings.length==1){
                            out.println("<a href='"+strings[0][1]+"'>"+strings[0][0]+"</a>");
                        }else{
                            //elements with sub menu here
                            out.println("<div class='dropdown'><button class='dropbtn'>"+strings[0][0]+"<i class='fa fa-caret-down'></i></button>");
                                //sub menus starting here
                                out.println("<div class='dropdown-content'>");
                                for (int i = 1; i < strings.length; i++) {
                                    out.println("<a href='"+strings[i][1]+"'>"+strings[i][0]+"</a>");
                                }
                                out.println("</div>");
                            out.println("</div>");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
        <h1>Hello World!</h1>
    </body>
</html>
