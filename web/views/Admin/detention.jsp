

<%@page import="beans.Admin_data"%>
<%@page import="beans.Exam_reg"%>
<%@page import="mainController.ExamRegCon"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Student_data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mainController.HodCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%@page import="mainController.CourseCon"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Detention</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
     <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     <link rel="stylesheet" href="../../assets/css/bootstrap-select.min.css">
        <script src="../../assets/js/bootstrap-select.min.js"></script>
       
    </head>
    <body>
        <%  //checking if user is admin
            String name=((String)session.getAttribute("admin_uname"));
            if(name.equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           { 
        %>
        
        <!--Used for displaying flash data.-->
        <%@include file="../headerforallPanelviews.jsp"%>
        <% Admin_data ad=AdminCon.getAdminInfo();%>
         <center><h1>Student Detention of <%out.print(ad.getReg_term_year());%></h1><br><br>
        
             <h4>(Note : If a selected student hasn't registered for exam then he/she won't be detained)</h4></center><br><br>
      
        <br><div class="container"><%
            
             String result=request.getParameter("result");
            try{
            if(result!=null){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(result);%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(request.getParameter("failResult")!=null){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}     
        %></div>
         <h3>Enter Programme and Year of Students</h3><br>
         <form action="detention.jsp">
             <b>Programme&nbsp;:</b>&nbsp;&nbsp;<select name="branch" style="width: 200px;height: 30px" required>
                                    <option  selected disabled hidden>Select branch</option> 
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
              </select>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <b>Year&nbsp;:</b>&nbsp;&nbsp;<select name="year" style="width: 200px;height: 30px"required>
                                    <option  selected disabled hidden>Select Year</option> 
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
              </select>
            
             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <button class="btn btn-primary" style="width:100px;height: 40px" type="submit"><font size="3">Submit</font></button>
         </form><br><br>
       
        
    <%      
        
       try{
           if(!request.getParameter("branch").equals(null) && !request.getParameter("year").equals(null))
           {
            //Retrieving Courses of specific programme
            List li1=HodCon.getCoursesByProgramme(request.getParameter("branch"));
            //Retrieving student rollno of specific programme and year
            List<String>li2=(List<String>)AdminCon.getStudByProgAndYr(request.getParameter("branch"),request.getParameter("year"));
            int j=0;%>
            <form action="../../Controller/detainStudents.jsp?branch=<%=request.getParameter("branch")%>" method="post">
                <table border="1" class="table">
                        <thead>
                        <th>Sr.no</th>
                        <th >Course Code</th>
                        <th>Course Name</th>
                        <th>Previously Detained<br> Roll Nos</th>
                        <th>Roll Numbers</th>
                        <th>Added Roll Nos  </th>
                      
                        </thead>
                        <tbody>
                          
            <%
               //Retrieving detained records of exam registration
                List li3=ExamRegCon.getDetainedStudwithCourseCode(request.getParameter("branch"),Integer.parseInt(request.getParameter("year")));
               
                for(Object c:li1)
            {
                Courses course=(Courses)c;
                %>
                    <tr>
                        <td><%= ++j %></td>
                        <td><%= course.getCourse_code()%></td>
                        <td><%= course.getCourse_name()%></td>
                         <td>
                        <% List<String> li4=new ArrayList<String>();
                        //logic to show already detained students in 'Previously Detained RollNos' column
                            for(Object ee:li3)
                            { Exam_reg e=(Exam_reg)ee;
                            
                            if(e.getCourse_code().equals(course.getCourse_code()))
                            {
                              li4.add(e.getRegno());
                            }
                            }
                            out.print(li4.toString().replace("[","").replace("]","").replace(",","&nbsp;&nbsp;"));
                      %>
                        </td>
                        <td><!--Displaying all Rollnos in li2 to dropdownlist--> 
                            <select multiple class="selectpicker" data-live-search="true" name="<%= course.getCourse_code()%>" id="<%= course.getCourse_code()%>">
                             <% for(String r:li2)
                             { %>
                                <option value="<%=r%>"><%=r%></option>
                             <% }%>  
                            </select> &nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button"class="btn btn-primary" onclick="addStudents('<%=course.getCourse_code()%>')"><font size="2">ADD</button>
                        </td>
                        <td id="<%= course.getCourse_code()%>roll"> </td>
                    </tr>
                <%
            }%></tbody>
    </table>
    <center>   <button class="btn btn-primary" style="width:80px;height:50px;"><font size="3">Submit</button>  </center><br><br>
          
            </form>         
            <%
               
            }
       }catch(Exception e){
    }
   }
    
    
    %>
    <script>
        <!--function to display the selected rollnos in 'Added Rollno' column after clicking add button-->
    function addStudents(coursecode) {     
 
        var regnos=document.getElementById(coursecode);
         var rolls="";
         for ( var i = 0; i < regnos.selectedOptions.length; i++) {
                rolls=rolls+regnos.selectedOptions[i].value+"&nbsp;&nbsp";
            } 
             document.getElementById(coursecode+"roll").innerHTML="&nbsp;&nbsp;"+ rolls;
       
    }
 

</script>

    </body>
</html>