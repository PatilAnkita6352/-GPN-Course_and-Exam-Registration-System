
package beans;


public class Course_reg {
    int id,year,shift,curriculum;
    String regno,course_code,reg_date,reg_term,reg_exmt,reg_can,pass,fail,no_app,remark,program,reg_term_year,re_register;

    public String getRe_register() {
        return re_register;
    }

    public void setRe_register(String re_register) {
        this.re_register = re_register;
    }

    public int getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(int curriculum) {
        this.curriculum = curriculum;
    }
    
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year; 
    }

    public int getShift() {
        return shift;
    }

    public void setShift(int shift) {
        this.shift = shift;
    }
    
    public String getReg_term_year() {
        return reg_term_year;
    }

    public void setReg_term_year(String reg_term_year) {
        this.reg_term_year = reg_term_year;
    }
       
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRegno() {
        return regno;
    }

    public void setRegno(String regno) {
        this.regno = regno;
    }

    public String getCourse_code() {
        return course_code;
    }

    public void setCourse_code(String course_code) {
        this.course_code = course_code;
    }


    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public String getReg_term() {
        return reg_term;
    }

    public void setReg_term(String reg_term) {
        this.reg_term = reg_term;
    }

    public String getReg_exmt() {
        return reg_exmt;
    }

    public void setReg_exmt(String reg_exmt) {
        this.reg_exmt = reg_exmt;
    }

    public String getReg_can() {
        return reg_can;
    }

    public void setReg_can(String reg_can) {
        this.reg_can = reg_can;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFail() {
        return fail;
    }

    public void setFail(String fail) {
        this.fail = fail;
    }

    public String getNo_app() {
        return no_app;
    }

    public void setNo_app(String no_app) {
        this.no_app = no_app;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
}
