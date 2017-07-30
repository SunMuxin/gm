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

import com.lanshiqin.entity.Department;

@Mapper
public interface DepartmentDao {
	
    @Insert("insert into department(p_name) value(#{p_name});")  
    int insert(@Param("p_name") String name);
    

    @Delete("delete from department where id=#{id};")  
    void delete(@Param("id") Integer id);
    
    @Results({
		@Result(property = "name", column = "p_name", javaType = String.class, jdbcType = JdbcType.VARCHAR),
		@Result(property = "id", column = "id", javaType = int.class, jdbcType = JdbcType.INTEGER)})
    @Select("select * from department;")
    List<Department> queryAll();
}
