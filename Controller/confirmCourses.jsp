
<%@page import="beans.Course_reg"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page import="java.util.List"%>
<%@page import="beans.Courses"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Courses</title>
    </head>
    <body> 
       <%
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("../index.jsp");
            }
            else if(session.getAttribute("stud_user").equals("student"))
           { Courses course;
        int j=1;
        List<String> list=null,list1=null,list2=null;
        Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
        try
        {   
            String saveOrReg="register";
            list=StudCon.getRegCourse((String)session.getAttribute("stud_uname"),stud.getTerm(),stud.getYear());
            list1=StudCon.getPendingCourse((String)session.getAttribute("stud_uname"));
            list2=StudCon.getBackCourse((String)session.getAttribute("stud_uname"));
            String courses[]=new String[list.size()];int i=0;
            for(Object o:list)
            {
                Course_reg cr=(Course_reg)o;
               StudCon.confirmCourse((cr));
            }
            response.sendRedirect("../views/Student/regCourse.jsp");
        }
        catch(Exception e)
        {
            out.println("________________________________________(views/saveOrRegCourse.jsp)Retrieval of the course give exception "+e+"occured.");
        }
           }
        %>
    </body>
</html>
