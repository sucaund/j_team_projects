<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function getListDept() {
		console.log("getListDept Run");
		// alert("getListDept Run...");  
		var str  = "";
		var str2 = "";
		$.ajax(
			{
				url:"/sendVO3",
				dataType:'json',
				success:function(dept){
					var jsonStr = JSON.stringify(dept);
					alert("jsonStr->"+jsonStr);
					$('#dept_list_str').append(jsonStr);  
					str  += "<select name='dept'>";
					$(dept).each(
						function(){
							str2 = "<option value='"+this.deptno + "'> "+this.dname+"</option>"; 
							str += str2 ;
						}	
					)
					str += "</select><p>"
					alert("combobox str->"+str);
					$('#dept_list_combobox').append(str);
				}
					
			}
		);		

	}

	function getDeptDelete(pIndex)  {
		var selEmpno =   $("#empno"+pIndex).val();
		var selEname =   $("#ename"+pIndex).val();

		// alert("getDeptDelete selEmpno->"+selEmpno); 
		
		$.ajax(
				  {
						url:"/empnoDelete",
						data:{  empno : selEmpno 
							  , ename : selEname
							 },
						dataType:'text',
						success:function(data){
							alert(".ajax getDeptDelete data->"+data); 
							if (data == '1') {
								// 성공하면 아래라인 수행 
								$('#emp'+pIndex).remove();     /*  Delete Tag */
							}
						}
				 }
			   );		
	}

	


</script>
</head>
<body>
	<h2>회원 정보</h2>
	<table>
		<tr><th>번호</th><th>사번</th><th>이름</th><th>업무</th><th>부서</th></tr>
	 	<c:forEach var="emp" items="${listEmp}" varStatus="status">
			<tr id="emp${status.index}"><td>emp${status.index}</td>
		     	
			    <td>
			        <input type="hidden" id="deptno${status.index}" value="${emp.deptno }">
			        <input type="text" id="empno${status.index}" value="${emp.empno }">${emp.empno }</td>
			    <td><input type="text" id="ename${status.index}" value="${emp.ename }">${emp.ename }</td>
				<td>${emp.job }</td><td>${emp.deptno } 
				    <input type="button" id="btn_idCheck2" value="사원 Row Delete" onclick="getDeptDelete(${status.index})">
				</td>
			</tr>    
	     
	     </c:forEach>
	
	
	</table>

    RestController LISTVO3: <input type="button" id="btn_Dept3"
                                   value="부서명 LIST"  
                                   onclick="getListDept()"><p>
                                   
	dept_list_str:	<div id="dept_list_str"></div>

	dept_list_combobox:
	<div id="dept_list_combobox"></div>
	
	<h1>The End </h1>
</body>
</html>