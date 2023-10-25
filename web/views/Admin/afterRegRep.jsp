<%-- 
    Document   : afterCourseRegRep
    Created on : 20 Nov, 2020, 5:12:41 PM
    Author     : SHWETA
--%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page import="mainController.CourseCon"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Report Filters</title>
       <link rel="stylesheet" href="../../assets/css/bootstrap-select.min.css">
        <script src="../../assets/js/jquery.min.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <script src="../../assets/js/bootstrap-select.min.js"></script>
        <script src="ajax"></script>
    
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        
        <style>
            hr.line{border-top: 2px solid gray}
        </style>
        
    </head>
    <body>
    <%@include file="../headerforallPanelviews.jsp"%>
    <div  id="alert"class="container"><%
        try{
            if(request.getParameter("failResult")!=null){%>
            <div  class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a onclick="document.getElementById('alert').style.display = 'none';"  href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}     
        %></div>
        <a href="RegReport.jsp?regType=<%=session.getAttribute("regType")%>"><button id="BackBtn" value="Back" class="btn btn-lg btn-primary">Back</button></a>
    
    <%!
        String regType;
        String term;
        String regyear;
    %>
    <%      
        regType=(String)session.getAttribute("regType");
        if(session.getAttribute("term")!=null && session.getAttribute("regyear")!=null)
        {
            term=(String)session.getAttribute("term");
            regyear=(String)session.getAttribute("regyear");
        }else
        {    term=request.getParameter("recTerm");
            regyear=request.getParameter("recYear");
            String reg_term_year=AdminCon.getReg_term_year();
            String[] reg=reg_term_year.split("-");
            System.out.println(reg[1]+regyear+term+reg[0]);
            
            /*If user requests report of registration which currently isn't present in database,so to avoid displaying of null data 
            we're showing the msg*/
            if(Integer.parseInt(reg[1])<Integer.parseInt(regyear.substring(regyear.length()-2)))
            {
                response.sendRedirect("RegReport.jsp?failResult=Registration report can be shown upto "+reg_term_year+" only&regType="+regType);
            }else if(Integer.parseInt(reg[1])==Integer.parseInt(regyear.substring(regyear.length()-2)) && term.compareToIgnoreCase(reg[0])<0)
            {
                response.sendRedirect("RegReport.jsp?failResult=Registration report can be shown upto "+reg_term_year+" only&regType="+regType);
            }
            //session attributes term and regyear are removed in adminPanel.jsp file
            session.setAttribute("term",term);
            session.setAttribute("regyear",regyear.substring(regyear.length()-2));
        }
        %>
        <br><div class="container" style="text-align:center;"><%
            //Chaniging heading according to type of report
        if(regType.equals("course") )
            {%>
                <center> <h1><u>Course Registration Reports</u></h1></center><br>
                <br><%
            }else if(regType.equals("exam"))    
            { %>
                <center> <h1><u>Exam Registration Reports</u></h1></center><br>
                <br><%
            }
%>
        <div>
        <label><h4><b>Filter by Student Roll No :</b></h4></label><br><br>
        <%  
            //changing links according to type of report
        if(regType.equals("course"))
            {%><form action="studentwiseCourseRegList.jsp" method="post"><%
            }else if(regType.equals("exam"))    
            {%><form action="studentwiseExamRegList.jsp" method="post"><%
            }
        %> 
        <input type="text" name="rollno" placeholder="Enter roll number"style="width: 250px;height: 30px" required>
        &nbsp &nbsp &nbsp  
       <button class="btn btn-primary" value="Student" name="generate">Generate</button>
            </form><hr class="line">
       <br></div>
        <div>
        <label><h4><b>Other Filters: </b></h4></label><br>
        <%
            //changing links according to type of report
            if(regType.equals("course"))
            { %> <form action="courseRegList.jsp" method="post" ><br><%
            }else if(regType.equals("exam"))    
            {%> <form action="examRegList.jsp" method="post" ><br><%}
        %>
        <label> Course:  </label>
        <select class="selectpicker" data-live-search="true" name="cname" value="" style="width: 400px;height: 30px">
              <option value="" selected disabled hidden>Select a course</option> 
             <%
                 List l=CourseCon.getAllCourses();
               for(Object obj1:l)
                {
                    Courses course=(Courses)obj1;  
               %>    
             <option value="<%=course.getCourse_code()%>"><%=course.getCourse_name()%><%out.print("("+course.getCourse_code()+")");%><%out.print("("+course.getCurriculum()+")");%></option>
             <%
                } 
                 %>
             </select>&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
       
                                <label> Branch:  </label>
                                <select name="branch" style="width: 200px;height: 30px">
                                    <option value="" selected disabled hidden>Select branch</option> 
                                    <option value="AE">AE</option>
                                    <option value="CE">CE</option>
                                    <option value="CM">CM</option>
                                    <option value="Ddgm">DDGM</option>
                                    <option value="EE">EE</option>
                                    <option value="E&TC">E&TC</option>
                                    <option value="IF">IF</option>
                                    <option value="IDD">IDD</option>
                                    <option value="ME">ME</option>
                                    <option value="PE">PE</option>
                                </select>&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<br><br>

                                <label> Year :    </label>
                                <select name="year" value="0" style="width: 200px;height: 30px">
                                    <option value="0" selected disabled hidden>Select Year</option> 
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

                                &nbsp;&nbsp;&nbsp;<label> Shift :  </label>
                                <select name="shift" value="0" style="width: 200px;height: 30px">
                                    <option value="0" selected disabled hidden>Select shift</option> 
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp

                                <br><br><button class="btn btn-primary" value="Course" name="generate" >Generate</button><br>
            <hr class="line">      
        </form>
        </div> </div>

    </body>
</html>