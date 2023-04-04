// 컨트롤러 라고 보면됨. 게시판 글 작성하면 여기서 컨트롤 함.
package bbs;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


//DB에 접근하기 위한 객체 생성 
public class BbsDAO {
    private Connection conn;            // DB에 접근하는 객체
    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
    
    
    
    // mysql 접속 . 실제 db에 접근해서 데이터 관리 (연결한단 소리) 
    public BbsDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/bbs"; // 본인 컴퓨터의 주소를 의미. 3306포트에 BBS에 접속하도록 합니다.
            String dbID = "root";
            String dbPassword = "85947ads$%";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//	현재시간을 가져오는 함수 
    public String getDate() // 현재시간을 넣어주기위해
    {
        String SQL = "SELECT NOW()"; // 현재시간을 나타내는 mysql
        try {
        	//BbsDAO 클래스 같은 경우, 여러 갱의 함수가 사용되기 때문에 각각 함수끼리 데이터 베이스 접근에 있어서 마찰이 일어나지 않도록 
			// private PreparedStatement pstmt; 지워주고 내부에 만들어줌. 
            PreparedStatement pstmt = conn.prepareStatement(SQL); // 현재 연결되어있는 conn 객체를 이용해서, SQL 문장을  실행 준비 단계로 만들어줍니다.
            rs = pstmt.executeQuery(); // 실제 나 수 있는 결과를 가져옴.
            if(rs.next()) { // 있는 경우, 
                return rs.getString(1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ""; // 빈문자열을 반환해줌으로써 db 오류를 알려줄 수 있음 
    }
    
    public int getNext()
    {
        String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
			// bbsID를 가져옴. 이 게시물 번호 같은 경우 이제 1번부터 하나씩 늘어나기 때문에,
			// 마지막에 쓰인 글을 가져와서(FROM) 그 글 번호에다가 1을 더한 값이 그 다음 글의 번호가 됨.
			// 그걸 위해서 BBS 에서 이렇게 DESC 내림차순해서 제일 마지막에 쓰인 글 번호를 가져옴.
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery(); // 실제 나 수 있는 결과를 가져옴.
            if(rs.next()) {
                return rs.getInt(1) + 1; // 그 다음 게시글 번호이며,  그 다음 나온결과에 1을 더해서 게시글의 번호가 들어갈 수 있도록 만들어줌.
            }
            return 1; //  첫 번째 게시물 (현재 쓰인 게시물이 하나도 없는 경우에는 결과가 나오지 않기 때문) 1을 리턴해줘서 위치를 알려줌, 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    // VALUES로 수정 
    public int write(String bbsTitle, String userID, String bbsContent) {
        String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, bbsTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, bbsContent);
            pstmt.setInt(6, 1);  // 첫 번째가 bbsID , 처음 글을 작성했을 땐, 글이 보여지는 형태가 되어야되고, 삭제가 안 된거니까, 이렇게 뒤에 '1'을 넣어줌.
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
    public ArrayList<Bbs> getList(int pageNumber)
    {   // 1을 넣어줌, 즉. 삭제가 되지 않아서 Availabl 1인 글들만 가져올 수 있도록 만들어줌. 		  bbsID로 내림차순 정렬하고, 맨 마지막에 쓰인 것을 가져옴
    	String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
     // bbs 라는 클래스에서 나온 인스턴스를 보관할 수 있는 리스트 생성
        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10); // getNext()같은 경우는 그 다음으로 작성될 글의 번호를 의미함.
            rs = pstmt.executeQuery();// 실제 나 수 있는 결과를 가져옴.
            while (rs.next()) {
            	// 결과가 나올 때마다 bbs 란 하나의 인스턴스를 만들어줌.
            	Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                list.add(bbs); // 결과로 나온 모든 게시글 목록을 담아서, 결국 리스트에 해당 인스턴스를 담아서 반환할 수 있도록
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
    // 만약 게시글이 10개 , 5개 등 단위로 끊긴다면, 다음 페이지라는 버튼이 없어야 됨. 왜냐면 다음 페이지로 넘어가기 때문, (페이징처리)
  	// 쉽게 말하면 페이징 처리를 위해 존재하는 함수임.
    public boolean nextPage(int pageNumber) {
    	String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1"; 
        try {
        	PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; 
    }
    // 원하는 글을 눌렀을 때 상세 내역을 보기 위한 메서드 표현
    public Bbs getBbs(int bbsID)
    {
            String SQL = "SELECT * FROM BBS WHERE bbsID = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setInt(1, bbsID);
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                    Bbs bbs = new Bbs();
                    bbs.setBbsID(rs.getInt(1));
                    bbs.setBbsTitle(rs.getString(2));
                    bbs.setUserID(rs.getString(3));
                    bbs.setBbsDate(rs.getString(4));
                    bbs.setBbsContent(rs.getString(5));
                    bbs.setBbsAvailable(rs.getInt(6));
                    return bbs;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
    
//    글 수정
    public int update(int  bbsID, String bbsTitle, String bbsContent) {
    	
    	String SQL = "UPDATE BBS SET bbsTitle =?, bbsContent = ? WHERE bbsID = ?"; 
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, bbsTitle);
    		pstmt.setString(2, bbsContent);
    		pstmt.setInt(3, bbsID);
    		return pstmt.executeUpdate();
    		} catch (Exception e) {
    			e.printStackTrace();
    		}	
    		return -1; // 데이터베이스 오류
    	}
    
    // 글 삭제, 어떤 글인지 알 ㅅ ㅜ 있게 id 값을 받아옴. 
    // 글을 삭제하더라도 DB에는 저장될 수 있게 bbsAvailable 값을 0으로 해줌.
    public int delete(int bbsID)
    {
        String SQL = "UPDATE BBS SET bbsAvailable = 0  WHERE bbsID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }    
}