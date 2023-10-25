<%--
    Document   : selectCourses
    Created on : Sep 1, 2018, 12:48:54 AM
    Author     : sarvadnya
--%>
<%@page import="beans.Courses"%>
<%@page import="java.util.List"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="beans.Hod_data"%>
<%@page import="mainController.HodCon"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Offer Courses</title>
        <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
               
            }
        </style>
    </head>
    <body>
       
        <%
            String hod_uname=((String)session.getAttribute("hod_uname"));
           if(hod_uname.equals(null))
            {
              response.sendRedirect("../../index.jsp");
            }
           else{
             %> <jsp:include page="../headerforallPanelviews.jsp"/> <%
           
                 Hod_data hd=HodCon.getHODInfo(hod_uname);
                 if(hd.getIs_reg_started().equals("y"))
                 {
                %>
               
                <br><div class="container"><%
             String result=request.getParameter("result");
            try{
            if(!result.equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><%out.print(result);%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("wrongResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger">   <a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("wrongResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
               
        %></div>
               
           
           <center>
        <form action="../../Controller/selectCourses.jsp" method="post">
            <h2>Offer Courses For Registration</h2><hr>
            <br>
            <h4>(Please consider to offer previous year's or term's courses for backlog students' Registration)</h4><br><br>
            <div class="row">
                <div class="col-lg-5"></div>
                    <div class="col-lg-4">
                        <div class="col-lg-2">
                                <label> Year:  </label>
                        </div>
                            <div class="col-lg-2">
                                <select name="year">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>
                            </div>
                    </div>
                <div class="col-lg-3"></div>
            </div>
            <br>
           
            <div class="row">
                <div class="col-lg-5"></div>
                    <div class="col-lg-4">
                        <div class="col-lg-2">
                                <label> Term:  </label>
                        </div>
                            <div class="col-lg-2">
                                <select name="term">
                                      <option>ODD</option>
                                       <option>EVEN</option>
                                </select>
                            </div>
                    </div>
                <div class="col-lg-3"></div>
            </div>
            <br><br>
            <button class="btn btn-primary">Submit</button>
        </form>
         
        <%
            //out.println(""+hd.getProgramme());
            //for fetching already offered courses by hod
            try{
                    int j=0;
                    List li=HodCon.getOfferedCouses(hd.getProgramme());
                    //out.println(li);
                    if(li.size()!=0)
                    {
                        %>
                        <br><br><br><br>
                        <div class="container">
                            <h3>Already offered Courses</h3><br>
                        <table border="1" class="table">
                        <thead>
                        <th>Sr.no</th>
                        <th >Course Code</th>
                        <th>Course Name</th>
                        <th>year</th>
                        <th>term</th>
                        <th>Curriculum</th>
                        </thead>
                        <tbody>
                               <%for(Object obj:li)
                                {
                                    Courses cr=(Courses)obj;
                                   %>
                                    <tr>
                                        <td><%= ++j %></td>
                                        <td><%= cr.getCourse_code()%></td>
                                        <td><%= cr.getCourse_name()%></td>
                                        <td><%= cr.getYear()%></td>
                                        <td><%= cr.getTerm()%></td>
                                        <td><%= cr.getCurriculum() %></td>
                                    </tr>
                                   <%
                                }    
                      }
                       
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
                        </tbody></table></div>    
    </center>
         <%@include file="../../footer.jsp" %>
         <% }
            else
            response.sendRedirect("hodPanel.jsp?flag1=Start registration before offering courses");
}
       %>
    </body>
</html>
