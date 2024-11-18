package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {	
	// /on/customerList
	List<Customer> selectCustomerList(Map<String,Object> paramMap);
	
	// customerList 페이징
	Integer selectCustomerCount();
	
	// /on/addCustomer
	Integer insertCustomer(Customer customer);
}
