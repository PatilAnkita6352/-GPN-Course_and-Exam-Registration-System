<%-- 
    Document   : selectCourses
    Created on : Sep 1, 2018, 12:53:15 AM
    Author     : sarvadnya
--%>

<%@page import="SessionFact.SessionFact"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="beans.Hod_data"%>
<%@page import="org.hibernate.Query"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page import="mainController.CourseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <title>Select Courses</title>
        
    </head>
    <body>
       
           
        <%  
           String uname=((String)session.getAttribute("hod_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { %>
           
           <%@include file="headerforallPanelController.jsp"%>
          
           <div class="container">
                <h2>Offer courses</h2>
        <br><% String result=request.getParameter("result");
            try{if(!result.equals(null)){ %> <p class="text-success"><%= result %></p> <% }}catch(Exception e){} %><br>
    <center>
        <%
                    String year=request.getParameter("year");
                    String term=request.getParameter("term");
                   //return the list of courses to be offer for registration
                    List l=CourseCon.getCourses(year,uname,term);
                    if(l.size()==0)
                    {
                    response.sendRedirect("../views/HOD/offerCourseForm.jsp?wrongResult=No courses available");
                    }
                    else
                    {
        %>
        <form action="saveOfferCourses.jsp" method="POST">
        <table border="1" class="table">
            <thead>
            <th>Sr.no</th>
            <th>Select Course</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Curriculum</th>
 
            </thead>
            <tbody>
                
                <% 
                    Courses c=new Courses();  
                    int i=0;
                    for(Object obj:l)
                    {
                        c=(Courses)obj;
                    %>
                     <tr>
                    <td><%=++i%></td>
                    <td><input type="checkbox" name="course[]" value="<%= c.getCourse_code() %>" onchange="onBtn()"></td>
                    <td><% out.print(c.getCourse_code()); %></td>
                    <td><% out.print(c.getCourse_name()); %></td>
                    <td><% out.print(c.getCurriculum());%></td>
                    </tr>
                        <%
                         }
        %>
         </tbody>
        </table>
         <a name="checkAll" class="btn btn-primary"  onclick="checkAll()">Check All</a>
         <button class="btn btn-primary" id="offer">Offer</button>
        </form>
    </center>
    <%  
        }
    }
    %>
    <%@include file="../footer.jsp" %>
           </div>
           <script type="text/javascript">
                var courses=new Array();
                var ischecked=false;
                //Reading the available course array into javascript array named courses.
                courses=document.getElementsByName("course[]");
                
                //Checking if any checkbox is checked to enable the save and register buttons.
                for(var i=0;i<courses.length;i++)
                {
                        if(courses[i].checked)
                        {
                                ischecked=true;
                                break;
                        }
                }
                document.getElementById('offer').disabled=!ischecked;
                
            
            function onBtn() 
            {
                    var courses=new Array();
                    var ischecked=false; 
                    courses=document.getElementsByName("course[]");
                    for(var i=0;i<courses.length;i++)
                    {
                            if(courses[i].checked)
                            {
                                    ischecked=true;
                                    break;
                            }
                    }
                    document.getElementById('offer').disabled=!ischecked;
            }
            
            function checkAll()
            {
                var count=0,flag=false;        
                for(var i=0;i<courses.length;i++)
                {
                    if(courses[i].checked==true)
                        count++;
                } 
                if(count==courses.length)
                    flag=false;
                else
                    flag=true;
                for(var i=0;i<courses.length;i++)
                {
                    courses[i].checked=flag; 
                }
                onBtn();
            }
        </script>
    </body>
</html>
