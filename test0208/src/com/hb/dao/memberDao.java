package com.hb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hb.dto.memberDto;

public class memberDao {
	private Connection getConnection() {
		Connection conn = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "test";
		String dbPW = "1234";
		
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbID,dbPW);
			System.out.println("<h1>Oracle 접속성공</h1>");
		} catch(Exception e){
			e.printStackTrace();
			System.out.println("접속실패");
		}
		return conn;
	}
	public memberDto getMemberDto(String id) {
		Connection conn = getConnection();
		memberDto dto = new memberDto();
		String sql = "SELECT * FROM simple_board WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPoint(rs.getInt("point"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void setMemberDB(String id, String pw, String name) {
		Connection conn = getConnection();
		String sql = "INSERT INTO simple_board VALUES(?,?,?,0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<memberDto> getAllMemberDto() {
		ArrayList<memberDto> list = new ArrayList<memberDto>();
		Connection conn = getConnection();
		memberDto dto = new memberDto();
		String sql = "SELECT * FROM simple_board";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				list.add(new memberDto(id,pw,name,point));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void pointplus(String id, int point) {
		Connection conn = getConnection();
		String sql = "UPDATE simple_board SET point = ? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,point+1000);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void buy(String id, int point) {
		Connection conn = getConnection();
		String sql = "UPDATE simple_board SET point = ? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,point);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
