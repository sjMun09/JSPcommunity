package bbs;

// 자바빈즈임. 하나의 게시글 정보를 담을 수 있는 인스턴스를 만들 수 있는 트리임. (게시글 하나를 관리할 수 있는 자바 파일) 

//데이터 베이스 구축 
public class Bbs {
    private int bbsID;
    private String bbsTitle;
    private String userID;
    private String bbsDate;
    private String bbsContent;
    private int bbsAvailable;
    
    public int getBbsID() {
        return bbsID;
    }
    public void setBbsID(int bbsID) {
        this.bbsID = bbsID;
    }
    public String getBbsTitle() {
        return bbsTitle;
    }
    public void setBbsTitle(String bbsTitle) {
        this.bbsTitle = bbsTitle;
    }
    public String getUserID() {
        return userID;
    }
    public void setUserID(String userID) {
        this.userID = userID;
    }
    public String getBbsDate() {
        return bbsDate;
    }
    public void setBbsDate(String bbsDate) {
        this.bbsDate = bbsDate;
    }
    public String getBbsContent() {
        return bbsContent;
    }
    public void setBbsContent(String bbsContent) {
        this.bbsContent = bbsContent;
    }
    public int getBbsAvailable() {
        return bbsAvailable;
    }
    public void setBbsAvailable(int bbsAvailable) {
        this.bbsAvailable = bbsAvailable;
    }
 
}
