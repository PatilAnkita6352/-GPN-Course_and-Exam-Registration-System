/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainController;

import beans.Exam_reg;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import SessionFact.SessionFact;
import beans.Admin_data;
import beans.Courses;
import static mainController.AdminCon.getAdminInfo;


/**
 *
 * @author sarvadnya
 */
public class ExamRegCon {
    static Session session;
    static SessionFactory sf;
    static Exam_reg er;
   
    public static int exRegister(Exam_reg exreg)
    {
        int i=0;
        //Session session=new Configuration().configure().buildSessionFactory().openSession();
        try
        {
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        //System.out.print("_______________________________________________________________________________Reached to Cou_register method");
        //System.out.print("_______________________________________________________________________________Cou_code = "+creg.getCou_code());
        System.out.print("Going to register(in Ex_register method) _____"+exreg.getId()+"_________"+exreg.getCourse_code()+"________"+exreg.getRegno()+"______"+exreg.getProg());
        session.beginTransaction();
        i=(Integer)session.save(exreg);
        session.getTransaction().commit();
        session.close();
        //sf.close();
        System.out.print(i);
        }
        catch(Exception e){System.out.print("_________________________ex__register exception-------------------------------------"+e);}
        return i;
    }
     public static int examRegReset(String roll_no)
    {
       
            Query qr;
         
            List list1=new ArrayList();
            sf=SessionFact.getSessionFact();
            session=sf.openSession();
             session.beginTransaction();
            qr=session.createQuery("delete FROM Exam_reg WHERE regno =:rollnumber");
             qr.setString("rollnumber", roll_no);
             System.out.println("-----------------------------------------------------------"+roll_no);
             
           int result=qr.executeUpdate();
            session.getTransaction().commit();
        session.close();
        //sf.close();
           return result;      
    }
    
      /*This nested static class of ExamRegCon class is used in getExamReportbyFilter() method of ExamRegCon class
            ExamRegRep class is created to combine data of 2 tables into one object */
     public static class ExamRegRep
     {
         private String regno,studName,course_code,courseName,ex_reg_date,prog;
         private int ex_th,ex_pt,ex_tw,ex_pr,ex_or,ex_reg_year,shift;

        public ExamRegRep(String regno, String course_code, String ex_reg_date, String prog, int ex_reg_year, int shift) {
            this.regno = regno;
            this.course_code = course_code;
            this.ex_reg_date = ex_reg_date;
            this.prog = prog;
            this.ex_th=-1;
            this.ex_pt=-1;
            this.ex_tw=-1;
            this.ex_pr=-1;
            this.ex_or=-1;
            this.ex_reg_year = ex_reg_year;
            this.shift = shift;
        }   

        public void setStudName(String studName) 
        {this.studName = studName;}
        public void setCourseName(String courseName) 
        {this.courseName = courseName;}
        public void setEx_th(int ex_th) 
        {this.ex_th = ex_th;}
        public void setEx_pt(int ex_pt) 
        {this.ex_pt = ex_pt;}
        public void setEx_tw(int ex_tw) 
        {this.ex_tw = ex_tw;}
        public void setEx_pr(int ex_pr) 
        {this.ex_pr = ex_pr;}
        public void setEx_or(int ex_or) 
        {this.ex_or = ex_or;}

        public String getRegno() 
        {return regno;}
        public String getStudName() 
        {return studName;}
        public String getCourse_code() 
        {return course_code;}
        public String getCourseName() 
        {return courseName;}
        public String getEx_reg_date() 
        {return ex_reg_date;}
        public String getProg() 
        {return prog;}
        public int getEx_th() 
        {return ex_th;}
        public int getEx_pt() 
        {return ex_pt;}
        public int getEx_tw() 
        {return ex_tw;}
        public int getEx_pr() 
        {return ex_pr;}
        public int getEx_or() 
        {return ex_or;}
        public int getEx_reg_year() 
        {return ex_reg_year;}
        public int getShift() 
        {return shift;}  
     }
     
     //Retrieving exam registration report according to filter set by user.
     public static List getExamReportbyFilter(String coursecode,String reg_year,String branch,int ex_reg_year,int shift)
     {
        Query qr;
        List list,liStud,liCourse;
        List<ExamRegRep>li=new ArrayList<>();
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
        String query="FROM Exam_reg WHERE ex_reg_date=:reg_year";
        if(coursecode!=null)
        {
            query=query+" and course_code=:coursecode";    
        }
        if(branch!=null)
        {
            query=query+" and prog=:branch";
        }
        if(ex_reg_year!=0)
        {
            query=query+" and ex_reg_year="+ex_reg_year+"";
        }
        if(shift!=0)
        {
            query=query+" and shift="+shift+"";
        }
        query=query+" and ex_cancel=0 order by regno asc";
        
        qr=session.createQuery(query);
        qr.setString("reg_year",reg_year);
        if(coursecode!=null)
        {
            qr.setString("coursecode",coursecode);
        }
        if(branch!=null)
        {
            qr.setString("branch",branch);
        }
       list=qr.list();
        for(Object a:list)
        {
            Exam_reg e=(Exam_reg)a;
            
             /*ExamRegRep is a static nested class of ExamRegCon class .
            ExamRegRep class is created to combine data of 2 tables into one object ,it also helps 
            while adding proper data in the list ,we are using list to avoid too many connection error */
            ExamRegRep er=new ExamRegRep(e.getRegno(),e.getCourse_code(),e.getEx_reg_date(),e.getProg(),e.getEx_reg_year(),e.getShift());
            qr=session.createQuery("Select s_name FROM Student_data where rollno=:regno").setString("regno",e.getRegno());
            liStud=qr.list();
            if(liStud.size()!=0)
            er.setStudName((String)liStud.get(0));
       
            qr=session.createQuery("FROM Courses where course_code=:coursecode").setString("coursecode",e.getCourse_code());
            liCourse=qr.list();
            Courses c=(Courses)liCourse.get(0);
            if(liCourse.size()!=0)
            {System.out.println(coursecode+c.getCourse_name());
                er.setCourseName(c.getCourse_name());
            if(c.getCou_th_max()!=0)
                er.setEx_th(e.getEx_th());
            if(c.getCou_pt_max()!=0)
                er.setEx_pt(e.getEx_pt());
            if(c.getCou_tw_max()!=0)
                er.setEx_tw(e.getEx_tw());
            if(c.getCou_pr_max()!=0)
                er.setEx_pr(e.getEx_pr());
            if(c.getCou_or_max()!=0)
                er.setEx_or(e.getEx_or());}
            li.add(er);
        }
       
        session.close();
        return li;
     }

   
//deatinStudents() is used to detain students in given courses  
         public static boolean detainStudents(List li){
         int n=0;
         sf=SessionFact.getSessionFact(); 
         session=sf.openSession();
         session.beginTransaction();
          Admin_data ad=getAdminInfo();
         for(List<String>CCandRoll:(List<List<String>>)li){
             String code=CCandRoll.get(0);
             CCandRoll.remove(0);
          Query q=session.createQuery("update Exam_reg set ex_det=1 where course_code=:code and regno in(:regnos) and ex_reg_date=:reg_term_year").setString("code",code).setParameterList("regnos",CCandRoll).setString("reg_term_year",ad.getReg_term_year());
           Query q1=session.createQuery("update Course_reg set fail=:y where course_code=:code and regno in(:regnos) and reg_term_year=:reg_term_year").setString("y","y").setString("code",code).setParameterList("regnos",CCandRoll).setString("reg_term_year",ad.getReg_term_year());
          
          if(q.executeUpdate()>0 && q1.executeUpdate()>0)  
            n=n+1;
       }
          session.getTransaction().commit();
            session.close();
            if(n>0)
           return true;  
            else 
           return false;
     }
         
     //getDetainedStudWithCourseCode() is used to get ExamRegistration records in which students are detained
     public static List getDetainedStudwithCourseCode(String programme,int year)
     {
         List li;
          sf=SessionFact.getSessionFact(); 
         session=sf.openSession();
       Admin_data ad=getAdminInfo();
       Query q=session.createQuery("from Exam_reg where prog=:programme and ex_reg_year="+year+" and ex_reg_date=:reg_term_year and ex_det=1").setString("programme",programme).setString("reg_term_year",ad.getReg_term_year());
         li=q.list() ;
          session.close();
          return li;
     }
     

}