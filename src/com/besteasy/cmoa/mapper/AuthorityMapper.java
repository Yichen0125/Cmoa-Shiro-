package com.besteasy.cmoa.mapper;

import java.util.List;

import com.besteasy.cmoa.entity.Authority;

public interface AuthorityMapper {

	List<Authority> getparents();

	List<Authority> getSubAuthorities(Long id);

}
