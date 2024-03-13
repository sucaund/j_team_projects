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
	
	// 헬스장 이름 선택 시 이용중인 헬스장 서비스 목록 제공
	$(document).ready(function() {
	    $("#selectedGym").change(function() {
	        var selectedGymId = $(this).val();
	        var m_number = ${memberData.m_number};
	    
	        $.ajax({
	            type: "GET",
	            url: "hsGetServicesByGymId",
	            data: {g_id: selectedGymId, m_number: m_number},
	            dataType: "json",
	            success: function(data) {
	                var options = "";
	                for (var i = 0; i < data.length; i++) {
	                    options += "<option value='" + data[i].s_number + "," + data[i].sd_number + "," + data[i].m_number + "'>" + data[i].rl_s_name + "</option>";
	                }
	                $("#selectedGymService").html(options);
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.log("Error: " + textStatus + " - " + errorThrown);
	            }
	        });
	    });
	    
	    // 헬스장 서비스명 선택 시 환불금액 정보 제공
	  	$("#selectedGymService").change(function() {
			var selectedGymId = $("#selectedGym").val();
	        var selectedService = $(this).val().split(",");
	        var s_number = selectedService[0];
	        var sd_number = selectedService[1];
	        var m_number = selectedService[2];
	        
	        $.ajax({
	            type: "GET",
	            url: "hsGetRefundData",
	            data: {g_id: selectedGymId, s_number: s_number, sd_number: sd_number, m_number: m_number},
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

	// 환불 버튼 클릭 시 controller에 제공할 정보
	function sendParamsValues() {
		var g_id = $("#selectedGym").val();
	    var selectedService = $("#selectedGymService").val().split(",");
	    var s_number = selectedService[0];
	    var sd_number = selectedService[1];
	    var m_number = selectedService[2];
	
	    $("#g_id").val(g_id);
	    $("#s_number").val(s_number);
	    $("#sd_number").val(sd_number);
	    $("#m_number").val(m_number);
	    
	    $.ajax({
	        type: "GET",
	        url: "hsGetRefundData",
	        data: {g_id: g_id, s_number: s_number, sd_number: sd_number, m_number: m_number},
	        dataType: "json",
	        success: function(data) {
	            $("#refund_point").val(data.refund_point);
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log("Error: " + textStatus + " - " + errorThrown);
	        }
	    });
	}
	
</script>
</head>
<body>
	<h1> 헬스장 환불 페이지 </h1>
	<form action="hsRefundUsingGym" method="post" onsubmit="sendParamsValues()">
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