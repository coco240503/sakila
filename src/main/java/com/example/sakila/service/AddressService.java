package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.vo.Address;

@Service
@Transactional
public class AddressService {
	@Autowired AddressMapper addressMaper;
	
	// 주소 검색
	public List<Address> getAddressListByWord(String searchAddress){
		return addressMaper.selectAddressListByWord(searchAddress);
	}
}
