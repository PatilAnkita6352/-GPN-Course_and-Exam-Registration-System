/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author sarvadnya
 */
public class Courses {
    private int id,department,year,cou_credit,cou_th_credits,cou_pr_credits,cou_tu_credits,cou_th_max,cou_pt_max,cou_tw_max,cou_or_max,cou_pr_max,cou_th_min,cou_pt_min,cou_tw_min,cou_or_min,cou_pr_min,curriculum;
    private String is_exempted,course_name,programme,term,course_code,is_validated,is_offered,cou_pre_r1,cou_pre_r2,cou_pre_r3,cou_pre_r4,cou_remar,c_name,newcode,newEquivalentCourse;
      public String  Course_Abbrevation;
      public int  Theory,Tutorial,Practical,Total_Marks;

    public int getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(int curriculum) {
        this.curriculum = curriculum;
    }

    public String getNewEquivalentCourse() {
        return newEquivalentCourse;
    }

    public void setNewEquivalentCourse(String newEquivalentCourse) {
        this.newEquivalentCourse = newEquivalentCourse;
    }
          
    public String getCourse_Abbrevation() {
        return Course_Abbrevation;
    }

    public void setCourse_Abbrevation(String Course_Abbrevation) {
        this.Course_Abbrevation = Course_Abbrevation;
    }

    public int getDepartment() {
        return department;
    }

    public void setDepartment(int department) {
        this.department = department;
    }

    public int getTheory() {
        return Theory;
    }

    public void setTheory(int Theory) {
        this.Theory = Theory;
    }

    public int getTutorial() {
        return Tutorial;
    }

    public void setTutorial(int Tutorial) {
        this.Tutorial = Tutorial;
    }

    public int getPractical() {
        return Practical;
    }

    public void setPractical(int Practical) {
        this.Practical = Practical;
    }

    public int getTotal_Marks() {
        return Total_Marks;
    }

    public void setTotal_Marks(int Total_Marks) {
        this.Total_Marks = Total_Marks;
    }
    public String getIs_exempted() {
        return is_exempted;
    }

    public void setIs_exempted(String is_exempted) {
        this.is_exempted = is_exempted;
    }

   
    public int getCou_credit() {
        return cou_credit;
    }

    public void setCou_credit(int cou_credit) {
        this.cou_credit = cou_credit;
    }

    public int getCou_th_max() {
        return cou_th_max;
    }

    public void setCou_th_max(int cou_th_max) {
        this.cou_th_max = cou_th_max;
    }

    public int getCou_pt_max() {
        return cou_pt_max;
    }

    public void setCou_pt_max(int cou_pt_max) {
        this.cou_pt_max = cou_pt_max;
    }

    public int getCou_tw_max() {
        return cou_tw_max;
    }

    public void setCou_tw_max(int cou_tw_max) {
        this.cou_tw_max = cou_tw_max;
    }

    public int getCou_or_max() {
        return cou_or_max;
    }

    public void setCou_or_max(int cou_or_max) {
        this.cou_or_max = cou_or_max;
    }

    public int getCou_pr_max() {
        return cou_pr_max;
    }

    public void setCou_pr_max(int cou_pr_max) {
        this.cou_pr_max = cou_pr_max;
    }

    public int getCou_th_min() {
        return cou_th_min;
    }

    public void setCou_th_min(int cou_th_min) {
        this.cou_th_min = cou_th_min;
    }

    public int getCou_pt_min() {
        return cou_pt_min;
    }

    public void setCou_pt_min(int cou_pt_min) {
        this.cou_pt_min = cou_pt_min;
    }

    public int getCou_tw_min() {
        return cou_tw_min;
    }

    public void setCou_tw_min(int cou_tw_min) {
        this.cou_tw_min = cou_tw_min;
    }

    public int getCou_or_min() {
        return cou_or_min;
    }

    public void setCou_or_min(int cou_or_min) {
        this.cou_or_min = cou_or_min;
    }

    public int getCou_pr_min() {
        return cou_pr_min;
    }

    public void setCou_pr_min(int cou_pr_min) {
        this.cou_pr_min = cou_pr_min;
    }

    public String getCou_pre_r1() {
        return cou_pre_r1;
    }

    public void setCou_pre_r1(String cou_pre_r1) {
        this.cou_pre_r1 = cou_pre_r1;
    }

    public String getCou_pre_r2() {
        return cou_pre_r2;
    }

    public void setCou_pre_r2(String cou_pre_r2) {
        this.cou_pre_r2 = cou_pre_r2;
    }

    public String getCou_pre_r3() {
        return cou_pre_r3;
    }

    public void setCou_pre_r3(String cou_pre_r3) {
        this.cou_pre_r3 = cou_pre_r3;
    }

    public String getCou_pre_r4() {
        return cou_pre_r4;
    }

    public void setCou_pre_r4(String cou_pre_r4) {
        this.cou_pre_r4 = cou_pre_r4;
    }

    public String getCou_remar() {
        return cou_remar;
    }

    public void setCou_remar(String cou_remar) {
        this.cou_remar = cou_remar;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getNewcode() {
        return newcode;
    }

    public void setNewcode(String newcode) {
        this.newcode = newcode;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }

    public int getId() { 
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourse_code() {
        return course_code;
    }

    public void setCourse_code(String course_code) {
        this.course_code = course_code;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getIs_validated() {
        return is_validated;
    }

    public void setIs_validated(String is_validated) {
        this.is_validated = is_validated;
    }

    public String getIs_offered() {
        return is_offered;
    }
    
    public void setIs_offered(String is_offered) {
        this.is_offered = is_offered;
    }   

    public int getCou_th_credits() {
        return cou_th_credits;
    }

    public void setCou_th_credits(int cou_th_credits) {
        this.cou_th_credits = cou_th_credits;
    }

    public int getCou_pr_credits() {
        return cou_pr_credits;
    }

    public void setCou_pr_credits(int cou_pr_credits) {
        this.cou_pr_credits = cou_pr_credits;
    }

    public int getCou_tu_credits() {
        return cou_tu_credits;
    }

    public void setCou_tu_credits(int cou_tu_credits) {
        this.cou_tu_credits = cou_tu_credits;
    }
     
}
