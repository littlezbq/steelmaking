package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.productSteel;

//���getconnection�����᷵��connection�Ķ��󣬾����sql���ʵ������������һ������find��ʵ�ֵ�
public class connectionDao {
	Connection conn = null;
	public Connection getConnection() {
		try {
//			�������ݿ����ӵ�һЩ����������ɿ��Լ���onenote    ע����������Ǹ߰汾��Ҫ���м����  .cj.
			Class.forName("com.mysql.cj.jdbc.Driver");
//			ע�����������?serverTimezone=GMT%2B8��ʱ������������      �����ֱ���url name password
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
	
//	���ݴ���һ�������У������ÿ��Ԫ�ض���bean���е�data��
	public List<productSteel> find(){
		Statement st = null;
		ResultSet rs = null;
		List<productSteel> list = new ArrayList<productSteel>();
		Connection conn = getConnection();
		String sql = "select * from steelmaking.product_steel";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
//			��ѯ�Ľ����ͨ��next�������ζ��뵽ÿ��������Ȼ����ӵ������з��س���һ�������Թ�ʹ��
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