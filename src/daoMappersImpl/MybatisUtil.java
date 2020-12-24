package daoMappersImpl;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisUtil {
//	�����¼һ�·����ĳ�
	
	private static SqlSession sqlsession = null;
	private final static Class<MybatisUtil> LOCK = MybatisUtil.class;
	private static SqlSessionFactory ssf = null;
	private MybatisUtil(){}
	public static SqlSessionFactory getSqlSessionFactory() {
		synchronized (LOCK) {
			if (ssf != null) {
				return ssf;
			}
			try {
				//���������ļ�
				InputStream config = Resources.getResourceAsStream("config.xml");
				//����sql�Ự����
//				SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(config);
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				ssf = ssfb.build(config);
				//��sql�Ự
//				sqlsession = sessionFactory.openSession();
			}
			catch (IOException e) {
				e.printStackTrace();
				return null;
			}
			return ssf;
		}
	}
	
	public static SqlSession openSqlSession() {
//		return sqlsession;
		if (ssf == null) {
			getSqlSessionFactory();
		}
		return ssf.openSession();
	}
	
	
	
	
//	private static SqlSessionFactory ssf;
//	static {
//		try {
//			//���������ļ�
//			InputStream config = Resources.getResourceAsStream("config.xml");
//			//����sql�Ự����
////			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(config);
//			SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
//			ssf = ssfb.build(config);
//			//��sql�Ự
////			sqlsession = sessionFactory.openSession();
//		}
//		catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public static SqlSessionFactory getSqlSessionFactory() {
////		return sqlsession;
//		return ssf;
//	}
	
	
	
}
