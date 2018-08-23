<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.${projectName}.dao.${packageName}.${objectName}Dao" >
  <resultMap id="BaseResultMap" type="com.${projectName}.vo.${packageName}.${objectName}Vo" >
    <id column="ID" property="id" jdbcType="DECIMAL" />
    <#list fieldList as var>
    <result column="${var.columnName}" property="${var.reColName}" jdbcType="VARCHAR" />
		</#list>
  </resultMap>
  <!--查询字段 所有的表字段-->
  <sql id="Base_Column_List" >
   <#list fieldList as var>
    ${var.columnName},
		</#list>
  </sql>
  
  <!-- 根据参数查询列表信息 -->
  <select id="query${objectName}InfoByParam" resultMap="BaseResultMap" parameterType="com.${projectName}.param.${packageName}.${objectName}ParamVo" >
    select
    <include refid="Base_Column_List" />
    from ${tableName}
  </select>
  
  <!-- 根据ID查询列表信息 -->
  <select id="query${objectName}ById" resultMap="BaseResultMap" parameterType="java.lang.String" >
    select 
    <include refid="Base_Column_List" />
    from ${tableName}
    where ID =  ${r"#{"}id,jdbcType=DECIMAL ${r"}"}
  </select>
  
  <!-- 新增信息 -->
  <insert id="insert${objectName}" parameterType="com.${projectName}.vo.${packageName}.${objectName}Vo" >
    insert into ${tableName}
    <trim prefix="(" suffix=")" suffixOverrides="," >
      <#list fieldList as var>
	    ${var.columnName},
			</#list>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides="," >
      <#list fieldList as var>
       ${r"#{"}vo.${var.reColName},jdbcType=VARCHAR ${r"}"},
			</#list>
    </trim>
  </insert>
  
  <!-- 修改信息 -->
  <update id="update${objectName}" parameterType="com.${projectName}.vo.${packageName}.${objectName}Vo" >
    update ${tableName}
    <set >
    <#list fieldList as var>
		${r"<if"} ${r"test"}="vo.${var.reColName} != null">
    		${var.columnName} =  ${r"#{"}vo.${var.reColName},jdbcType=VARCHAR ${r"}"},
		${r"</if>"}
		</#list>
    </set>
    where ID = ${r"#{"}vo.id,jdbcType=DECIMAL${r"}"}
  </update>
  
  <!-- 根据ID删除信息 -->
  <delete id="delete${objectName}ById" parameterType="java.lang.String" >
    delete from ${tableName}
    where ID =  ${r"#{"}id,jdbcType=DECIMAL ${r"}"}
  </delete>
</mapper>