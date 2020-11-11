package Conn;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import UserList.UserList;

public class DBHelper {
	private static Connection conn = DBConn.getConnection();
	private static PreparedStatement pstm = null;
	private static ResultSet rs = null;
//	查询全部质保
	public static List<UserList> selectAll() {
		List<UserList> UserList=new ArrayList<UserList>();
		try {
			String sql = "select * from wx_userlist";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				UserList userlist=new UserList();
				int id = rs.getInt("id");
				String name = rs.getString("name");
			    String phone=rs.getString("phone");
				String carModel=rs.getString("carModel");
				String carNumber=rs.getString("carNumber");
				String carColor=rs.getString("carColor");
				String unit=rs.getString("unit");
				String date=rs.getString("date");
				String position=rs.getString("position");
				String technician=rs.getString("technician");
				String productModel=rs.getString("productModel");
				userlist.setId(id);
				userlist.setName(name);
				userlist.setPhone(phone);
				userlist.setCarModel(carModel);
				userlist.setCarNumber(carNumber);
				userlist.setCarColor(carColor);
				userlist.setUnit(unit);
				userlist.setDate(date);
				userlist.setPosition(position);
				userlist.setTechnician(technician);
				userlist.setProductModel(productModel);
				UserList.add(userlist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
return UserList;
	}
//	查询质保订单数据
	public static int select_count(){
		int n=0;
		String sql="select count(`id`) from `wx_userlist` ";
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()){
				n=rs.getInt(1);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
//	插入质保数据
	public static int info(String name,String phone,String carModel,String carNumber,String carColor,String unit,String date,String position,String technician,String productModel){
		int n=0;
		String sql="insert into wx_userlist(name,phone,carModel,carNumber,carColor,unit,date,position,technician,productModel) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, phone);
			pstm.setString(3, carModel);
			pstm.setString(4, carNumber);
			pstm.setString(5, carColor);
			pstm.setString(6, unit);
			pstm.setString(7, date);
			pstm.setString(8, position);
			pstm.setString(9, technician);
			pstm.setString(10, productModel);
			n = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
//	删除质保数据
	public static int delet(int id){
		int m=0;	
		try {
			String sql="delete from wx_userlist where id=?";
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, id);
			m=pstm.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return m;
	}
//	按条件查询质保数据
	public static List<UserList> selsct(String code,String value) {
			List<UserList> UserList=new ArrayList<UserList>();
			try {
			    String sql = "select * from wx_userlist where "+code+"=?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, value);
				rs = pstm.executeQuery();
				while (rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
				    String phone=rs.getString("phone");
					String carModel=rs.getString("carModel");
					String carNumber=rs.getString("carNumber");
					String carColor=rs.getString("carColor");
					String unit=rs.getString("unit");
					String date=rs.getString("date");
					String position=rs.getString("position");
					String technician=rs.getString("technician");
					String productModel=rs.getString("productModel");
					
					UserList userlist=new UserList();
					
					userlist.setId(id);
					userlist.setName(name);
					userlist.setPhone(phone);
					userlist.setCarModel(carModel);
					userlist.setCarNumber(carNumber);
					userlist.setCarColor(carColor);
					userlist.setUnit(unit);
					userlist.setDate(date);
					userlist.setPosition(position);
					userlist.setTechnician(technician);
					userlist.setProductModel(productModel);
					
					UserList.add(userlist);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	return UserList;
	}
	//按条件查询质保
		public static UserList selsct(int id) {
			UserList userlist=new UserList();
			try {
				String sql = "select * from wx_userlist where id=?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, String.valueOf(id));
				rs = pstm.executeQuery();
				while (rs.next()) {
					String name = rs.getString("name");
				    String phone=rs.getString("phone");
					String carModel=rs.getString("carModel");
					String carNumber=rs.getString("carNumber");
					String carColor=rs.getString("carColor");
					String unit=rs.getString("unit");
					String date=rs.getString("date");
					String position=rs.getString("position");
					String technician=rs.getString("technician");
					String productModel=rs.getString("productModel");
					
					userlist.setId(id);
					userlist.setName(name);
					userlist.setPhone(phone);
					userlist.setCarModel(carModel);
					userlist.setCarNumber(carNumber);
					userlist.setCarColor(carColor);
					userlist.setUnit(unit);
					userlist.setDate(date);
					userlist.setPosition(position);
					userlist.setTechnician(technician);
					userlist.setProductModel(productModel);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return userlist;
		}
//质保数据更新
		public static int updateAll(int id,String name,String phone,String carModel,String carNumber,String carColor,String unit,String date,String position,String technician,String productModel) {
			int m=0;	
			try {
				String sql="update wx_userlist set name=?,phone=?,carModel=?,carNumber=?,carColor=?,unit=?,date=?,position=?,technician=?,productModel=?where id=?";
				pstm=conn.prepareStatement(sql);
				pstm.setString(1,name);
				pstm.setString(2,phone);
				pstm.setString(3,carModel);
				pstm.setString(4,carNumber);
				pstm.setString(5,carColor);
				pstm.setString(6,unit);
				pstm.setString(7,date);
				pstm.setString(8,position);
				pstm.setString(9,technician);
				pstm.setString(10,productModel);
				pstm.setInt(11, id);
				m=pstm.executeUpdate();		
			} catch (SQLException e) {
				e.printStackTrace();
			}	
			return m;
		}
		public static int Login(String username,String password){
			int n=0;
			try {
				String sql="select count(*) from wx_admin where name=? and password=?";
				pstm=conn.prepareStatement(sql);
				pstm.setString(1, username);
				pstm.setString(2, password);
				rs=pstm.executeQuery();
				while(rs.next()){
					n = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}	
			return n;
		}
}
