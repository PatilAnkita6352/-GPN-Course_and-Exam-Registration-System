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
public class Admin_data {
    private int id,max_reg_courses,curriculum;
     private String mother_name,username,password,is_reg_started,reg_term_year,first_PT_date,second_PT_date,end_of_term,or_pr_tw_exam_date,final_exam_date,examination_reg_date,notice;

    public int getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(int curriculum) {
        this.curriculum = curriculum;
    }
     
    public String getMother_name() {
        return mother_name;
    }

    public void setMother_name(String mother_name) {
        this.mother_name = mother_name;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public String getExamination_reg_date() {
        return examination_reg_date;
    }

    public void setExamination_reg_date(String examination_reg_date) {
        this.examination_reg_date = examination_reg_date;
    }

    public String getFirst_PT_date() {
        return first_PT_date;
    }

    public void setFirst_PT_date(String first_PT_date) {
        this.first_PT_date = first_PT_date;
    }

    public String getSecond_PT_date() {
        return second_PT_date;
    }

    public void setSecond_PT_date(String second_PT_date) {
        this.second_PT_date = second_PT_date;
    }

    public String getEnd_of_term() {
        return end_of_term;
    }

    public void setEnd_of_term(String end_of_term) {
        this.end_of_term = end_of_term;
    }

    public String getOr_pr_tw_exam_date() {
        return or_pr_tw_exam_date;
    }

    public void setOr_pr_tw_exam_date(String or_pr_tw_exam_date) {
        this.or_pr_tw_exam_date = or_pr_tw_exam_date;
    }

    public String getFinal_exam_date() {
        return final_exam_date;
    }

    public void setFinal_exam_date(String final_exam_date) {
        this.final_exam_date = final_exam_date;
    }
    public int getMax_reg_courses() {
        return max_reg_courses;
    }

    public void setMax_reg_courses(int max_reg_courses) {
        this.max_reg_courses = max_reg_courses;
    }
   public String getReg_term_year() {
        return reg_term_year;
    }

    public void setReg_term_year(String reg_term_year) {
        this.reg_term_year = reg_term_year;
    }

    public String getIs_reg_started() {
        return is_reg_started;
    }

    public void setIs_reg_started(String is_reg_started) {
        this.is_reg_started = is_reg_started;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
