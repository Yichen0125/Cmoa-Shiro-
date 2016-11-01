package com.besteasy.cmoa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.besteasy.cmoa.entity.Authority;
import com.besteasy.cmoa.mapper.AuthorityMapper;

@Service
public class AuthorityService {

	@Autowired
	private AuthorityMapper authorityMapper;

	@Transactional(readOnly = true)
	public List<Authority> getAll() {
		List<Authority> authorities = authorityMapper.getparents();
		for (Authority authority : authorities) {
			Long id = authority.getId();
			List<Authority> subAuthorities = authorityMapper.getSubAuthorities(id);
			authority.setSubAuthorities(subAuthorities);
		}
		return authorities;
	}
}
