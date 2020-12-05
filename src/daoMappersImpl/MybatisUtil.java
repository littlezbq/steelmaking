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
			//���������ļ�
			InputStream config = Resources.getResourceAsStream("config.xml");
			//����sql�Ự����
//			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(config);
			SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
			ssf = ssfb.build(config);
			//��sql�Ự
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
