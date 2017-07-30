package com.lanshiqin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import com.lanshiqin.entity.Group;

@Mapper
public interface GroupDao {
	
    @Insert("insert into group_n(t_name, group_s) value(#{arg0}, #{arg1});")  
    int insert(String name, int group_s);
    
    @Results({
		@Result(property = "name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "group_s", column = "group_s", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from group_n;")
    List<Group> queryAll();
    
    @Results({
		@Result(property = "name", column = "t_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "group_s", column = "group_s", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from group_n where t_name=#{arg0};")
    List<Group> query(String name);
    
    @Delete("delete from group_n;")
    void delete();
}
