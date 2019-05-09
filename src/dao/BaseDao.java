package dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class BaseDao extends SqlMapClientDaoSupport{
	public void save(String sqlid,Object obj){
		getSqlMapClientTemplate().insert(sqlid,obj);
	}
	public void delete(String sqlid,Object obj){
		getSqlMapClientTemplate().delete(sqlid,obj);
	}
	public void update(String sqlid,Object obj){
		getSqlMapClientTemplate().update(sqlid,obj);
	}
	public Object findById(String sqlid,int pk){
		return getSqlMapClientTemplate().queryForObject(sqlid,pk);
	}
	public List all(String sqlid,Object obj){
		return getSqlMapClientTemplate().queryForList(sqlid,obj);
	}
}
