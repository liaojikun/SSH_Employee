<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.table1 {
	border: 1px solid #ddd;
	width: 900px;
}

thead {
	background-color: lightblue;
}
</style>
</head>
<body>
	<table border="0" width="900px">
		<tr>
			<td align="center" style="font-size: 24px; color: #666"><s:text name="staff_manage"/></td>
		</tr>
		<tr>
			<td align="right">
			      <a href="employee_saveUI.action"><s:text name="add"/></a>
			</td>
		</tr>
	</table>
	<br />
	<table cellspacing="0" border="1" class="table1">
		<thead>
			<tr>
				<th width="300"><s:text name="staff_no"/></th>
				<th width="300"><s:text name="staff_name"/></th>
				<th width="100"><s:text name="staff_sex"/></th>
				<th width="500"><s:text name="staff_birthday"/></th>
				<th width="500"><s:text name="staff_join_data"/></th>
				<th width="300"><s:text name="staff_in_department"/></th>
				<th width="300"><s:text name="edit"/></th>
				<th width="300"><s:text name="delete"/></th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="list" var="e">
				<tr>
					<td align="center"><s:property value="#e.eno" /></td>
					<td align="center"><s:property value="#e.ename" /></td>
					<td align="center"><s:property value="#e.sex" /></td>
					<td align="center"><s:date format="yyyy-MM-dd" name="#e.birthday" /></td>
					<td align="center"><s:date name="#e.joinDate" format="yyyy-MM-dd" /></td>
					<td align="center"><s:property value="#e.department.dname" /></td>
					<td align="center">
					    <a href="${ pageContext.request.contextPath }/employee_edit.action?eid=<s:property value="#e.eid"/>">
					       <img src="${ pageContext.request.contextPath }/images/编辑.png" />
					    </a>
					</td>
					<td align="center">
					    <a href="employee_delete.action?eid=<s:property value="#e.eid"/>">
					       <img src="${ pageContext.request.contextPath }/images/trash.gif" />
					    </a>
					</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<br/>
	<table border="0" cellspacing="0" cellpadding="0" width="900px">
		<tr>
			<td align="right">
			<span>
			     <s:text name="no"/><s:property value="currPage" />/<s:property value="totalPage" /><s:text name="page"/>
			</span>
			&nbsp;&nbsp; 
			<span>
			    <s:text name="total_Count"/>：<s:property value="totalCount" />&nbsp;&nbsp;
			    <s:text name="page_size"/>:<s:property value="pageSize" /></span>&nbsp;&nbsp; 
			<span>
			   <s:if test="currPage != 1">
					<a href="employee_findAll.action?currPage=1">[<s:text name="first_page"/>]</a>&nbsp;&nbsp;
                    <a href="employee_findAll.action?currPage=<s:property value="currPage-1"/>">[<s:text name="before_page"/>]</a>&nbsp;&nbsp;
               </s:if> 
               <s:if test="currPage != totalPage">
					<a href="employee_findAll.action?currPage=<s:property value="currPage+1"/>">[<s:text name="next_page"/>]</a>&nbsp;&nbsp;
                    <a href="employee_findAll.action?currPage=<s:property value="pageSize"/>">[<s:text name="last_page"/>]</a>&nbsp;&nbsp;
               </s:if> 
            </span>
            </td>
		</tr>
	</table>
</body>
</html>