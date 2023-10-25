
<%@page import="beans.Admin_data"%>
<%@page import="java.util.List"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemption of Courses</title>
    </head>
    <body>
        <%
                    
        if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null )
            {
                 response.sendRedirect("../../index.jsp");
            }
        else if(session.getAttribute("admin_user").equals("admin"))
            {
              
            //if block is used to do exam registration of 1st year courses of dsy student. 
            try{
                String rollNo=request.getParameter("rollNo");
                SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
                String date=f.format(new Date());
                Student_data sd=new Student_data();
                Admin_data ad=AdminCon.getAdminInfo();
                
                if(request.getParameter("actionTodo").equals("Dsy1stYearExamReg"))//fpr second year DSY student
                {
                    AdminCon.regExamDsyFirstYearCourses(rollNo,ad.getReg_term_year());
                    List list=AdminCon.studentDetails(rollNo);
                    if(list==null) 
                        response.sendRedirect("../views/Admin/exemption.jsp?failResult=Roll number does not exist.");
                    else
                        response.sendRedirect("../views/Admin/exemption.jsp?result=Successfull examination registration of exempted courses .");
                }
                else if(request.getParameter("actionTodo").equals("exemption"))//for first year exempted coureses.
                {
                    try{
                        sd=(Student_data)StudCon.getStudentInfo(rollNo);
                        if(sd==null)
                            response.sendRedirect("../views/Admin/exemption.jsp?failResult=Roll number does not exist.");
                        int hscMarks = (int)sd.getS_hsc_mark();
                        if(hscMarks>0 && ((int)sd.getS_hsc_pass())==1)
                        {
                            response.sendRedirect("../views/Admin/regOfFirstYearExemptedCourses.jsp?rollNo="+rollNo);
                        }
                        else
                        {
                            response.sendRedirect("../views/Admin/exemption.jsp?failResult=Sorry you are not eligible for exemption of courses for first year");
                        }
                    }catch(Exception e){response.sendRedirect("../views/Admin/exemption.jsp?failResult=Roll number does not exist.");}
                        
                }
            }catch(Exception e){System.out.print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"+e);}
            }
            
        %>
    </body>
</html>
