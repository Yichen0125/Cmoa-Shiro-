package com.besteasy.cmoa.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.besteasy.cmoa.mapper.BaseMapper;
import com.besteasy.cmoa.orm.Page;
import com.besteasy.cmoa.orm.PropertyFilter;
import com.besteasy.cmoa.orm.PropertyFilter.MatchType;

public class BaseService<T> {

	@Autowired
	private BaseMapper<T> mapper;

	@Transactional(readOnly = true)
	public Page<T> getPage(int pageNo, Map<String, Object> params) {
		Page<T> page = new Page<>();
		page.setPageNo(pageNo);

		// 1. 获取总的记录数
		// 1.1 把传入的 params 转为 PropertyFilter 的集合
		List<PropertyFilter> filters = parseHandlerParamsToPropertyFilters(params);
		// 1.2 把 RropertyFilter 的集合转为 mybatis 可用的 params
		Map<String, Object> mybatisParams = parsePropertyFiltersToMyBatisParmas(filters);

		long totalElements = mapper.getTotalElements(mybatisParams);
		page.setTotalElements((int) totalElements);

		// 2. 获取当前页面的 List
		int fromIndex = (page.getPageNo() - 1) * page.getPageSize() + 1;
		int endIndex = page.getPageSize() + fromIndex;
		mybatisParams.put("fromIndex", fromIndex);
		mybatisParams.put("endIndex", endIndex);

		List<T> content = mapper.getContent(mybatisParams);
		page.setContent(content);

		// 3. 组装 Page 并返回
		return page;
	}

	static {
		DateConverter dateConverter = new DateConverter();
		dateConverter.setPatterns(new String[] { "yyyy-MM-dd", "yyyy-MM-dd hh:mm:ss" });
		ConvertUtils.register(dateConverter, Date.class);
	}

	private Map<String, Object> parsePropertyFiltersToMyBatisParmas(List<PropertyFilter> filters) {
		Map<String, Object> params = new HashMap<String, Object>();
		for (PropertyFilter filter : filters) {
			String propertyName = filter.getPropertyName();

			Object propertyVal = filter.getPropertyVal();
			Class propertyType = filter.getPropertyType();
			propertyVal = ConvertUtils.convert(propertyVal, propertyType);

			MatchType matchType = filter.getMatchType();
			if (matchType == MatchType.LIKE) {
				propertyVal = "%" + propertyVal + "%";
			}

			params.put(propertyName, propertyVal);
		}

		return params;
	}

	private List<PropertyFilter> parseHandlerParamsToPropertyFilters(Map<String, Object> params) {
		List<PropertyFilter> filters = new ArrayList<>();

		for (Map.Entry<String, Object> entry : params.entrySet()) {
			String fieldName = entry.getKey();
			Object fieldVal = entry.getValue();

			PropertyFilter filter = new PropertyFilter(fieldName, fieldVal);
			filters.add(filter);
		}

		return filters;
	}
}
