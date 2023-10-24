<%-- 
    Document   : setEquivalentCourse.jsp
    Created on : 8 Dec, 2020, 5:41:28 PM
    Author     : Ghost
--%>
<%@page import="beans.Courses"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mainController.CourseCon"%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%//to check whether user(Student) is login or not
            String hod_uname=((String)session.getAttribute("hod_uname"));
            if(hod_uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
            { 
         
                Hod_data hd=HodCon.getHODInfo(hod_uname);
                
                List<String[]> a= new ArrayList<String[]>();
                //Retrieving old curriculum courses for specific programme
                List li=HodCon.getOldCurriculumCourses(hd.getProgramme());
                
                //Retrieving the courses selected for old curriculum courses in setEquiCoursesForm.jsp in selectpicker
                //by using old curriculum coursecodes as request.getParameter()
                //Storing as List of String[] array
                //[oldCourse1,NewSelectedCourse1]
                //[OldCourse2,NewSelectedCourse2]
                for(Object c:li)
                {
                    Courses course=(Courses)c;
                    String cc=request.getParameter(course.getCourse_code());
                    if(cc!="")
                    {String[] equiCourse=new String[2];
                        equiCourse[0]=course.getCourse_code();
                        equiCourse[1]=cc;
                        a.add(equiCourse);
                    }
                }    
                //calling function set equivalent courses
                int result=CourseCon.setEquivalentCourse(a);
                
                if(result>=1)
                {
                    response.sendRedirect("../views/HOD/hodPanel.jsp?result=Equivalent Coursecode set successfully");
                }else if(a.size()==0)
                { response.sendRedirect("../views/HOD/setEquiCoursesForm.jsp?failResult=Please set equivalent courses");}
                else 
                { response.sendRedirect("../views/HOD/hodPanel.jsp?flag1=Equivalent Coursecode set unsuccessfully");}
            }
        %>
    </body>
</html>
