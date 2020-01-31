package com.inhatc.system.user.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.inhatc.system.user.dao.UserDAO;
import com.inhatc.system.user.vo.UserVO;

/**************************************************************************************
*
* @Class Name  : UserServiceImpl.java
* @Description : ����ڸ� �����ϴ� service
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
*   2018.09.18      ������              ���� ���� 
*   2019.01.10 		������		Console ���� ����
*   2019.01.19		������		ȸ�� �߰�, ����, ����
*   2019.01.31		������		�ּ� ǥ��   
*   2020.01.31		������		���� ������Ʈ �� ��� �߰�
* </pre> **************************************************************************************/

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	/*�α���*/
	@Override
	public int login(UserVO uservo) throws Exception {
		
		int resultCode = 0;

		resultCode = userDAO.login(uservo);
		
		return resultCode;
	}

	/*�α��ΰ��ɿ���*/
	public UserVO loginInqr(UserVO uservo, HttpSession ses) throws Exception {
				
		UserVO loginModel = userDAO.loginInqr(uservo); // db ���� ����Ʈ �ؿ� ������ -> ��oginModel 

		if (loginModel != null) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

			uservo.setLoginType("Y");
			
			ses.setAttribute("LOGIN_ID", loginModel.getId()); 
			ses.setAttribute("LOGIN_PW", loginModel.getPw()); 
			ses.setAttribute("LOGIN_NAME", loginModel.getManager_name()); 
			ses.setAttribute("LOGIN_BELONG", loginModel.getManager_belong());
			ses.setMaxInactiveInterval(60*60*60) ;
			
			System.out.println("(UserServiceImpl) �ٷ��л��� �ҼӺз��� " + loginModel.getManager_belong());
			System.out.println("(UserServiceImpl) �ٷ��л��� �̸��� " + loginModel.getManager_name());

		} else {
			
			uservo.setLoginType("N");
		}

		return uservo;

	}
	
	/*ȸ�� ���*/
	@Override
	public List<UserVO> UserList(UserVO uservo, HttpSession ses) throws Exception {
		
		return userDAO.UserList(uservo);
	}
	
	/*id �˻�*/
	@Override
	public UserVO find_id(String id) throws Exception {
		
		return userDAO.find_id(id);
	}
	
	/*ȸ�� �߰�*/
	public void join(UserVO uservo, HttpSession ses) throws Exception{
		
		System.out.println("(User_ServiceImpl) ȸ�� ���� �߰�");
		
		userDAO.join(uservo);
	}
	
	/*ȸ�� ���� ����*/
	@Override
	public void userModify(UserVO uservo, HttpSession ses) throws Exception {

		System.out.println("(User_ServiceImpl) ȸ�� ���� ����");

		userDAO.userModify(uservo);
	}
	
	/*ȸ�� ���� ����*/
	@Override
	public void userDelete(UserVO uservo) throws Exception {

		System.out.println("(User_ServiceImpl) ������ȣ ���� ����");
		
		userDAO.userDelete(uservo);
	}
	
}
