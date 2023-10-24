<%-- 
    Document   : confirmCourse
    Created on : Aug 26, 2018, 8:49:03 PM
    Author     : Shubham Nehe
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="beans.Courses"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Course</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <script src="../../assets/js/jquery1.min.js"></script>
        <script src="../../assets/js/bootstrap1.min.js"></script>
        <style>
            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
            }

            .pagination a.active {
                background-color: dodgerblue;
                color: white;
            }

            .pagination a:hover:not(.active) {background-color: #ddd;}
</style>
    </head>
    <body>
        
    <%
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           { 
            %>
            <jsp:include page="../headerforallPanelviews.jsp"/>
            <div class="container"><%try{
            if(!(request.getParameter("result").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success">   <a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("result"));%></p></div></div>
            <% }
                }catch(Exception e){}
                
        %></div>
            <div class="container"><%
               int i=1; 
               List newCourses=AdminCon.checkNewCourse();
               String p=request.getParameter("page");
               i=Integer.parseInt(p); 
               //out.println(i);
               %>
               
               <% 
                    int size=newCourses.size();
                    //out.println("4444444444444444444444444"+size);
                    if(size!=0){
                    Courses course=(Courses)newCourses.get(i-1); 
               %>
            <br>  
            <h1>Course Confirmation</h1><br><br>
            <form action="../../Controller/addCourse.jsp?size=<%=size%>" method="post">
            Course code : <input type="text" name="course_code" value="<%=course.getCourse_code()%>">
            <br><br>
            Course Name : <input type="text" name="course_name" value="<%=course.getCourse_name()%>">
            <br><br>
            Programme: <input type="text" name="programme" value="<%=course.getProgramme()%>">
            <br><br>
           Curriculum: <input type="text" name="curriculum" value="<%=course.getCurriculum()%>">
            <br><br>
            Year : <input type="text" name="year" value="<%=course.getYear()%>"> 
            <br><br>
            Term : <input type="text" name="term" value="<%=course.getTerm()%>">
            <br><hr>
            <h5>Enter zero(0) if course is not theory,practical,PT,oral or term work</h5>
            <br>
            Exemption:<input type="text" name="is_exempted" value="<%=course.getIs_exempted()%>">
            <br><br>
            Course Credits:<input type="text" name="cou_credit" value="<%=course.getCou_credit()%>"> 
            <br><br>
            Theory&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="text" name="cou_th_min" value="<%=course.getCou_th_min()%>">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="text" name="cou_th_max" value="<%=course.getCou_th_max()%>"><br><br>
            Periodic Test&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="number" name="cou_pt_min" value="<%=course.getCou_pt_min()%>">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="text" name="cou_pt_max" value="<%=course.getCou_pt_max()%>"><br><br>
            Term Work&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="number" name="cou_tw_min" value="<%=course.getCou_tw_min()%>">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="text" name="cou_tw_max" value="<%=course.getCou_tw_max()%>"><br><br>
            Practical&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="text" name="cou_pr_min" value="<%=course.getCou_pr_min()%>">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="text" name="cou_pr_max" value="<%=course.getCou_pr_max()%>"><br><br>
            Oral&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="text" name="cou_or_min" value="<%=course.getCou_or_min()%>">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="text" name="cou_or_max" value="<%=course.getCou_or_max()%>"><br><br>
            <br> 
            Total marks&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<input type="number" name="Total_Marks" value="<%=course.getTotal_Marks()%>" min="0" required oninvalid="this.setCustomValidity('Minimum marks cannot be negative.')"
            oninput="this.setCustomValidity('')"><br><br>
            <input type="hidden" name="is_validated" value="y">
            <input type="hidden" name="id" value="<%=course.getId()%>"> 
            <button class="btn btn-primary">Confirm</button> 
        </form>
            
            
            <% 
             for(int j=1;j<=size;j++){  %> 
            <div class="pagination">
                <a href="confirmCourse.jsp?page=<%=j%>" value="<%=j%>"><% out.print(j);%></a> 
            </div> 
                <%  } 
           }
           else
           {
                 response.sendRedirect("adminPanel.jsp?failResult=Sorry, but no any course requested for confirmation");
           }
%></div><%
        }
    %>
    </body>
</html>
