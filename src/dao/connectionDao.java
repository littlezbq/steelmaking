package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.productSteel;

//这个getconnection方法会返回connection的对象，具体的sql语句实现是在下面另一个方法find中实现的
public class connectionDao {
	Connection conn = null;
	public Connection getConnection() {
		try {
//			配置数据库连接的一些操作，具体可看自己的onenote    注册驱动如果是高版本需要在中间加上  .cj.
			Class.forName("com.mysql.cj.jdbc.Driver");
//			注意如果不加上?serverTimezone=GMT%2B8有时候产生编码错误      参数分别是url name password
			conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/steelmaking?serverTimezone=GMT%2B8","root","123456");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
//	数据存在一个链表中，链表的每个元素都是bean包中的data类
	public List<productSteel> find(){
		Statement st = null;
		ResultSet rs = null;
		List<productSteel> list = new ArrayList<productSteel>();
		Connection conn = getConnection();
		String sql = "select * from steelmaking.product_steel";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
//			查询的结果集通过next方法依次读入到每个对象中然后添加到链表中返回出来一个链表以供使用
			while (rs.next()) {
				productSteel res = new productSteel();
				res.setSteel_name(rs.getString("steel_name"));
				res.setClass_no(rs.getString("class_no"));
				res.setProduce_date(rs.getString("produce_date"));
				res.setFurnace_num(rs.getString("furnace_num"));
				res.setSteel_c(rs.getDouble("steel_c"));
				res.setSteel_si(rs.getDouble("steel_si"));
				res.setSteel_mn(rs.getDouble("steel_mn"));
				res.setSteel_p(rs.getDouble("steel_p"));
				res.setSteel_s(rs.getDouble("steel_s"));
				res.setSteel_als(rs.getDouble("steel_als"));
				res.setSteel_ti(rs.getDouble("steel_ti"));
				res.setSteel_nb(rs.getDouble("steel_nb"));
				list.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(st!=null) {	
				try {
					st.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {	
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		return list;
	}
}