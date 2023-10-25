/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainController;

import SessionFact.SessionFact;
import beans.Admin_data;
import beans.Course_reg;
import beans.Courses;
import beans.Exam_reg;
import beans.Student_data;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author sarvadnya
 */
public class AdminCon {
    private static Session session;
    private static SessionFactory sf;
    
    public static Boolean login(String uname,String pword) 
    {
            sf=SessionFact.getSessionFact();              
            session=sf.openSession();
            pword=md5(pword);
            List li=session.createQuery("from Admin_data where username=:uname and password=:pword").setString("uname",uname).setString("pword", pword).list(); 
            System.out.println("login check hod performed");
            session.close();
            //sf.close(); 
            if(li.size()!=0)
            return true;
            else
            return false;
    }
    
    //return admin info
    public static Admin_data getAdminInfo() 
    {
            sf=SessionFact.getSessionFact();                            //sessionFactory creation
            session=sf.openSession();
            Query qr=session.createQuery("from Admin_data"); 
            List list=qr.list();
            Admin_data ad=(Admin_data)list.get(0);
            session.close();
            //sf.close(); 
            return ad;
    }
     //function to change admin password
    public static void changeAdminPwd(String pass)
    {
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        List li=session.createQuery("from Admin_data").list();
        Admin_data ad=(Admin_data)li.get(0);
        session.beginTransaction();
        ad.setPassword(pass);  
        session.merge(ad);
        session.getTransaction().commit();
        session.close();
        //sf.close();
        
    }       
    public static int register(Admin_data ad)
    {
        int i=0;
        //Session session=new Configuration().configure().buildSessionFactory().openSession();
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        session.beginTransaction();
        i=(Integer)session.save(ad);
        session.getTransaction().commit();
        session.close();
        return i;
    } 
    
    //checkAddCourse() method checks for addition of any new course by hod.
    public static List checkNewCourse() 
    {
        Boolean bool=false;
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        Query qr=session.createQuery("from Courses");
        List list=qr.list(); 
        List newCourses=new ArrayList(); 
        for(Object li:list)
        {
            Courses course=(Courses)li;
            if(course.getIs_validated().equals("n"))
            {
                newCourses.add(course);
            }
        }
        return newCourses;
    }
    
    public static Boolean addNewCourse(Courses course) 
    {
        Boolean bool=false;
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        session.beginTransaction();
        System.out.print("--------------------------------------------------------------------"+course.getId()); 
        course.setIs_validated("y"); 
        session.merge(course);  
        session.getTransaction().commit();
        return true;  //needs to check whether it is addedin table or not
    } 
    /*
    public static Admin_data getName() {
        sf=SessionFact.SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
        ad=(Admin_data) session.get(Admin_data.class,1);
        return ad;
    }*/
    
    public static Boolean changeStudPwd(String rollno,String newPwd)
    {
            Boolean bool=false; 
            sf=SessionFact.getSessionFact();
            session=sf.openSession(); 
            session.beginTransaction();
            List li=session.createQuery("from Student_data where rollno=:rollno").setString("rollno",rollno).list();
            if(li.size()!=0)
            {
                Student_data sd=(Student_data)li.get(0);
                sd.setPassword(newPwd);
                session.merge(sd);
                System.out.println("Password updation done successfully in stu account");
                session.getTransaction().commit();
                bool=true;
            }
            session.close();
            //sf.close();
            return bool;
    }
    //this method retrieves details of a student 
    public static List studentDetails(String roll_no)
    { 
            SessionFactory sf=SessionFact.getSessionFact();
            session=sf.openSession(); 
            List li=session.createQuery("from Student_data where rollno=:rollno").setString("rollno",roll_no).list();
            session.close();
            //sf.close();
            if(!li.isEmpty())
                return li; 
            else
                return null;
    }
    
    //this method retrieves Students from given programme and year
    public static List getStudByProgAndYr(String programme,String year)
    { 
            SessionFactory sf=SessionFact.getSessionFact();
            session=sf.openSession(); 
            List li=session.createQuery("Select rollno from Student_data where programme=:programme and year=:year").setString("programme",programme).setString("year",year).list();
            session.close();
            //sf.close();
            
                return li; 
           
    }
    
    //This method starts or stops Course registraion by offering courses of given year and term
    public static Admin_data startStopReg(String uname,String flag,String term,String year)
    {
    
        Boolean bool=false;
        String regTermYear=term+"-"+year;
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
         List li=session.createQuery("from Admin_data where username=:uname").setString("uname", uname).list();
         Admin_data ad=(Admin_data)li.get(0);
        session.beginTransaction();
        
        if(flag.equals("start"))
        {
            ad.setIs_reg_started("y");
            ad.setReg_term_year(regTermYear); 
        }
        else
        {
            ad.setIs_reg_started("n");  
            Query q=session.createQuery("update Courses set is_offered=:n where is_offered=:y").setString("n","n").setString("y","y");
            q.executeUpdate();
            q=session.createQuery("update Hod_data set is_reg_started=:n where is_reg_started=:y").setString("n","n").setString("y","y");
            q.executeUpdate();
        }
        ad=(Admin_data)session.merge(ad);  
        session.getTransaction().commit();
        session.close();
        //sf.close();
       return ad;
  } 
    
    //method tp save examination dates
    public static void saveExaminationDates(String uname,String firstPTDate,String secondPTDate,String or_pr_tw,String finalExDate,String endOfTerm,String exRegDate)
    {
    
        Boolean bool=false;
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
         List li=session.createQuery("from Admin_data where username=:uname").setString("uname", uname).list();
         Admin_data ad=(Admin_data)li.get(0);
         ad.setFirst_PT_date(firstPTDate);
         ad.setSecond_PT_date(secondPTDate);
         ad.setOr_pr_tw_exam_date(or_pr_tw);
         ad.setFinal_exam_date(finalExDate);
         ad.setEnd_of_term(endOfTerm); 
         ad.setExamination_reg_date(exRegDate); 
        session.beginTransaction();
        session.merge(ad);  
        session.getTransaction().commit();
        session.close();
        //sf.close();
  } 
    
    //This method Checks whether Admin has started the Course Registration or not 
    public static boolean getRegStatus()
    {  
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
         List li=session.createQuery("from Admin_data").list();
         Admin_data ad=(Admin_data)li.get(0);
        session.close();
        //sf.close();
        if(ad.getIs_reg_started().equals("y"))
            return true;
        else
           return false; 
  } 
    
    //Get all regno by programme, year, shift and term.
    public static List getRegNoByProgrammePT(String programme,int shift,int year,String reg_term_year)
    {
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        List li=session.createQuery("select regno from Course_reg where program=:programme and shift=:shift and year=:year and reg_term_year=:reg_term_year and reg_can='n' group by regno").setString("programme", programme).setInteger("shift", shift).setString("reg_term_year", reg_term_year).setInteger("year", year).list();
        session.close();
        //sf.close();
        return li;
    }
    //Get all regno by programme, year, shift and term.
    public static List getRegNoByProgrammeFinal(String programme,int shift,int year,String reg_term_year)
    {
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        List li=session.createQuery("select regno from Exam_reg where prog=:programme and shift=:shift and ex_reg_year=:year and ex_reg_date=:reg_term_year and ex_cancel=0 group by regno").setString("programme", programme).setInteger("shift", shift).setString("reg_term_year", reg_term_year).setInteger("year", year).list();
        session.close();
        //sf.close();
        return li;
    }
    
   
    public static String getReg_term_year()
    {
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        List li=session.createQuery("select reg_term_year from Admin_data").list();
        session.close();
        //sf.close();
        System.out.print("_______________"+li.get(0).toString());
        return li.get(0).toString();
    }
    
    //function to update notice
    public static void updateNotice(String notice)
    {
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        List li=session.createQuery("from Admin_data").list();
        Admin_data ad=(Admin_data)li.get(0);
        ad.setNotice(notice);
        session.beginTransaction();  
        session.merge(ad);
        session.getTransaction().commit();
        session.close();
        //sf.close();        
    }
    //function to delete notice
    public static void deleteNotice()
    {
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        List li=session.createQuery("from Admin_data").list();
        Admin_data ad=(Admin_data)li.get(0);
        session.beginTransaction();
        ad.setNotice(null); 
        session.merge(ad);
        session.getTransaction().commit();
        session.close();
        //sf.close();
        
    }
    //method to get notice
    public static String getNotice()
    {
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        List li=session.createQuery("from Admin_data").list();
        Admin_data ad=(Admin_data)li.get(0);
        String notice=ad.getNotice();
        System.out.println("----------------------********* "+notice);
        session.close();
        //sf.close();
        return notice;
    }
    
    //generateIndividualPTHallTicket() used for generating individual student's pt hall ticket.
    public static List generateIndividualPTHallTicket(String regno,String programme,int year,String term,String reg_term_year,String isRegular) 
    { 
        //PT HallTicket courses will be retrieved only if passed year equals student study year.
        Student_data stud=(Student_data)StudCon.getStudentInfo(regno);
        if(year==stud.getYear()) 
        {
            List li,li1=new ArrayList();
            Query qr;
            sf=SessionFact.getSessionFact(); 
            session=sf.openSession(); 
            session.beginTransaction();
            System.out.print("*********************regno="+regno+"pro_______"+programme+"__year"+year);

            //To change pass from n to y of first year exemption corses of DSY student.
            try{
                if(year==2 && isRegular.equals("d")) 
                {
                    qr = session.createQuery("FROM Course_reg WHERE regno =:regno and program =:programme and year =1 and reg_term=:term and reg_exmt='y' and reg_can='n' and reg_term_year=:reg_term_year");
                    qr.setString("regno",regno);
                    qr.setString("programme",programme);
                    qr.setString("term", term);
                    qr.setString("reg_term_year", reg_term_year);
                    li=qr.list();
                    for(Object obj:li)
                    {
                        Course_reg creg=(Course_reg)obj;
                        creg.setPass("y");
                        session.merge(creg);
                        System.out.print("***************in for to change pass from n to y.******");
                        //Adding the exemption course code into list li1.
                        li1.add(creg.getCourse_code()  );
                    } 
                    session.getTransaction().commit();
                }
            }catch(Exception e){}

            //Getting course codes of courses registered by student.
            qr = session.createQuery("SELECT course_code FROM Course_reg WHERE regno =:regno and program =:programme and year =:year and reg_term=:term and reg_exmt='n' and reg_can='n' and pass='n' ");
            qr.setString("regno",regno);
            qr.setString("programme",programme);
            qr.setInteger("year", year);
            qr.setString("term", term);
           
            
            //query.list() will give all reglar course's course_code that are registered by this roll number.
            li=qr.list();
            li1.addAll(li); 
            //Now li1 has 1st year course codes of running term(if student is dsy)+course codes of courses registered by student.
            System.out.print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Size = "+li1.size());
            session.close();
            //sf.close();
            return li1;  
        }else
        {
            session.close();
            //sf.close();
            return null;
        }
        
    }
    
   
    
    //generateIndividualFinalHallTicket() used for generating individual student's finalhall ticket. 
    public static List generateIndividualFinalHallTicket(String regno,String programme,int year,String term)
    {
        System.out.println("***********************generateIndividualFinalHallTicket********************************");
        sf=SessionFact.getSessionFact(); 
        System.out.print("*********************regno="+regno+"pro_______"+programme+"__year"+year);
        session=sf.openSession();    
        Query qr = session.createQuery("FROM Exam_reg WHERE regno =:regno and prog =:programme and ex_cancel=0 and ex_reg_year =:year and ex_reg_term=:term");
        qr.setString("regno",regno);
        qr.setString("programme",programme);
        qr.setInteger("year", year);
        qr.setString("term", term);
        //query.list() will give all course code that are registered of that roll number.
        List li=qr.list();
        System.out.print("*********************Size **********************"+li.size());

        return li;             
    }
    //This method saves the no. of maximum courses that can be registered by student.
    public static boolean saveMaxRegCourses(int noOfMaxCourses,String uname)
    {
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        List li=session.createQuery("from Admin_data where username=:uname").setString("uname", uname).list();
        Admin_data admin=(Admin_data)li.get(0);
        admin.setMax_reg_courses(noOfMaxCourses);
        session.beginTransaction();
        Admin_data ad=(Admin_data)session.merge(admin);
        session.getTransaction().commit();
        if(ad.getMax_reg_courses()==noOfMaxCourses)
            return true;
        else
            return false;
    } 
    
    //This method saves the latest curriculum year in admin table.
    public static boolean setCurriculumYr(int curriculumyr ,String uname)
    {
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        List li=session.createQuery("from Admin_data where username=:uname").setString("uname", uname).list();
        Admin_data admin=(Admin_data)li.get(0);
        admin.setCurriculum(curriculumyr);
        session.beginTransaction();
        Admin_data ad=(Admin_data)session.merge(admin);
        session.getTransaction().commit();
        if(ad.getCurriculum()==curriculumyr)
            return true;
        else
            return false;
    } 
    
    
    //getMaxRegCourses() returns the count of maximum no. of courses allowed for registration. 
    public static int getMaxRegCourses() 
    {
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        List li=session.createQuery("from Admin_data").list(); 
        Admin_data admin=(Admin_data)li.get(0);
        return admin.getMax_reg_courses();
    }
    
      //autoUpdateYear() upadates the stdy tear of student in stdent_data table
    //It updates as follows : 1st year->2nd year and 2nd year->3rd year and 3rd year-> -1 year if passed all subjects

    public static boolean autoUpdateYear()
    {
        Admin_data ad=getAdminInfo();
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
       
            Query q=session.createQuery("SELECT CASE WHEN count(course_code)>0 THEN regno ELSE '' END FROM Course_reg WHERE fail=:y and re_register=NULL group by regno").setString("y","y");
        
        List failStuds3yr=q.list();
    
        System.out.println(failStuds3yr);
        q=session.createQuery("update Student_data set year=-1 where rollno NOT in (:failStuds3yr) and year=3").setParameterList("failStuds3yr", failStuds3yr);
        int res1=q.executeUpdate();
        
        q=session.createQuery("SELECT CASE WHEN count(course_code)>"+ad.getMax_reg_courses()+" THEN regno ELSE '' END FROM Course_reg WHERE fail=:y and re_register=NULL group by regno").setString("y","y"); 
        List failStuds=q.list();
         System.out.println(failStuds);
        q=session.createQuery("update Student_data set year=year+1 where rollno NOT in (:failStuds) and year in(1,2)").setParameterList("failStuds",failStuds);
        int res2=q.executeUpdate();
        
        session.getTransaction().commit();
        session.close();
        //sf.close();
        System.out.print("____res1="+res1+"____res2="+res2);
        if(res1!=0 || res2!=0)
            return true;
        else
            return false;      
    }


    
    
    //for retriving all the first year exempted coures
    public static List getFirstYearExemptedCourses(String uname,String programme,String Term)
    {
        List li=null;
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        li=session.createQuery("From Courses where programme=:programme and term=:term and year=1 and is_exempted='y'").setString("programme",programme).setString("term", Term).list();
        if(li.size()>0)
        {
            session.close();
            //sf.close();
            return li;   
        }
        else
        {
        session.close();
        //sf.close();
        return null;
        }
    }
    
    //regExamDsyfirstYearCourses() is used to do exam registration of 1st year courses of dsy student. 
    public static boolean regFirstYearExemptedCourses(String uname,String courseCode[]) 
    {
        Student_data stud;
        Query qr=null;
        String couCode;
        List li=new ArrayList();
        Course_reg creg=new Course_reg();
        String reg_date=AdminCon.getReg_term_year();
        stud=(Student_data)StudCon.getStudentInfo(uname);
        
        sf=SessionFact.getSessionFact();
        
        Exam_reg er=new Exam_reg(),er2;
        Course_reg cr;
        int res[]=new int[courseCode.length];
        boolean bool=true;
        try
        {
            int i=0;
            //For each exempted course code
            for(i=0;i<courseCode.length;i++) 
            { 
                session=sf.openSession();
                System.out.println("_____________JJJJJJJJJJJJJJJJJJJJJJJJ="+courseCode[i]+"___________"+uname);
                session.beginTransaction();
                try{
                li=session.createQuery("FROM Course_reg WHERE course_code=:courseCode and regno=:regno").setString("regno", uname).setString("courseCode",courseCode[i]).list();
                
                System.out.println("_________________________Size of li ="+li.size());
                }catch(Exception e){System.out.println("$$$$$$$$$$$$$$$$$$$$$$$Exception in query$$$$$$$$$$$$$$$$$$$$$$$$$$$44="+e);}
                for(Object obj:li)
                {
                    cr=(Course_reg)obj;
                    System.out.println("_____________cou_code"+cr.getCourse_code());
                    try
                    { 
                        //Course Reg
                        cr.setReg_exmt("y");
                        cr.setReg_can("n");
                        cr.setPass("y");
                        cr=(Course_reg)session.merge(cr);
                        session.getTransaction().commit();
                        
                        //for checking set pass field is "y".
                        if(cr.getPass().equals("y"))
                        {
                            //Getting Exam_Reg object if student has done exam registrtion of the exempted course.
                            try{
                                li=session.createQuery("FROM Exam_reg WHERE course_code=:courseCode and regno=:regno").setString("regno", uname).setString("courseCode", courseCode[i]).list();
                                System.out.println("_________________________Size of li ="+li.size());
                                session.close();
                            }catch(Exception e){System.out.println("$$$_____Exception in query for exam registration$$$$$$44="+e);}
                            if(li.size()==0)
                            {
                                er.setEx_exmt(1);
                                er.setCourse_code(cr.getCourse_code());
                               
                                er.setRegno(uname);
                                er.setProg(stud.getProgramme()); 
                                er.setEx_reg_date(reg_date);
                                er.setEx_reg_term(stud.getTerm());
                                er.setEx_reg_year(1);
                                er.setEx_th(1);
                                er.setEx_pt(1);
                                er.setEx_pr(1);
                                er.setEx_tw(1);
                                er.setEx_or(1);
                                er.setEx_pass(1);
                                //det,bac,pass,Ex
                                er.setEx_cancel(0);
                                //calling method for storing courses of a student for exam registration.
                                res[i]=ExamRegCon.exRegister(er); 
                            }
                            else
                            {
                                session=sf.openSession();
                                er=(Exam_reg)li.get(0);
                                er.setEx_exmt(1);
                                er.setEx_pass(1);
                                er.setEx_cancel(0);
                                session.beginTransaction();
                                //res[i]=;
                                er2=(Exam_reg)session.merge(er);
                                if(er2.getId()==er.getId())
                                    res[i]=1;
                                else
                                    res[i]=0;
                                System.out.println("AAAAAAAAAAAAAAAA________Result____________AAAAAAAAObject = "+res[i]);
                                session.getTransaction().commit();
                                session.close();
                            }
                        }
                    }
                    catch(Exception e){System.out.print("##############################"+e); }
                }
            }
        } 
        catch(Exception e)
        {
            System.out.println("______________________________________________________Failed"+e);
        }
        for(int r:res)
        {
            System.out.println("______)))))))))))))))))))))))"+r);
            if(!(r>0))
            {
                bool=false;
                System.out.println("______Value found false");
                break;
            }
        }   
        return bool;
    
  }//method regExamDsyFirstYearCourses() closed
    
    
    //regExamDsy1stYearCourses() is used to do exam registration of 1st year courses of dsy student. 
    public static void regExamDsyFirstYearCourses(String uname,String date) 
    {
        Student_data stud;
       
        Query qr=null;
        String couCode;
        List li=new ArrayList();
        Course_reg creg=new Course_reg();
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        Exam_reg er=new Exam_reg();
                
        try{
            int i=0;
            stud=(Student_data)StudCon.getStudentInfo(uname);
            if(stud.getS_regular().equals("d") && stud.getYear()==2)
            {
                System.out.println("______________________________________________________Reachhed in if");
                try{
                qr=session.createQuery("SELECT course_code FROM Course_reg WHERE regno =:regno and year=1 and reg_term=:term and reg_exmt='y' and reg_can='n' and pass='y'");
                qr.setString("regno",uname);
                qr.setString("term", stud.getTerm());
                li=qr.list();
                System.out.println("_________________________Size of li ="+li.size());
                }catch(Exception e){System.out.println("$$$$$$$$$$$$$$$$$$$$$$$Exception in query$$$$$$$$$$$$$$$$$$$$$$$$$$$44="+e);}
                
                
                
                for(Object obj:li)
                {
                    couCode=(String)obj;
                    System.out.println("____________course_code"+couCode);
                    try
                    { 
                        er.setEx_exmt(1);
                        er.setCourse_code(couCode);
                        er.setRegno(uname);
                        er.setProg(stud.getProgramme()); 
                        er.setEx_reg_date(date);
                        er.setEx_reg_term(stud.getTerm());
                        er.setEx_reg_year(1);
                        er.setEx_th(1);
                        er.setEx_pt(1);
                        er.setEx_pr(1);
                        er.setEx_tw(1);
                        er.setEx_or(1);
                        er.setEx_pass(1);                                 
                        //det,bac,pass,Ex
                        er.setEx_cancel(0);
                        //calling method for storing courses of a student for exam registration.
                        ExamRegCon.exRegister(er);                            
                      
                    }
                    catch(Exception e){System.out.print("##############################"+e);} 
                }
            } 
        }
        catch(Exception e)
        {
            System.out.println("______________________________________________________Failed"+e);
        }
        session.close();
        //sf.close();
    
  }//method regExamDsyFirstYearCourses() closed
    
   //deletes the course registration of particular student.
    public static int courseRegReset(String roll_no)
    {
        Admin_data ad=getAdminInfo();
        String hql;
            Session s;
            Query qr;
            SessionFactory sf;
            //List list1=new ArrayList();
            sf=SessionFact.getSessionFact();
            s=sf.openSession();
             s.beginTransaction();
            qr=s.createQuery("delete  FROM Course_reg WHERE regno =:rollnumber and fail='n'");
             qr.setString("rollnumber", roll_no);
             int result=qr.executeUpdate();
            qr=s.createQuery("update Course_reg SET re_register=NULL WHERE regno =:rollnumber and re_register=:reg_term_year");
            qr.setString("rollnumber", roll_no);
            qr.setString("reg_term_year",ad.getReg_term_year());
           result+=qr.executeUpdate();
            s.getTransaction().commit();
        s.close();
           return result;
    }
      
    public static String getUsernameForAccess(String user,String programme,int shift,String rollno)
    {
        List list1=new ArrayList();
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        if(user.equals("hod"))
        {
            list1=session.createQuery("select username from Hod_data where programme=:programme and shift=:shift and user='hod'").setString("programme", programme).setInteger("shift", shift).list();
        }
        else if(user.equals("registrar"))
        {
            list1=session.createQuery("select username from Hod_data where programme=:programme and shift=:shift and user='registrar'").setString("programme", programme).setInteger("shift", shift).list();
        } 
        else if(user.equals("student"))
        {
            list1=session.createQuery("select username from Student_data where username=:uname").setString("uname", rollno).list();
            
        }
        session.close();
        //sf.close();
        if(list1.size()!=0)
            return list1.get(0).toString();
        else
            return null;
    }
    
 
        //autoUpdateTerm() updates the term of student in student_data table
    //It updates as follows : the term of all students to newTerm
    public static boolean autoUpdateTerm(String currentTerm)
    {
       sf=SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
        
        Query q=session.createQuery("update Student_data set term=:newTerm where term=:currentTerm").setString("currentTerm", currentTerm);
        if(currentTerm.equals("ODD"))
            q.setString("newTerm", "EVEN");
        else if(currentTerm.equals("EVEN")) 
            q.setString("newTerm", "ODD");
        int res=q.executeUpdate();
        session.getTransaction().commit();
        session.close();
        //sf.close(); 
        System.out.print("_______________autoUpdateTerm result = ________________="+res);
        if(res>0)
            return true;
        else
            return false;        
    }
    
    //Function to Encrypt Admin Password
    public static String md5(String pass)
    {
        try{
            MessageDigest md=MessageDigest.getInstance("MD5");
            byte[] messageDigest=md.digest(pass.getBytes());
            BigInteger num=new BigInteger(1,messageDigest);
            String hashText=num.toString(16);
            while(hashText.length()<32)
            {
                hashText="0"+hashText;
            }
            return hashText;
            
        }
        catch(Exception e)
        {
            throw new RuntimeException(e);
        }
    }
    
    public static String retriveBranchFullName(String str)
    {
        if(str.equals("CM"))
            return "COMPUTER TECHNOLOGY";
        else if(str.equals("IF"))
            return "INFORMATION TECHNOLOGY";
        else if(str.equals("ME"))
            return "MECHANICAL ENGINEERING";
        else if(str.equals("CE"))
            return "CIVIL ENGINEERING";
        else if(str.equals("AE"))
            return "AUTOMOBILE ENGINEERING";
        else if(str.equals("PS"))
            return "PLASTIC ENGINEERING";
        else if(str.equals("EL"))
            return "ELECTRONIC AND TELECOMMUNICATION";
        else if(str.equals("EE"))
            return "ELECTRICAL ENGINEERING";
        else if(str.equals("IDD"))
            return "INTERIOR DESIGN AND DECORATION";
        else if(str.equals("DDGM"))
            return "DRESS DESIGN AND GARMENT MANUFACTURING";
        else
            return null;
    }
    
} 