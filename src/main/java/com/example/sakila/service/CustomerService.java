package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	// /on/customerOne
	public Map<String, Object> getCustomerOne(Integer customerId) {
		return customerMapper.selectCustomerOne(customerId);
	}
	
	// /on/ customer 이름검색
	public List<Customer> getCustomerListByName(String searchName){
		return customerMapper.selectCustomerListByName(searchName);
	}
	
	// /on/customerList
	public Map<String,Object> getCustomerList(Integer currentPage, Integer rowPerPage){
		Integer beginRow = (currentPage-1)*rowPerPage;
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		// 첫번째 페이지 넘버
		Integer startPagingNum = (currentPage-1)/10*10+1; // '/'=몫
		// 한페이지당 페이징개수 = 10
		Integer numPerPage = 10;
		// 마지막 페이지 넘버
		Integer endPagingNum = startPagingNum+(numPerPage-1); // 1~10, 11~20
		// 마지막은 x1~마지막페이지 (98 -> 91~98)
		Integer lastPage = this.getLastPage(rowPerPage);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		
		List<Customer> customerList = customerMapper.selectCustomerList(paramMap);
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("customerList", customerList);
		return resultMap;
	}
	// customerList 페이징
	public Integer getLastPage(Integer rowPerPage) {
		int count = customerMapper.selectCustomerCount();
		int lastPage = count / rowPerPage;
		if(count%rowPerPage != 0) {
			lastPage ++;
		}
		return lastPage;
	}
	
	// /on/addCustomer
	public Integer addCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}
}
