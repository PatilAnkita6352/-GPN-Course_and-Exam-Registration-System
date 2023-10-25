<%-- 
    Document   : registrarPanel
    Created on : Sep 20, 2018, 3:58:05 PM
    Author     : Shubham Nehe
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.AdminCon"%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Panel</title>
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css" type="text/css">
        <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
    </head>
    <body>
        <% session.setAttribute("profilepanel","registrarpanel");%>
        <%  
           
          if(session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null){
                response.sendRedirect("../../index.jsp");
          }else if(session.getAttribute("registrar_user").equals("registrar")){%>
           <jsp:include page="../headerforallPanelviews.jsp"/>
           <div class="container"><%
             boolean regStatus=HodCon.getRegStatusForRegistrar((String)session.getAttribute("registrar_uname"),(String)session.getAttribute("registrar_user"));
              if(!regStatus)
            {
                %><br><div class="container">
                       <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print("Sorry, but registration not started yet");%></p></div></div>
                </div>
          
          <%}
             try{
            if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %></div>
    <center><h1><u>Welcome to Registrar Panel</u></h1><hr>
        <br>
        
        <marquee style="background:gray;color: white"width="100%"><%try{if(!AdminCon.getNotice().equals(null)){out.print(AdminCon.getNotice());}}catch(Exception e){}%></marquee><br>
           <% 
               session.removeAttribute("reg_list_year");
                session.removeAttribute("reg_list_term");
                session.removeAttribute("reg_list_shift");
                session.removeAttribute("studroll");
               
               if(regStatus)
               {
                   
        %>
    
        <h2>Course Registration</h2><br><br> 
        <!--Drop-down for term and year -->
        <form action="studRegList.jsp" method="POST"> 
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
                                    <option value="ODD">ODD</option>
                                    <option value="EVEN">EVEN</option>
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
                                <label> Shift:  </label>
                        </div>
                            <div class="col-lg-2">
                                <select name="shift">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                    </div>
                <div class="col-lg-3"></div>
            </div>
            <br>
           
            <button name="submit" class=" btn btn-primary">Submit</button> 
        </form>
    </center>
        <%//
            }
            
        }%> 
    </body>
</html> 
