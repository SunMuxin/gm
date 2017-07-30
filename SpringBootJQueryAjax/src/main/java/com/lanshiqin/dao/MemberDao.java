package com.lanshiqin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;
import org.springframework.data.repository.query.Param;

import com.lanshiqin.entity.Member;

@Mapper
public interface MemberDao {
	
    @Insert("insert into member(email, m_name, t_name, tel_phone, department"
    		+ ") values(#{email}, #{name}, #{team_name}, #{phone}, #{department});")  
    int insert(@Param("member") Member member);
    
    @Results({
		@Result(property = "name", column = "m_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "team_name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "email", column = "email", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "phone", column = "tel_phone", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department", column = "department", javaType = String.class, jdbcType = JdbcType.VARCHAR)})
    @Select("select * from member where t_name=#{arg0};")  
    List<Member> query(@Param("team_name") String team_name);
    
    @Results({
		@Result(property = "name", column = "m_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "team_name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "email", column = "email", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "phone", column = "tel_phone", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department", column = "department", javaType = String.class, jdbcType = JdbcType.VARCHAR)})
    @Select("select * from member;")  
    List<Member> queryAll();
}
