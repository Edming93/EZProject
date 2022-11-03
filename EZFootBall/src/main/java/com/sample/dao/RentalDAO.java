package com.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import com.sample.vo.FieldReservationVO;
import com.sample.vo.GameFieldInfoVO;
import com.sample.vo.GlistVO;

@Mapper
public interface RentalDAO {

	public List<GlistVO> rvListAll(GlistVO vo);

	public List<GlistVO> selectTime(GlistVO vo);

	@MapKey("fieldCode")
	public GameFieldInfoVO fieldInfo(int fieldCode);

	public GlistVO matchInfo(int fieldCode);

	public void insertFieldReservation(FieldReservationVO vo);
	
	public List<GlistVO> rvListSelect(GlistVO vo);

	// 마이페이지 구장예약 리스트 불러오기
	public List<FieldReservationVO> getFieldReservation(int userCode);
	
	// 예약테이블 등록시 유효성검사
	public int rvCheck(FieldReservationVO vo);
	
	public void insertRvInGameList(GlistVO vo);
	
	// -------------------- 관리자 구장관리 ---------------------
	public List<GameFieldInfoVO> getFieldListAll();
	
	public GameFieldInfoVO selectFieldData(String fieldCode);
	
	public void deleteSeleteField(String fieldCode);
	
	public String selectFieldImage(String fieldCode);
}
