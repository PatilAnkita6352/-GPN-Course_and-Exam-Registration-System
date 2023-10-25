<%-- 
    Document   : coursewiseCourseRegList
    Created on : 20 Nov, 2020, 7:56:04 PM
    Author     : SHWETA
--%>

<%@page import="mainController.CourseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.Integer"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.CourseRegCon"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
        <script src="../../assets/jquery.min.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <style>
            table{
                text-align: left;
            }
            th{
                text-align: center;
            }
            @page{
                size:a4 portrait;
            }
            img{
               transition: none;          
            }
        </style>
        
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
</head>
<body>
      <%@include file="../headerforallPanelviews.jsp"%>
      <a href="afterRegRep.jsp" id="BackBtn"><button  value="Back" class="btn btn-lg btn-primary">Back</button></a>
    <%
        
        if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
        {
           response.sendRedirect("../../index.jsp");
        }
        else if(session.getAttribute("admin_user").equals("admin"))
        {
            try{
            String term=(String)session.getAttribute("term");
            String regyear=(String)session.getAttribute("regyear");
            String ry=term+"-"+regyear;
            
            String cc=request.getParameter("cname");
            Courses c=CourseCon.getCourseObject(cc);
            
            String programme=request.getParameter("branch");
            
            int year,shift;
            if(request.getParameter("year")==null){year=0;} 
            else{year=Integer.parseInt((String)request.getParameter("year"));}
            
            if(request.getParameter("shift")==null){shift=0;}
            else{shift =Integer.parseInt((String)request.getParameter("shift"));}
        %>
        <center>
             <h1><u>GOVERNMENT POLYTECHNIC NASHIK</u></h1>
             <p><i><font size="4">(An Autonomous Institute of Government of Maharashtra)</font></i></p>
             <h3><strong>Course Registration Details Of <%out.print(ry);%></strong></h3>
             <font size="3"><% out.print("__________________________________________________________________________________________________________________________________________________");%>
             <br><%  
                     if(programme!=null)
                    {%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%="Program :-"%></b><%=programme%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}
                    else if(cc!=null)
                    {%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%="Program :-"%></b><%=c.getProgramme()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}
                    if(year!=0)
                    {%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%="Year :-"%></b><%=year%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}
                    else if(cc!=null)
                    {%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%="Year :-"%></b><%=c.getYear()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}
                    if(shift!=0)
                    {%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><%="Shift :-"%></b><%=shift%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}
             %> 
        <% out.print("__________________________________________________________________________________________________________________________________________________");%>
        </font><br><br><br>
        </center> 
        
        <%
             //Retrieving course registration report according to filter set by user.
            List li=CourseRegCon.getCourseReportbyFilter(cc,ry,programme,year,shift);
           
           
            
            System.out.println(cc+" "+ry+" "+programme+" "+year+" "+shift);
            if(li.size()!=0)
            {
                int cnt=1;//Used for printing serial no.%>
              
                <div id="CourseWiseRegPrint"> 
                    <center>
                    <%if(cc!=null)
                    {
                       %><h2>Course Code:<%=cc%></h2>
                        <h2>Course Name:<%=c.getCourse_name()%></h2><br><% 
                    }
                    %>
                    <div class="container">
                        
                        <form method="POST">
                        <table class="table" border="1" id="my_id_table_to_export">
                            <thead>
                                <th class="align" >Sr.No</th>
                                <th class="align" >Roll No.</th>
                                <th class="align">Name</th>
                                <%if(cc==null){%>
                                <th class="align">Course Code</th>
                                <th class="align">Course Name</th><%}
                                if(programme==null){%>
                                <th class="align">Programme</th><%}
                                if(year==0){%>
                                <th class="align">Year</th><%}
                                if(shift==0){%>
                                <th class="align">Shift</th><%}%>
                            </thead>  
                            <%
                                for(Object stud_with_course:li)
                                {   
                                  CourseRegCon.CourseRegRep cr=(CourseRegCon.CourseRegRep)stud_with_course;
                                  /*converting stud_with_course object to CourseRegRep class's object ,to access belowed required info */    

                                    %>  
                                <tr>
                                    <td align="center"><%=cnt++%></td>
                                    <td align="center"><%=cr.getRegno() %></td>
                                    <td align="center"><%=cr.getStudName()%></td>
                                    <%if(cc==null){%>
                                    <td align="center"><%=cr.getCourse_code()%></td>
                                    <td align="center"><%=cr.getCourseName()%></td><%}
                                    if(programme==null){%>
                                    <td align="center"><%=cr.getProgram()%></td><%}
                                    if(year==0){%>
                                    <td align="center"><%=cr.getYear()%></td><%}
                                    if(shift==0){%>
                                    <td align="center"><%=cr.getShift()%></td><%}%>
                                </tr>
                                <%}//for close
                            %>
                        </table>
                        </form>
                            </div>
                    </div>        
                </center>
                <form method="post"><center>
        <button  class="btn btn-lg btn-primary" id="PrintBtn" data-toggle="collapse" onclick="printpage()">Print</button>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <button id="homeBtn" value="Home" formaction="adminPanel.jsp" class="btn btn-lg btn-primary">Home</button>
         &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <a href="#" onclick="download_table_as_csv('my_id_table_to_export');"><button type="button" class="btn btn-lg btn-primary" id="ExportBtn">Export</button> </a>
                    </center>
                </form>
        <%    
        }else 
            {
                response.sendRedirect("afterRegRep.jsp?failResult=Records not found");
            }
        %> <%
                    
       }catch(Exception e)
        {
            out.println("Exception occured : "+e);
        }
        }//if close used for session check%>
        
        <script type="text/javascript">
        function download_table_as_csv(table_id, separator = ',') 
        {
            // Select rows from table_id
            var rows = document.querySelectorAll('table#' + table_id + ' tr');
            // Construct csv
            var csv = [];
            for (var i = 0; i < rows.length; i++) {
                var row = [], cols = rows[i].querySelectorAll('td, th');
                for (var j = 0; j < cols.length; j++) {
                        var data = cols[j].innerText;
                    row.push('"' + data + '"');
                }
                csv.push(row.join(separator));
            }
            var csv_string = csv.join('\n');
            // Download it
            var filename = 'Course Registration Report' + '.csv';
            var link = document.createElement('a');
            link.style.display = 'none';
            link.setAttribute('target', '_blank');
            link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
            link.setAttribute('download', filename);
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
    }
    
        function printpage()
        {
            
            var btn1=document.getElementById('PrintBtn');
            btn1.style.visibility='hidden';
            var btn=document.getElementById('homeBtn');  
            btn.style.visibility='hidden';
            var btn2=document.getElementById('ExportBtn');  
            btn2.style.visibility='hidden';
            var btn3=document.getElementById('BackBtn'); 
            btn3.style.display='none';
            window.print();  
            btn1.style.visibility='visible';
            btn.style.visibility='visible';
            btn2.style.visibility='visible';
            btn3.style.display='inline-block';            
        }
    </script>
</body>
</html>


    </body>
</html>
