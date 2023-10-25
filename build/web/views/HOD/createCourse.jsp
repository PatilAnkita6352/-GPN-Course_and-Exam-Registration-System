<%-- 
    Document   : create_course
    Created on : Jul 28, 2018, 10:49:53 PM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Create Course</title>
    </head>
    <body>
    <%if(session.getAttribute("hod_user")==null || session.getAttribute("hod_uname")==null){
            response.sendRedirect("../../index.jsp"); 
}else if(session.getAttribute("hod_user").equals("hod")){%>
    <jsp:include page="../headerforallPanelviews.jsp"/>
     
        <div class="container">
            <h1>Create Course</h1> <hr>
       <form action="../../Controller/addCourse.jsp" method="post">
           Course code : <input type="text" name="course_code" placeholder="ex. CM6445" required oninvalid="this.setCustomValidity('Course name is required.')"
                              oninput="this.setCustomValidity('')">
            <br><br>
            Course Name : <input type="text" name="course_name" required oninvalid="this.setCustomValidity('Course name is required.')"
                              oninput="this.setCustomValidity('')">
            <br><br>
            Programme: <select name="programme" required oninvalid="this.setCustomValidity('Programme is required.')"
                              oninput="this.setCustomValidity('')">
                        <option>CM</option>
                        <option>IF</option>
                        <option>ME</option>
                        <option>EE</option>
                        <option>CE</option>
                        <option>PE</option>
                        <option>EL</option>
                        <option>DDGM</option>
                        <option>IDD</option>
                        <option>AE</option>
            </select>
            <br><br>
             <br><br>
             Curriculum year:<input type="number" name="curriculum" required >
             <br><br>
            Year : <select name="year" required oninvalid="this.setCustomValidity('year is required.')"
                              oninput="this.setCustomValidity('')">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                    </select>
            <br><br>
            Term : <select name="term" required oninvalid="this.setCustomValidity('Term is required.')"
                              oninput="this.setCustomValidity('')">
                    <option>ODD</option>
                    <option>EVEN</option>
            </select>
            <br><hr>
            <h5>Enter zero(0) if course is not theory,practical,PT,oral or term work</h5>
            <br>
            Exemption:<select name="is_exempted" required oninvalid="this.setCustomValidity('Exemption is required.')"
                              oninput="this.setCustomValidity('')">
                    <option>y</option>
                    <option>n</option>
            </select>
            <br><br>
            Course Credits:<input type="number" name="cou_credit" min="0" required oninvalid="this.setCustomValidity('Course Credits cannot be negative.')"
                              oninput="this.setCustomValidity('')"/><br><br>
            Course Theory Credits:<input type="number" name="cou_th_credits" min="0" required oninvalid="this.setCustomValidity('Course Theory Credits cannot be negative.')"
                              oninput="this.setCustomValidity('')"/><br><br>
            Course Practical Credits:<input type="number" name="cou_pr_credits" min="0" required oninvalid="this.setCustomValidity('Course Practical Credits cannot be negative.')"
                              oninput="this.setCustomValidity('')"/><br><br>
            Course Tutorial Credits:<input type="number" name="cou_tu_credits" min="0" required oninvalid="this.setCustomValidity('Course Tutorial Credits cannot be negative.')"
                              oninput="this.setCustomValidity('')"/><br>
            <br><br>
            Theory&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="number" name="cou_th_min" min="0"required oninvalid="this.setCustomValidity('Minimum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="number" name="cou_th_max" min="0" required oninvalid="this.setCustomValidity('Maximum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')"><br><br>
            Periodic Test&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="number" min="0" name="cou_pt_min" required oninvalid="this.setCustomValidity('Minimum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="number" name="cou_pt_max" min="0" required oninvalid="this.setCustomValidity('Maximum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')"><br><br>
            Term Work&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="number" name="cou_tw_min" min="0" required oninvalid="this.setCustomValidity('Minimum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="number" name="cou_tw_max" min="0" required oninvalid="this.setCustomValidity('Maximum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')"><br><br>
            Practical&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="number" name="cou_pr_min" min="0" required oninvalid="this.setCustomValidity('Minimum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="number" name="cou_pr_max" min="0" required oninvalid="this.setCustomValidity('Maximum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')"><br><br>
            Oral&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;Minimum marks:<input type="number" name="cou_or_min" min="0" required oninvalid="this.setCustomValidity('Minimum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')">
            &nbsp;&nbsp;&nbsp;Maximum marks:<input type="number" name="cou_or_max" min="0" required oninvalid="this.setCustomValidity('Maximum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')"><br><br>
            Total marks&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<input type="number" name="Total_Marks" min="0" required oninvalid="this.setCustomValidity('Minimum marks cannot be negative.')"
                              oninput="this.setCustomValidity('')"><br><br>
            <button class="btn btn-primary">Submit</button> 
        </form>
        </div>
       <%@include file="../../footer.jsp" %>
    </body>
    <%}%>
</html>
