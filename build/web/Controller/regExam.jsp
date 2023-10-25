
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
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            { 
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("stud_user").equals("student")) 
           {  
               System.out.print("________________________________________________________&&&&&&&&&&&&&&&&&&&&&&&&&&&&regExam.jsp(Controller)&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"); 
               String rollNo=(String)session.getAttribute("stud_uname"); 
               Student_data stud=(Student_data)StudCon.getStudentInfo(rollNo);
               int isExReg=0;
               List listEx=StudCon.getExRegCourse(stud.getRollno(),stud.getTerm() ,stud.getYear()); 
               for(Object obj:listEx)
               {
                   Exam_reg ex=(Exam_reg)obj;
                    if(ex.getEx_cancel()==1)
                        isExReg=isExReg+1;
               }
               if(isExReg==listEx.size()&&isExReg>0)
               response.sendRedirect("../views/Student/studPanel.jsp?wrongResult=You have already registered for exam. Click on Go for Registration to get registration print");
               else
               {
               List<Course_reg> list2=(List<Course_reg>)StudCon.getRegularRegCourses(stud.getRollno(), stud.getTerm(),stud.getYear());
               String courses[]=new String[list2.size()];
               String courseB[]=request.getParameterValues("courseB[]");
               Courses course=null;
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
               
                //Exam registration of regular courses.
               int res[]=StudCon.regExam(courses,courseB,rollNo,ad.getReg_term_year(),stud.getTerm(),stud.getYear(),(String)session.getAttribute("stud_user"));
               try{
               System.out.println("\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n\n*\n*\n*\n*\n");
               System.out.println("zxcvb");
               
               System.out.print("_______________________BACKLOG courses");
               for(String s: courseB)
               { 
                  System.out.println(s);            
               } 
            }
            catch(Exception e) 
            { 
                System.out.print("______________________Exception in regExam.jsp(Controller)____________________"+e);
            }
            response.sendRedirect("../views/Student/printRegForStud.jsp");
          }
        } //if close for session check
            %>
    </body>
</html> 
