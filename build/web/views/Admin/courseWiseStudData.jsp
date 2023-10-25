
<%--
    Document   : subjectWise StudData
    Created on : 18 Nov, 2020, 5:02:21 PM
    Author     : Utkarshaa Godse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Details</title>
    </head>
    <body>
        <%
            String name=((String)session.getAttribute("admin_uname"));
            if(name.equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           { %>
           <%@include file="../headerforallPanelviews.jsp"%>
           <br><div class="container"><%
             String result=request.getParameter("result");
            try{
            if(!result.equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(result);%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
               
        %></div>
    <center> <h1><u>Subject Details</u></h1><br>
    <form action="courseWise.jsp" method="post">
        <div class="row">
        <label>Enter Course Code:</label> <input type="text" name="course_code" placeholder="Eg. CM1234" required oninvalid="this.setCustomValidity('Subject Name is required.')"
                              oninput="this.setCustomValidity('')">
        </div><br>
        <div class="row">
        <label>Enter Registration Term Year:</label> <input type="text" name="reg_term_year" placeholder="Eg. EVEN-19 " required oninvalid="this.setCustomValidity('Registration Term Year is required.')"
                              oninput="this.setCustomValidity('')">
        </div><br>
       
        <div class="row" style="text-align: left;">
                <div class="col-lg-5"></div>
                    <div class="col-lg-4">
                        <div class="col-lg-2">
                                <label> Branch:  </label>
                        </div>
                            <div class="col-lg-2">
                                <select name="branch">
                                    <option value="CE">CE</option>
                                    <option value="CM">CM</option>
                                    <option value="Ddgm">DDGM</option>
                                    <option value="EE">EE</option>
                                    <option value="E&TC">E&TC</option>
                                    <option value="IF">IF</option>
                                    <option value="IDD">IDD</option>
                                    <option value="ME">ME</option>
                                    <option value="PE">PE</option>
                                    <option value="AE">AE</option>
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
                                <label> Year:  </label>
                        </div>
                        <div class="col-lg-2">
                                <select name="year">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>
                        </div>
                        <div class="col-lg-2">
                                <label> Shift:  </label>
                        </div>
                        <div class="col-lg-2">
                                <select name="shift">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                        </div>
                    </div>
               
            <br>
           
       
        <br>
            <button class="btn btn-primary">Submit</button>
        </form>
        </center>
    <%}%>
    </body>
</html>
