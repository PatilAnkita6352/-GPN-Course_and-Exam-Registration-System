<%-- 
    Document   : regExam
    Created on : May 9, 2019, 10:06:17 AM
    Author     : Shubham Nehe
--%>

<%@page import="mainController.HodCon"%>
<%@page import="mainController.StudentCoursesCon"%>
<%@page import="beans.StudentCourses"%>
<%@page import="mainController.CourseCon"%>
<%@page import="beans.Courses"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control","no-cache,must-revalidate");%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Registration</title>
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
        <style>.invalid-alert{
    border-radius: 20px;
    margin:10px 420px 10px 30px ;
    background-color:#ffcccc;
    font-size:20px;
    padding:20px 0px 20px 20px;
    color:#ff3333;
    
    } </style>
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
    <%
    if(session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null)
        {
           response.sendRedirect("../../index.jsp");
        }
        else if(session.getAttribute("registrar_user").equals("registrar")) 
       { 
     System.out.println(session.getAttribute("studroll"));
           String rollNo=(String)session.getAttribute("studroll");
           List<String>studLi=new ArrayList<String>();
           
           int m=0;
           if(rollNo.equals("0"))
           { m=1;
               for (Object oo:(List)session.getAttribute("Allstud")) 
                {
                                HodCon.StudentReg studo=(HodCon.StudentReg)oo;
                                
                                if(HodCon.checkRegStatus(studo.getRollno(),studo.getTerm(),studo.getYear())
                                      && !StudCon.getExRegStatus(studo.getRollno(),studo.getTerm(),studo.getYear())
                                        && StudCon.getBackCourse(studo.getRollno()).size()==0
                                        && !studo.getS_regular().equals("d"))
                                { 
                                    studLi.add(studo.getRollno());
                                   rollNo=studLi.get(0);
                                }
                                
                         }
                
               
           }
           try{
            if(studLi.size()==0 && rollNo.equals("0")){rollNo="";%>
            <br><br><div class="invalid-alert" ><%
                response.sendRedirect("studRegList.jsp?failResult=No Regular student for exam registration");
                %><a style="font-size:25px;padding:0px 10px 0px 100px;" href="studRegList.jsp">&times;</a></div><br><br>   
        <%}}catch(Exception e){}

           Student_data stud=(Student_data)StudCon.getStudentInfo(rollNo);

           %>
        <jsp:include page="../headerforallPanelviews.jsp"/>
        <a id="back"href='studRegList.jsp'>
            <button id="BackBtn" value="Back" class="btn btn-lg btn-primary">Back</button></a>
            
           <% if(m!=1){%>
           <form method="POST" action="courseRegPrint.jsp">
               <button class="btn btn-primary pull-right">Course Registration Print</button>
           </form><br> 
           <% }%>
           <form method="POST">   
              
              
               <%  
                   List<Course_reg> list2=(List<Course_reg>)StudCon.getRegularRegCourses(rollNo, stud.getTerm(),stud.getYear()); 
        
                   
                 if(m!=1){%> <h1><center><u>Exam Registration</u></center></h1><hr><%}
                else{%><h1><center><u>Exam Registration for All Regular Students</u></center></h1><hr><%}
                    
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
                 <th>Curriculum</th>
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
                    <td><%=course.getCurriculum()%></td>
                    </tr> 
              <%   }//for closing%>
             </table>  </center>
           <% }
%>
        <center>
        <%  if(m!=1) {
            
List<Course_reg> list3=(List<Course_reg>)StudCon.getBacklogRegCourses(rollNo, stud.getTerm(),stud.getYear());
//Dispalying backlog courses. 
             if(list3.size()!=0)
            { %>
              <h2>Backlog courses and Detention Courses</h2>
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
                    backCourseResult=StudentCoursesCon.getStudCourseResult(rollNo, course.getCourse_code());
                    System.out.print("****************************************************************************************************************************************************************************************************************************************************************************************************************************");
                    System.out.println("_________________Theory"+backCourseResult.isTheoryIsPass());
                    System.out.println("_________________ Oral"+backCourseResult.isOralIsPass());
                    System.out.println("_________________ Termwork"+backCourseResult.isTermworkIsPass());
                    System.out.println("_________________ Practical"+backCourseResult.isPracticalIsPass());
                    
                     %>
                    <tr> 
                        <td><%=j++%></td> 
                        <td><input type="checkbox" name="courseB[]" value="<%=course.getCourse_code()%>" checked onchange="onBtn()"></td>
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
                        <td><%if(course.getCou_th_min()>0 && course.getCou_th_max()>0){ if(backCourseResult.isTheoryIsPass())out.print("PASS"); else {%><input type="checkbox" name="courseTH[]" checked onclick="return false;"><%}} else out.print("--");%> </td>  
                        <td><%if(course.getCou_pt_min()>0 && course.getCou_pt_max()>0){ out.print("PASS");} else out.print("--");%> </td>  
                        <td><%if(course.getCou_pr_min()>0 && course.getCou_pr_max()>0){ if(backCourseResult.isPracticalIsPass())out.print("PASS"); else {%><input type="checkbox" name="coursePR[]" checked onclick="return false;"><%}} else out.print("--");%> </td>  
                        <td><%if(course.getCou_tw_min()>0 && course.getCou_tw_max()>0){ if(backCourseResult.isTermworkIsPass())out.print("PASS"); else {%><input type="checkbox" name="courseTW[]" checked onclick="return false;"><%}} else out.print("--");%> </td>  
                        <td><%if(course.getCou_or_min()>0 && course.getCou_or_max()>0){ if(backCourseResult.isOralIsPass())out.print("PASS"); else {%><input type="checkbox" name="courseOR[]" checked onclick="return false;"><%}} else out.print("--");%> </td>               
                        <td><%=course.getCurriculum()%></td>
                    </tr> 
                    <%  
                }//for close
             %> 
             </table>
                    <%
              }//outer if close
                    } else
                        {     session.setAttribute("EstudList",studLi); %>
      </center><h4>Selected Regular Students whose Course Registration is done(Total - <%=studLi.size()%>) :</h4> <%out.print(studLi.toString().replace(",","&nbsp;&nbsp;"));}%>
               <%
                    String path="../../Controller/regExamByRegistrar.jsp";
                    if(m==1)
                    {      path="../../Controller/regExamByRegistrar.jsp";}%><br><br><br>
                    <center>  <button class="btn btn-primary" id="register" formaction="<%=path %>" >Register for Exam</button><br> 
             </center>
           </form>
       <% }//session checing if closed %>
       
       
    </body>
</html>
