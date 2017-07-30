package com.lanshiqin.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;
import org.springframework.data.repository.query.Param;

import java.util.List;

import com.lanshiqin.entity.Team;

@Mapper
public interface TeamDao {
	
    @Insert("insert into team(t_name, t_password, department, user_type) values(#{name}, #{password}, #{department}, #{type});")  
    int insert(@Param("t_team") Team team);
    
    @Results({
		@Result(property = "name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "password", column = "t_password", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department", column = "department", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "type", column = "user_type", javaType = String.class, jdbcType = JdbcType.VARCHAR)})
    @Select("select * from team;")
    List<Team> queryAll();
    
    @Results({
		@Result(property = "name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "password", column = "t_password", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department", column = "department", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "type", column = "user_type", javaType = String.class, jdbcType = JdbcType.VARCHAR)})
    @Select("select * from team where t_name=#{arg0} and t_password=#{arg1};")  
    List<Team> query(@Param("t_name") String name, @Param("t_password") String password);
}
