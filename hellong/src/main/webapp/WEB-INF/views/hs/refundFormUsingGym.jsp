<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
	        var g_id= $(this).val();
	        var m_number = ${memberData.m_number};
	    
	        $.ajax({
	            type: "GET",
	            url: "hsGetServicesByGymId",
	            data: {g_id: g_id, m_number: m_number},
	            dataType: "json",
	            success: function(data) {
	                var options = "";
	                for (var i = 0; i < data.length; i++) {
	                    options += "<option value='" + data[i].s_number + "," + data[i].sd_number + "," + data[i].m_number + "," + data[i].go_number + "'>" + data[i].rl_s_name + "</option>";
	                }
	                $("#selectedGymService").html(options);
	                
	                // sub ajax (처음에 헬스장이름 선택 시 클릭안해도 바로 환불금액이 나올 수 있게)
	    	        $.ajax({
	    	            type: "GET",
	    	            url: "hsGetFirstRefundData",
	    	            data: {g_id: g_id, 
	    	            	   s_number: data[0].s_number, 
	    	            	   sd_number: data[0].sd_number, 
	    	            	   m_number: m_number, 
	    	            	   go_number: data[0].go_number},
	    	            dataType: "json",
	    	            success: function(data) {
    	            	   $("#refundPrice").text(data.refund_point);
    		               $("#refundCriteria").text(data.refund_criteria);
	    	            },
	    	            error: function(jqXHR, textStatus, errorThrown) {
	    	                console.log("Error: " + textStatus + " - " + errorThrown);
	    	            }
	    	        });
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.log("Error: " + textStatus + " - " + errorThrown);
	            }
	        });
	    });
	    
	    // 헬스장 서비스명 선택 시 환불금액 정보 제공
	  	$("#selectedGymService").change(function() {
			var g_id = $("#selectedGym").val();
	        var selectedService = $(this).val().split(",");
	        var s_number = selectedService[0];
	        var sd_number = selectedService[1];
	        var m_number = selectedService[2];
	        var go_number = selectedService[3];
	        
	        $.ajax({
	            type: "GET",
	            url: "hsGetRefundData",
	            data: {g_id: g_id, 
	            	   s_number: s_number, 
	            	   sd_number: sd_number, 
	            	   m_number: m_number, 
	            	   go_number: go_number},
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
	    
		$("#sendParamsValues").submit(function(event) {
			event.preventDefault();
			var g_id = $("#selectedGym").val();
			var selectedService = $("#selectedGymService").val().split(",");
			var s_number = selectedService[0];
			var sd_number = selectedService[1];
			var m_number = selectedService[2];
			var go_number = selectedService[3];
			var refund_point = $("#refundPrice").text();
			var refund_criteria = $("#refundCriteria").text();

			$.ajax({
				type: "GET",
				url: "hsRefundUsingGym",
				data: {
					g_id: g_id,
					s_number: s_number,
					sd_number: sd_number,
					m_number: m_number,
					go_number: go_number,
					refund_point: refund_point,
					refund_criteria: refund_criteria
				},
				success: function(response) {
					console.log(g_id + " & " + s_number + " & " + sd_number + " & " + m_number + " & " + refund_point + " & " + refund_criteria);
					alert("환불이 완료되었습니다.");
					window.location.href = "hsMemberIndex?m_number=" + m_number;
					
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

    <!-- 상단 시작 -->
    <div class="breadcrumbs">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="breadcrumbs-content">
                <h1 class="page-title">환불</h1>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
              <ul class="breadcrumb-nav">
                <li>
                  <a href="/hsListChargePoint"><i class="lni lni-home"></i>포인트 관리</a>
                </li>
                <li>환불</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- 상단 끝 -->
    
      <c:if test="${m_number==null}">
        <div class="account-login section">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
              <form class="card login-form" method="get" id="login" action="jmLogin">
                <div class="card-body">
                  <div class="title">
                    <h3>로그인된 회원만 접근할 수 있습니다.</h3>
                    <p><c:if test="${msg!=null}">${msg}</c:if></p>
                  </div>
        
                  <div class="button">
                    <button class="btn" type="submit" form="logout">로그인</button>
                  </div>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
          </div>
          </c:if> 
    
          <c:if test="${m_number!=null}">
        <div class="account-login section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                        <div class="register-form"> 
                            <div class="card-body">
                                <form id="sendParamsValues" action="hsRefundUsingGym" method="POST">
                                <div class="title">
                                    <h3>환불하기</h3>
                                    <br>
                                    환불할 헬스장: <a style="color: black;">
                                        <select id="selectedGym" name="selectedGym">
                                            <c:forEach var="gymName" items="${listGymName }">
                                                    <option value="${gymName.g_id }">${gymName.g_name }</option>
                                            </c:forEach>
                                        </select>
                                                </a><br><br>
                                    서비스: <a style="color: black;">
                                        <select id="selectedGymService" name="selectedGymService">
                                        </select>
                                            </a><br><br>
                                아이디: <a style="color: black;">
                                    ${memberData.m_name } (${memberData.m_number})
                                        </a><br><br>
                                    환불 금액: <a style="color: #0167F3;"><span id="refundPrice"></span> (<span id="refundCriteria"></span>)</a><br>
                                </div>
                                <div class="button">
                                <!-- <input type="submit" value="환불"> -->
                                <button class="btn" type="submit" form="sendParamsValues">환불</button>
                                </div>
                                </form>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
      
    </c:if>   

	
	
</body>
</html>