
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.CourseCon"%>
<%@page import="beans.Courses"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Course_reg"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saved Courses</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    </head>
    <body> 
                <jsp:include page="../headerforallPanelviews.jsp"/>

        <%
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else
           { 
            
          %>
         
          <table border="1" class="table">
            <thead>
            <th>Sr.no</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Credits</th>
            <th>TH</th>
            <th>PT</th>
            <th>PR</th>
            <th>TW</th>
            <th>OR</th>
            <th>Curriculum</th>
            </thead>
            <tbody> 
        <br><h1>You have saved following courses.</h1><br> 
      <% 
        Courses course;
        int j=1;
        List<Course_reg> list2=null,list3=null;
        Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
        try
        {
            list2=(List<Course_reg>)StudCon.getRegularRegCourses(stud.getRollno(), stud.getTerm(),stud.getYear());
            list3=(List<Course_reg>)StudCon.getBacklogRegCourses(stud.getRollno(), stud.getTerm(),stud.getYear());

        }
        catch(Exception e)
        {
            out.println("________________________________________(views/saveOrRegCourse.jsp)Retrieval of the course give exception "+e+"occured.");
        }
        
        if(list2!=null){
        for(Course_reg course1:list2){  
            course=CourseCon.getCourseObject(course1.getCourse_code().trim());
            if(course1.getReg_exmt().equals("n"))
            {
      %>
      
        <tr>
            <td><%= j++ %></td>
            <td><%= course1.getCourse_code()%></td>
            <td><%= course.getCourse_name() %></td>
            <td><%=course.getCou_credit() %></td> 
            <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
            <td><%=course.getCurriculum()%></td>
        </tr>               
      <%} 
        } 
        }
        %>
        </tbody> 
        </table>
        <%if(list3.size()!=0){%>
        <br><h2>Backlog Courses</h2><br>
        <table border="1" class="table">
            <thead>
            <th>Sr.no</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Credits</th>
            <th>TH</th>
            <th>PT</th>
            <th>PR</th>
            <th>TW</th>
            <th>OR</th>
            </thead>
            <tbody> 
        <%
        
        for(Course_reg course1:list3){  
            course=CourseCon.getCourseObject(course1.getCourse_code().trim());
      %>
      
        <tr>
            <td><%= j++ %></td>
            <td><%= course1.getCourse_code()%></td>
            <td><%= course.getCourse_name() %></td>
            <td><%=course.getCou_credit() %></td> 
            <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
            <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
        </tr>               
      <%} %>
       </tbody> 
        </table> 
       
      <%
        } 
        if(list2==null) 
        {
            out.println("Sorry but list which is returned by getRegCourse() method found empty.");
        }
                %> 
      (Note: This Course Registration will be done by STUDENT SIDE ONLY)
    <center> 
            <a href="studRegistration.jsp?flag=studpanel" class="btn btn-primary">Edit</a>
<!--            <a href="../../Controller/confirmCourses.jsp" class="btn btn-primary">Confirm</a> -->

           <a href="../../Controller/confirmCourses.jsp" class="btn btn-primary" >Confirm</a> 
    </center>
                <%@include file="../../footer.jsp" %>
       <%}%>
    </body>
</html>
