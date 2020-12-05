package daoMappersImpl;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisUtil {
//	private static SqlSession sqlsession = null;
	private static SqlSessionFactory ssf;
	static {
		try {
			//加载配置文件
			InputStream config = Resources.getResourceAsStream("config.xml");
			//建立sql会话工厂
//			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(config);
			SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
			ssf = ssfb.build(config);
			//打开sql会话
//			sqlsession = sessionFactory.openSession();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory() {
//		return sqlsession;
		return ssf;
	}
}
