package com.inhatc.system.user.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import com.inhatc.system.user.vo.UserVO;


/**************************************************************************************
 *
 * @Class Name  : UserDaoImpl.java
 * @Description : ����ڸ� �����ϴ� DAO
 *                  
 * @Modification Information  
 * <p>
 * <b>NOTE</b>: 
 * @author ������
 * @since  2018.09.18
 * @version 1.0
 * @see <pre>
 *  == �����̷�(Modification Information) ==
 *   
 *   ������                   ������              ��������
 *  ------------    --------    ---------------------------
 *   2018.09.18     ������              ���� ���� 
 *   2019.01.10 	������		Console ���� ����
 *   2019.01.19		������		ȸ�� �߰�, ����, ����
 *   2019.01.31		������		�ּ� ǥ��
 *   
 * </pre> **************************************************************************************/

@Service
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession session;
	private static String namespace="com.inhatc.mapper.UserMapper";
	
	/*�α���*/
   @Override
	public int login(UserVO uservo) throws Exception{
	
		return session.selectOne(namespace + ".login", uservo);
	}
   
   /*�α��ΰ��ɿ���*/
   @Override
   public UserVO loginInqr(UserVO uservo) throws Exception {
	   
	   System.out.println("(UserDAOImpl)���� �α��� �� ������ �������� ��");
	   
       return (UserVO)session.selectOne(namespace +".loginInqr", uservo);   //���� ������ selectOne ���ٸ� �ްڴ�. 
       
    }
   
   /*ȸ�� ���*/
	@Override
	public List<UserVO> UserList(UserVO uservo) throws Exception{
		
		System.out.println("(UserDAOImpl)���� ȸ������ ��� �ҷ�����");
		
		return session.selectList(namespace + ".UserList", uservo);
	}
	
	/*id �˻�*/
	@Override
	public UserVO find_id(String id) throws Exception{
		
		System.out.println("(UserDAOImpl)���� ȸ������ ��������");
		
		return session.selectOne(namespace + ".find_id", id);
	}
	
	/*ȸ�� �߰�*/
   @Override
   public void join(UserVO uservo) throws Exception{
	   
	   System.out.println("(UserDAOImpl)���� ȸ����� ���� ��");
	   
		session.insert("com.inhatc.mapper.UserMapper.join",uservo);
   }
	
   /*ȸ�� ���� ����*/
	@Override
	public void userModify(UserVO uservo) throws Exception{
		
		System.out.println("(UserDAOImpl)���� ȸ������ ����");
		
		session.update(namespace + ".userUpdate", uservo);
	}
	
	/*ȸ�� ���� ����*/
	@Override
	public void userDelete(UserVO uservo) throws Exception{
		
		System.out.println("(UserDAOImpl)���� ȸ�� ���� ����");
		
		session.delete(namespace + ".userDelete", uservo);
	
	}
}