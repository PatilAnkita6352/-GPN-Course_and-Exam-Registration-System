<%-- 
    Document   : collageRegReport
    Created on : Sep 10, 2018, 11:41:28 AM
    Author     : User
--%>

<%@page import="mainController.AdminCon"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.util.Arrays"%>
<%@page import="beans.Course_reg"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>college Registration Report</title>
         <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
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
        <div class="container">
    <center><h1><u>College Registration Report</u></h1>
   <form method="post">
   <table border="2" class="table" align="center" id="my_id_table_to_export">
            <thead>
                <th>Sr.no</th> 
               <th>Program</th>
               <th>1 year</th>
               <th>2 year</th>
               <th>3 year</th>
           </thead>
           
      <%
         int total1=0,total2=0,total3=0;
         long count=0;
         int cnt=1;
             Session s;
             Query qr;
            SessionFactory sf;
            List list1=new ArrayList();
             List list2=new ArrayList();
            List list3=new ArrayList();
            
            sf=SessionFact.SessionFact.getSessionFact();
            s=sf.openSession();
            try{
            String branch[]={"CM","IF","ME","IDD","DDGM","PS","EL","EE","CE","AE"};
            String branchNames[]={"Computer Technology","Information Technology","Mechanical Engineering","Interior Design and Decoration","Dress designing ang Garment Manufacturing","Plastic Engineering","Electronics and Telecommunication","Electrical Engineering","Civil Engineering","Automobile Engineering"};
            int  result[][]=new int [3][3];
           String  fresult[][]=new String [3][3];
            
            for(int j=0;j<branch.length;j++)
            {
                for(int i=1;i<=3;i++)
                {
                    Query query = s.createQuery("SELECT regno FROM Course_reg WHERE program =:branch and year =:year and reg_term_year=:reg_term_year"+" GROUP BY regno");
                    query.setString("branch", branch[j]);
                    query.setString("reg_term_year", AdminCon.getReg_term_year());
                    query.setInteger("year",i);
                    //query.list() will give all roll no's that are registered for that department.
                    if(i==1)
                    {
                    list1=query.list();    //query.list() give the regno of 1_year.
                    total1=total1+list1.size();
                    }
                    else if(i==2)
                    {
                        list2=query.list();    //query.list() give the regno of 2_year.
                        total2=total2+list2.size();
                    }
                    else
                    {
                        list3=query.list();    //query.list() give the regno of 3_year.
                        total3=total3+list3.size();
                    }
                    
                }
                    %> 
                    <tr>
                        <td> <%=cnt++%></td>
                        <td><%= branchNames[j] %></td>            
                <td align="left" ><% out.println(list1.size());%></td> 
                 <td align="left" ><% out.println(list2.size());%></td> 
                    <td align="left" ><% out.println(list3.size());%></td> 
                 
                    </tr>
                    <%
                
            }
            }catch(ArrayIndexOutOfBoundsException ae)
            {
                System.out.println(ae);
            }
%>          
                <tr>
                    <th colspan="2">Total</th>
                    <td align="left"><%=total1%></td>
                    <td align="left"><%=total2%></td>
                    <td align="left"><%=total3%></td>
                </tr>
   </table> </form>
        <a href="#" onclick="download_table_as_csv('my_id_table_to_export');"><button type="button" class="btn btn-lg btn-primary">Export</button> </a>
    </center>
        </div>
            <%}%>
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
                    if(cols[j].innerText==='Total') 
                    row.push('"' +""+ '"');
                }
                csv.push(row.join(separator));
            }
            var csv_string = csv.join('\n');
            // Download it
            var filename = 'College Registration Report'+ '.csv';
            var link = document.createElement('a');
            link.style.display = 'none';
            link.setAttribute('target', '_blank');
            link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
            link.setAttribute('download', filename);
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
    }
    </script>
    </body>
</html>
   


