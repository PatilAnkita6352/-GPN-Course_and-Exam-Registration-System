

<%@page import="java.util.Arrays"%>
<%@page import="mainController.StudentCoursesCon"%>
<%@page import="beans.StudentCourses"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.ExamRegCon"%>
<%@page import="mainController.CourseCon"%>
<%@page import="beans.Exam_reg"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Admin_data"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Student_data"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration of Examination</title>
    </head>
    <body>
        <%
            //session checking
            if(session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null)
            { 
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("registrar_user").equals("registrar")) 
           {  
               System.out.print("________________________________________________________&&&&&&&&&&&&&&&&&&&&&&&&&&&&regExamByRegistrar.jsp(Controller)&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"); 
               String rollNo=(String)session.getAttribute("studroll"); 
                List<String>studLi=new ArrayList<String>();
                int m=0;
               if(rollNo.equals("0")){
                   m=1;
                   studLi=(List)session.getAttribute("EstudList");   
                   rollNo=studLi.get(0);
               }
               Student_data stud=(Student_data)StudCon.getStudentInfo(rollNo);
             
               if(StudCon.getExRegStatus(stud.getRollno(),stud.getTerm(),stud.getYear())&&m!=1)
               response.sendRedirect("../views/Registrar/studRegList.jspfailResult=Exam registration of rollno "+stud.getRollno()+" has been already done.");
               else
               {//list2 gives regular courses which are registered by student.
                List<Course_reg> list2=(List<Course_reg>)StudCon.getRegularRegCourses(stud.getRollno(), stud.getTerm(),stud.getYear());
               String courses[]=new String[list2.size()];
               Courses course=null;
               String courseB[]=request.getParameterValues("courseB[]");
               int i=0;
               //Copying regular course codes into string array.
               for(Course_reg c1:list2)
               {
                    courses[i++]=c1.getCourse_code();
               }
               
               Admin_data ad=(Admin_data)AdminCon.getAdminInfo();
               /*System.out.print("_______________________courses");
               for(String s:courses)
               {
                  System.out.print("_______________________course____________"+s);            
               }*/
               int StatAllRegularExam=0;
               if(m!=1){
                //Exam registration of regular courses.
               int res[]=StudCon.regExam(courses,courseB,rollNo,ad.getReg_term_year(),stud.getTerm(),stud.getYear(),(String)session.getAttribute("registrar_user"));
               }
               else{StatAllRegularExam=1;
                    int res[]=StudCon.AllRegularRegExam(courses,courseB,studLi,ad.getReg_term_year(),stud.getTerm(),stud.getYear(),(String)session.getAttribute("registrar_user"));
               }
                   
                   try{
               System.out.println("\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n");
               
               
               System.out.print("_______________________BACKLOG courses");
            

            }
            catch(Exception e) 
            { 
                System.out.print("______________________Exception in regExamByRegistrar.jsp(Controller)____________________"+e);
            }
            if(m!=1)
            {      
                response.sendRedirect("../views/Registrar/printRegistration.jsp");
            }
               
            else
            {   session.setAttribute("studroll","0");
                response.sendRedirect("../views/Registrar/examRegAllRegularPrint.jsp"); 
            }  
               }
        } //if close for session check
            %>
    </body>
</html> 
