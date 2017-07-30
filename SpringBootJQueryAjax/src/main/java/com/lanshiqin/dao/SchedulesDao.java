package com.lanshiqin.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import java.util.List;

import com.lanshiqin.entity.Schedule;

@Mapper
public interface SchedulesDao {
	
    @Insert("insert into schedule(date_s, team_f, team_s, department_f, department_s, group_s) "
    		+ "values(#{arg0}, #{arg1}, #{arg2}, #{arg3}, #{arg4}, #{arg5});")  
    int insert(String date_s, 
    		String team_f, 
    		String team_s, 
    		String department_f, 
    		String department_s, 
    		int group_s);
    
    @Delete("delete from schedule where group_s=#{arg0};")
    void delete(int group);
    
    @Results({
		@Result(property = "team_f", column = "team_f", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "team_s", column = "team_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department_f", column = "department_f", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department_s", column = "department_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "date_s", column = "date_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "group_s", column = "group_s", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from schedule where group_s=#{arg0} ORDER BY date_s asc;")
    List<Schedule> query(int group);
    
    @Results({
		@Result(property = "team_f", column = "team_f", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "team_s", column = "team_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department_f", column = "department_f", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department_s", column = "department_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "date_s", column = "date_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "group_s", column = "group_s", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from schedule ORDER BY date_s asc;")
    List<Schedule> queryAll();
    
    @Results({
		@Result(property = "team_f", column = "team_f", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "team_s", column = "team_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department_f", column = "department_f", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "department_s", column = "department_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "date_s", column = "date_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "group_s", column = "group_s", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from schedule where team_f=#{arg0} or team_s=#{arg0} ORDER BY date_s asc;")
    List<Schedule> queryTeamName(String team_name);
}
