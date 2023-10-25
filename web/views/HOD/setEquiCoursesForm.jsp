<%-- 
    Document   : setEquiCourses.jsp
    Created on : 8 Dec, 2020, 4:39:50 PM
    Author     : Ghost
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.List"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Set Equivalent Courses</title>
        <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     <link rel="stylesheet" href="../../assets/css/bootstrap-select.min.css">
        <script src="../../assets/js/bootstrap-select.min.js"></script>
        <script src="ajax"></script>
    
    </head>
    <body>
         <%String hod_uname=((String)session.getAttribute("hod_uname"));
           if(hod_uname.equals(null))
            {
              response.sendRedirect("../../index.jsp");
            }
           else{
             %> <jsp:include page="../headerforallPanelviews.jsp"/> 
             <div class="container"><%
              try{
            if(request.getParameter("failResult")!=null){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}     
        %></div>
         <%
                 
                 Hod_data hd=HodCon.getHODInfo(hod_uname);
           
             %>  
                <br><div class="container"><center>
                   <h1>Set Equivalent Courses</h1><hr>
        <form action="../../Controller/setEquivalentCourse.jsp" method="post">
        <%
            //Retrieving old curriculum courses of specific programme (branch)
            List li=HodCon.getOldCurriculumCourses(hd.getProgramme());
            //Retrieving current curriculum courses of specific programme (branch)
            List li2=HodCon.getCurrentCurriculumCourses(hd.getProgramme());
            int j=0;%>
            <table border="1" class="table">
                        <thead>
                        <th>Sr.no</th>
                        <th >Course Code</th>
                        <th>Course Name</th>
                        <th>Year</th>
                        <th>Term</th>
                        <th>Curriculum</th>
                        <th width="400">Equivalent</th>
                        </thead>
                        <tbody>
            <%for(Object c:li)
            {
                Courses course=(Courses)c;
                %>
                    <tr>
                        <td><%= ++j %></td>
                        <td><%= course.getCourse_code()%></td>
                        <td><%= course.getCourse_name()%></td>
                        <td><%= course.getYear()%></td>
                        <td><%= course.getTerm()%></td>
                        <td><%= course.getCurriculum()%></td>
                        <td><select class="selectpicker" data-live-search="true" name="<%=course.getCourse_code()%>">
                           <%if(course.getNewEquivalentCourse()==null )
                           {%><option value="" selected hidden>Select a course</option><%}
                           //for loop for selectpicker of courses
                           for(Object obj1:li2)
                           {
                               String status="";
                               Courses cr=(Courses)obj1;  
                               if(cr.getCourse_code().equals(course.getNewEquivalentCourse()))
                               {    status="selected";}
                               %>    
                               <option <%=status%> value="<%=cr.getCourse_code()%>"><%=cr.getCourse_name()%><%out.print("("+cr.getCourse_code()+")");%><%out.println("("+cr.getCurriculum()+")");%></option>
                               <%
                           }
                           %></select>
                        </td>
                    </tr>
                <%
            }%></tbody></table>   
            <button class="btn btn-primary">Submit</button><hr>
        </form></center>
        </div>
               <%  }%>
         <%@include file="../../footer.jsp" %>
    </body>
</html>
