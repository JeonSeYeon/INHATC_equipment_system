package com.inhatc.system.user.dao;

import java.util.List;

import com.inhatc.system.user.vo.UserVO;

/**************************************************************************************
*
* @Class Name  : UserDao.java
* @Description : 사용자를 관리하는 DAO
*                  
* @Modification Information  
* <p>
* <b>NOTE</b>: 
* @author 전세연
* @since  2018.09.18
* @version 1.0
* @see <pre>
*  == 개정이력(Modification Information) ==
*   
*   수정일                   수정자              수정내용
*  ------------    --------    ---------------------------
*   2018.09.18      전세연              최초 생성 
*   2019.01.10 		전세연		Console 정보 수정
*   2019.01.19		전세연		회원 추가, 수정, 삭제
*   2019.01.31		전세연		주석 표시
*   2020.01.31		전세연		최종 업데이트 및 기능 추가  
* </pre> **************************************************************************************/

public interface UserDAO {

	public int login(UserVO uservo) throws Exception;

	/**
	 * INHATC System 로그인
	 * 
	 * @param UserVO - 게시판
	 * @return resultCode
	 * @throws Exception
	 */
	
	public UserVO loginInqr(UserVO uservo) throws Exception;

	 /**
    * INHATC System 로그인가능여부 
    * @param UserVO - 사용자
    * @return UserVO
    * @throws Exception 
    */
	
	public void join(UserVO uservo) throws Exception;

	 /**
     * INHATC System 회원 추가
     * @param UserVO - 사용자
     * @return resultCode
     * @throws Exception 
     */
	
	public List<UserVO> UserList(UserVO uservo) throws Exception;

	 /**
	 * INHATC System 회원 목록
	 * @param UserVO - 사용자
	 * @return List<UserVO>
	 * @throws Exception 
	 */
	
	public UserVO find_id(String id) throws Exception;

	 /**
	 * INHATC System id 검색
	 * @param UserVO - 사용자
	 * @return UserVO
	 * @throws Exception 
	 */
	
	public void userModify(UserVO uservo) throws Exception;

	 /**
	 * INHATC System 회원 정보 수정
	 * @param UserVO - 사용자
	 * @return resultCode
	 * @throws Exception 
	 */
	
	public void userDelete(UserVO uservo) throws Exception;

	 /**
	 * INHATC System 회원 정보 삭제
	 * @param UserVO - 사용자
	 * @return resultCode
	 * @throws Exception 
	 */
	
}
