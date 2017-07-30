package com.lanshiqin.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;
import org.springframework.data.repository.query.Param;

import java.util.List;

import com.lanshiqin.entity.RefuseDate;

@Mapper
public interface RefuseDateDao {
	
    @Insert("insert into refuse_date(t_name, date_s) values(#{team_name}, #{date_s});")  
    int insert(@Param("refuseDate") RefuseDate refuseDate);
    
    @Results({
		@Result(property = "team_name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "date_s", column = "date_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "id", column = "id", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from refuse_date;")
    List<RefuseDate> queryAll();
    
    @Results({
		@Result(property = "team_name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "date_s", column = "date_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "id", column = "id", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from refuse_date where t_name=#{arg0} and date_s=#{arg1};")
    List<RefuseDate> query(@Param("t_name") String t_name, @Param("date_s") String date_s);
    
    @Results({
		@Result(property = "team_name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "date_s", column = "date_s", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "id", column = "id", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from refuse_date where t_name=#{arg0};")
    List<RefuseDate> queryTeamName(@Param("t_name") String t_name);
    
    @Delete("delete from refuse_date where id=#{id};")
	void delete(@Param("id") Integer id);
}
