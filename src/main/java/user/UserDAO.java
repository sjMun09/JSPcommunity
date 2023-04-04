package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//회원 정보를 불러오거나, 넣고자할 때 사용함.
public class UserDAO {
	
	// DB에 접근하기 위한 객체 생
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// mysql 접. 실제 db에 접근해서 데이터 관리 
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS"; // 본인 컴퓨터의 주소를 의미. 3306포트에 BBS에 접속하도록 합니다.
															//localhost:3306은 우리컴퓨터에 설치된 mysql 서버자체이며, bbs 라는db에 접속.
			String dbID = "root";
			String dbPassword = "85947ads$%";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공 
				}
				else return 0; // 비밀번호 불일치 
			}
			return -1; // 아이디 없음을 알려줌 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류 의미 
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류 . 
	}
}
