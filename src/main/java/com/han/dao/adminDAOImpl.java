package com.han.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.han.vo.CategoryVO;

@Repository
public class adminDAOImpl implements adminDAO {
	
	@Inject
	private SqlSession sql;
	
	// 매퍼
	private static String namespace = "com.han.mappers.adminMapper";
	
	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return sql.selectList(namespace + ".category");
	}
	

}
