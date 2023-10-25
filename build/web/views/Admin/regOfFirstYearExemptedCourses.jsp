<%-- 
    Document   : examregOfFirstYearExemptedCourses
    Created on : 1 Mar, 2019, 11:04:19 PM
    Author     : ADMIN
--%>

<%@page import="beans.Course_reg"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration of first year exempted courses</title>
       
    </head>
    <body>
                <%
        if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null )
            {
                 response.sendRedirect("../../index.jsp");
            }
        else  if(session.getAttribute("admin_user").equals("admin"))
            { 
                %><jsp:include page="../headerforallPanelviews.jsp"/><%
                try{
                    String result=request.getParameter("result");
                
                try{if(!result.equals(null)){ %> <p class="text-success"><%= result %></p> <% }}catch(Exception e){} 
        
                String failResult=request.getParameter("failResult");
                try{if(!failResult.equals(null)){ %> <p class="alert alert-success"><%= failResult %></p> <% }}catch(Exception e){}
                
                String rollNo=request.getParameter("rollNo");
                SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
                String date=f.format(new Date());
                
                //out.println("bhwcccccccccccccccccccw"+rollNo);
                Student_data stud=new Student_data();
                stud=(Student_data)StudCon.getStudentInfo(rollNo);
                //out.println("88888888888888888888888888888888888888"+stud.getProgramme());
                int j=1;
                List list1,list2;
                list1=AdminCon.getFirstYearExemptedCourses(rollNo,stud.getProgramme(),stud.getTerm());
                list2=StudCon.getRegCourse(rollNo,stud.getTerm(),stud.getYear());
                %>
                
             <br>
             <div class="container">
             <center>
             <h1>Exempted Courses</h1>
             <form method="POST">
             <table border="1" class="table">
                 <thead>
                 <th>Sr.no</th> 
                 <th>Select Course</th>
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
                for(Object obj1:list1)
                {
                    Courses course=(Courses)obj1;
                    for(Object obj2:list2)
                    {
                        Course_reg coursereg=(Course_reg)obj2;
                        if(course.getCourse_code().equals(coursereg.getCourse_code().trim()))
                        {
                            %>
                             <tr> 
                <td><%=j++%></td> 
                <td><input type="checkbox" name="course[]" value="<%=course.getCourse_code()%>" ></td>
                <td><%=course.getCourse_code()%></td> 
                <td><%=course.getCourse_name()%></td>  
                <td><%=course.getCou_credit() %></td>  
                <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                             </tr> 
                <%
                        }//close inner if
                    }//closing of inner for loop
                }//closing of outre for loop%>
                </table>
                <br><br><button class="btn btn-primary" formaction="../../Controller/exemptFirstYearCourses.jsp">Exempt</button> 
                <input type="hidden" name="rollNo" value="<%=rollNo%>">
             </form></center>
             
             </div>
      <%  } catch(Exception e){System.out.print("____________________Exception in regOfFirstYearExemptedCourses.jsp "+e);}
}
      %>
    </body>
</html>
