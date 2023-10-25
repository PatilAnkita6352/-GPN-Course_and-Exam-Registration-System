 <%-- 
    Document   : regExam
    Created on : May 9, 2019, 10:06:17 AM
    Author     : Shubham Nehe
--%>
<%@page import="mainController.StudentCoursesCon"%>
<%@page import="beans.StudentCourses"%>
<%@page import="mainController.CourseCon"%>
<%@page import="beans.Courses"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Registration</title>
        <script>
           function onBtn(ch) 
            {
                    var courses=new Array();
                    var ischecked=false; 
                    courses=document.getElementsByName("courseB[]");
                    for(var i=0;i<courses.length;i++)
                    {
                        if(courses[i].checked)
                            {
                                    ischecked=true;
                                    break;
                            }
                    }
                    document.getElementById('register').disabled=!ischecked;
                    
            }
       </script>
    </head>
    <body>
    <% if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
        {
           response.sendRedirect("../../index.jsp");
        }
        else if(session.getAttribute("stud_user").equals("student")) 
       { 
          response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
           String rollNo=(String)session.getAttribute("stud_uname");
            %>
          <jsp:include page="../headerforallPanelviews.jsp"/>
           <form action="../../Controller/regExam.jsp" method="POST">   
               <h1><center><u>Exam Registration</u></center></h1><hr>
       <%    Student_data stud=(Student_data)StudCon.getStudentInfo(rollNo);
           //list2 gives courses which are registered by student.
            List<Course_reg> list2=(List<Course_reg>)StudCon.getRegularRegCourses(rollNo, stud.getTerm(),stud.getYear());
           
            Courses course=null;
            int j;
            StudentCourses studCourses;
            StudentCourses backCourseResult;
            //Dispalying regular registered courses.
            if(list2.size()!=0)
            {
                %>
              <center><h2>Registered courses</h2><br>
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
                 <%
                //Using for each loop for showing available courses.
                
                j=1;
                   for(Course_reg coursereg:list2)
                    { 
                        course=CourseCon.getCourseObject(coursereg.getCourse_code());        
                %>
                    <tr> 
                    <td><%=j++%></td> 
                    <td><%=course.getCourse_code()%></td> 
                    <td><%=course.getCourse_name()%></td>  
                    <td><%=course.getCou_credit() %></td>  
                    <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                    </tr> 
              <%   }//for closing
                 
                }//if closing
             %>         
        </table>
        
        <%   List<Course_reg> list3=(List<Course_reg>)StudCon.getBacklogRegCourses(rollNo, stud.getTerm(),stud.getYear());
            //Dispalying backlog courses. 
             if(list3.size()!=0)
            { %>
              <h2>Backlog courses</h2>
             <table border="1" class="table"> 
            <thead>
            <tr>
            <th rowspan="2" style="text-align: center; padding-bottom: 20px; ">Sr.no</th> 
            <th rowspan="2" style="text-align: center;padding-bottom: 15px;" >Select Version</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 15px;">Course Code</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">Course Name</th>
            <th  colspan="4" style="text-align: center;"> Credits</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">TH</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">PT</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">PR</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">TW</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">OR</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">Curriculum</th>
            </tr>
            <tr>
                
                <th >TH</th>
                <th >PR</th>
                <th >TU</th>
                <th>Total</th>
                
            </tr>
            </thead>
            
             <% 
                j=1;
                //for(Object obj:list3)
                for(Course_reg coursereg:list3)
                {
                    course=CourseCon.getCourseObject(coursereg.getCourse_code().trim());
                    backCourseResult=StudentCoursesCon.getStudCourseResult((String)session.getAttribute("stud_uname"), course.getCourse_code());
                    System.out.print("**********************************************************************************************************");
                    System.out.println("_______Theory"+backCourseResult.isTheoryIsPass());
                    System.out.println("_______ Oral"+backCourseResult.isOralIsPass());
                    System.out.println("_______ Termwork"+backCourseResult.isTermworkIsPass());
                    System.out.println("_______ Practical"+backCourseResult.isPracticalIsPass());
                    
                     %>
                    <tr> 
                        <td><%=j++%></td> 
                        <td><input type="checkbox" name="courseB[]" value=" <%=coursereg.getCourse_code()%>" checked onchange="onBtn()"></td>
                        <td><%=course.getCourse_code()%></td> 
                        <td><%=course.getCourse_name()%></td>
                        <td><%=course.getCou_th_credits()%></td>
                        <td><%=course.getCou_pr_credits()%></td>
                        <td><%=course.getCou_tu_credits()%></td>
                        <td><%=course.getCou_credit() %></td> 
                        
                        
                        <%
                            /*if(course.getCou_th_min()>0)
                            {
                                //either this one is back or pass
                                if back
                                    state="checked";//back
                                else
                                    state="checked disabled"//passed
                            }
                            else state="disabled"; //This means that this thing cannot be registered by student(it is unavailable).
                        */
                        %> 
                        <td><%if(course.getCou_th_min()>0){ if(backCourseResult.isTheoryIsPass())out.print("PASS"); else {%><input type="checkbox" name="courseTH[]" checked onclick="return false;"><%}} else out.print("--");%> </td>  
                        <td><%if(course.getCou_pt_min()>0){ if(true)out.print("PASS"); else {%><input type="checkbox" name="coursePT[]" checked onclick="return false;"><%}} else out.print("--");%> </td>  
                        <td><%if(course.getCou_pr_min()>0){ if(backCourseResult.isPracticalIsPass())out.print("PASS"); else {%><input type="checkbox" name="coursePR[]" checked onclick="return false;"><%}} else out.print("--");%> </td>  
                        <td><%if(course.getCou_tw_min()>0){ if(backCourseResult.isTermworkIsPass())out.print("PASS"); else {%><input type="checkbox" name="courseTW[]" checked onclick="return false;"><%}} else out.print("--");%> </td>  
                        <td><%if(course.getCou_or_min()>0){ if(backCourseResult.isOralIsPass())out.print("PASS"); else {%><input type="checkbox" name="courseOR[]" checked onclick="return false;"><%}} else out.print("--");%> </td>                        
                        <td><%=course.getCurriculum()%></td>
                    </tr> 
                    <%  
                }//for close
             %> 
             </table>
                    <%
            }// if close%>
        <button class="btn btn-primary" id="register">Register for Exam</button> 
             </center>
           </form>
       <%}//session checing if closed %>
       
       
    </body>
</html>