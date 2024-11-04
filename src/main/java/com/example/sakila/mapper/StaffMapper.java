package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	// staff 활성화, 비활성화 - 업뎃문 하나로 모든 컬럼을 개별수정 가능하게
	int updateStaff(Staff staff);
	
	// staffList 페이징
	int selectStaffCount();
	
	// staffList
	List<Staff> selectStaffList(Map<String,Object> map);
	
	// staff 추가
	int insertStaff(Staff staff);
	
	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);
	
	// /off/login.jsp
	Staff login(Staff staff);
}
