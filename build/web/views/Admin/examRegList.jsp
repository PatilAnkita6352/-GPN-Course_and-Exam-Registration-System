<%-- 
    Document   : coursewiseExamRegList
    Created on : 21 Nov, 2020, 10:44:19 AM
    Author     : SHWETA
--%>

<%@page import="mainController.CourseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.Integer"%>
<%@page import="beans.Exam_reg"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.ExamRegCon"%>
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
        <title>Coursewise Exam Registration Report</title>
    </head>
    <body>        <%@include file="../headerforallPanelviews.jsp" %>
         <a href="afterRegRep.jsp" id="BackBtn"><button  value="Back" class="btn btn-lg btn-primary">Back</button></a>

       <%//checking if user is admin and giving the access
        if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
        {
           response.sendRedirect("../../index.jsp");
        }
        else if(session.getAttribute("admin_user").equals("admin"))
       {
            //taking all the parameters from the previous form
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
             <h3><strong>Exam Registration Details Of <%out.print(ry);%></strong></h3>
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
        //Retrieving exam registration report according to filter set by user.
            List li= ExamRegCon.getExamReportbyFilter(cc,ry,programme,year,shift);
            
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
                                <th class="align" style="width:10%">Sr.No</th>
                                <th class="align" style="width:13%">Roll No.</th>
                                <th>Name</th>
                                <th class="align" style="width:10%">Theory</th>
                                <th class="align" style="width:10%">PeriodicTest</th>
                                <th class="align" style="width:10%">TermWork</th>
                                <th class="align" style="width:10%">Practical</th>
                                <th class="align" style="width:10%">Oral</th>
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
                                    for(Object course:li)
                                    {
                                        //Retrieving student info using rollno for printing.
                                      ExamRegCon.ExamRegRep er=(ExamRegCon.ExamRegRep)course;
        //                      
                                %>
                                <tr>
                                    <td align="center"><%=cnt++%></td>
                                    <td align="center"><%=er.getRegno()%></td>
                                    <td><%=er.getStudName()%></td>
                                    
                                    <%if(er.getEx_th()==1){%>
                                    <td align="center"><img src="../../Images/green-tick1.png" height="15" width="15"></td><%}
                                    else if(er.getEx_th()==0){%> 
                                    <td align="center"><img src="../../Images/red-cross1.png" height="15" width="15"></td><%}
                                    else{%>
                                    <td align="center"><font size="5">---</font></td><%}
                                    if(er.getEx_pt()==1){%>
                                    <td align="center"><img src="../../Images/green-tick1.png" height="15" width="15"></td><%}
                                    else if(er.getEx_pt()==0){%>
                                    <td align="center"><img src="../../Images/red-cross1.png" height="15" width="15"></td><%}
                                    else{%>
                                    <td align="center"><font size="5">---</font></td><%}
                                    if(er.getEx_tw()==1){%>
                                    <td align="center"><img src="../../Images/green-tick1.png" height="15" width="15"></td><%}
                                    else if(er.getEx_tw()==0){%>
                                    <td align="center"><img src="../../Images/red-cross1.png" height="15" width="15"></td><%}
                                    else{%>
                                    <td align="center"><font size="5">---</font></td><%}      
                                    if(er.getEx_pr()==1){%>
                                    <td align="center"><img src="../../Images/green-tick1.png" height="15" width="15"></td><%}
                                    else if(er.getEx_pr()==0){%>
                                    <td align="center"><img src="../../Images/red-cross1.png" height="15" width="15"></td><%}
                                    else{%>
                                    <td align="center"><font size="5">---</font></td><%}
                                    if(er.getEx_or()==1){%>
                                    <td align="center"><img src="../../Images/green-tick1.png" height="15" width="15"></td><%}
                                    else if(er.getEx_or()==0){%>
                                    <td align="center"><img src="../../Images/red-cross1.png" height="15" width="15"></td><%}
                                    else{%>
                                    <td align="center"><font size="5">---</font></td><%} %>
                                    <%if(cc==null){%>
                                    <td align="center"><%=er.getCourse_code()%></td>
                                    <td align="center"><%=er.getCourseName()%></td><%}
                                    if(programme==null){%>
                                    <td align="center"><%=er.getProg()%></td><%}
                                    if(year==0){%>
                                    <td align="center"><%=er.getEx_reg_year()%></td><%}
                                    if(shift==0){%>
                                    <td align="center"><%=er.getShift()%></td><%}%>
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
                    if(cols[j].innerHTML==='<img src="../../Images/green-tick1.png" height="15" width="15">')
                        var data=1;
                    else if(cols[j].innerHTML==='<img src="../../Images/red-cross1.png" height="15" width="15">')
                        var data=0;
                    else if(cols[j].innerText==='---')
                        var data='-';
                    else
                        var data = cols[j].innerText;
                    row.push('"' + data + '"');
                }
                csv.push(row.join(separator));
            }
            var csv_string = csv.join('\n');
            // Download it
            var filename = 'Exam Registration Report'+ '.csv';
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


   