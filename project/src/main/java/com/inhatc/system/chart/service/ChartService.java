package com.inhatc.system.chart.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;

import com.inhatc.system.chart.vo.ChartVO;




/**************************************************************************************
 *
 * @Class Name  : MemberService.java
 * @Description : ����� ����
 *                  
 * @Modification Information  
 * <p>
 * <b>NOTE</b>: 
 * @author �����
 * @since  2017.09.18
 * @version 1.0
 * @see <pre>
 *  == �����̷�(Modification Information) ==
 *   
 *   ������                   ������              ��������
 *  ------------    --------    ---------------------------
 *   2017.09.18     �����              ���� ���� 
 * 
 * </pre> **************************************************************************************/


@Transactional
public interface ChartService {
 
    /**
     * INHATC MALL ����� ��� , ����
     * @param SysUserModel - �����
     * @return None
     * @throws Exception 
     */
	
	public List<ChartVO> getChartData(ChartVO chartvo)throws Exception;

	public List<Map<String, Object>> getChartData2(ChartVO chartvo);

	
}
