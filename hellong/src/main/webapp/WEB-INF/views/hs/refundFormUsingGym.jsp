<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
	    $("#selectedGym").change(function() {
	        var selectedGymId = $(this).val();
	        var m_number = ${memberData.m_number};
	    
	        $.ajax({
	            type: "GET",
	            url: "hsGetServicesByGymId",
	            data: {gymId: selectedGymId, m_number: m_number},
	            dataType: "json",
	            success: function(data) {
	                var options = "";
	                for (var i = 0; i < data.length; i++) {
	                    options += "<option value='" + data[i].s_number + "," + data[i].s_detail + "," + data[i].m_number + "'>" + data[i].rl_s_name + "</option>";
	                }
	                $("#selectedGymService").html(options);
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.log("Error: " + textStatus + " - " + errorThrown);
	            }
	        });
	    });
	    
	  	$("#selectedGymService").change(function() {
			var selectedGymId = $("#selectedGym").val();
	        var selectedService = $(this).val().split(",");
	        var s_number = selectedService[0];
	        var s_detail = selectedService[1];
	        var m_number = selectedService[2];
	        
	        $.ajax({
	            type: "GET",
	            url: "hsGetRefundPrice",
	            data: {gymId: selectedGymId, s_number: s_number, s_detail: s_detail, m_number: m_number},
	            dataType: "json",
	            success: function(data) {
	                $("#refundPrice").text(data.refund_point);
	                $("#refundCriteria").text(data.refund_criteria);
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.log("Error: " + textStatus + " - " + errorThrown);
	            }
	        });
	    });
	});
	

</script>


</head>
<body>
	<h1> 헬스장 환불 페이지 </h1>
	<form action="hsRefundListUsingGym?m_number=${memberData.m_number}" method="post">
	<h3>헬스장 이름: 
		<select id="selectedGym" name="selectedGym">

			<c:forEach var="gymName" items="${listGymName }">
					<option value="${gymName.g_id }">${gymName.g_name }</option>
			</c:forEach>
		</select>
	</h3>
	<h3>헬스장 서비스:
		<select id="selectedGymService" name="selectedGymService">
		</select>
	</h3>
	<h3> 회원 아이디: ${memberData.m_name } (${memberData.m_number})</h3>
	<h3> 환불 금액: 
		<span id="refundPrice"></span> (<span id="refundCriteria"></span>)
	</h3>
	<input type="submit" value="Submit">
	</form>
	
		
</body>
</html>
