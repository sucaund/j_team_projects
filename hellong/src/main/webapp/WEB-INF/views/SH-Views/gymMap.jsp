<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>geolocation으로 마커 표시하기</title>
    
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=119d8c360526256aaaa4b6c379b06a9a&libraries=services"></script>

<body>

<form:form commandName="searchVO" method="get" name="listForm" id="listForm" action="/index">
<div>
    <button type="button"  id="SearchGym" class="btn btn-primary">헬스장 상세 검색</button>
</div><br>
 
 <button id="btnCurrentLocation" style=" top: 20px; left: 20px; z-index: 1;">현재 위치로 돌아가기</button>
 
<div>
      <div class="map_wrap">
        <div id="map" style="width:50%;height:50%;position:relative;overflow:hidden;"></div> 
    </div>
</div>
</form:form>

</body>
<script>
    document.getElementById('SearchGym').addEventListener('click', function() {
        window.location.href = '/yourControllerPath'; // 이동하고자 하는 경로
    });
</script>
<script>
$(document).ready(function() {
//지도를 표시할 div
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { //지도초기 옵션
        center: new kakao.maps.LatLng(37.5566, 126.9404), // 초기 지도의 중심좌표
        level: 4 // 지도의 확대 레벨 
    }; 
// ============================지도를 생성합니다=========================================
	var map = new kakao.maps.Map(mapContainer, mapOption); 

// ================지도에 마커와 인포윈도우를 표시하는 함수입니다====================
	function displayMarker(locPosition, message) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    // 인포윈도우를 마커위에 표시합니다 
	    //infowindow.open(map, marker);
	        // 마커에 클릭 이벤트를 등록합니다
   		 kakao.maps.event.addListener(marker, 'click', function() {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, marker);  
    	});
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}    
	//=====================주소-좌표 변환 객체를 생성합니다==============================
	var geocoder = new kakao.maps.services.Geocoder();
	
	$.ajax({
        url: '/gyms', // 헬스장 정보를 제공하는 서버의 엔드포인트
        type: 'GET',
        dataType: 'json',
        success: function(gyms) {
            gyms.forEach(function(gym) {
                // 주소를 좌표로 변환
                geocoder.addressSearch(gym.g_address, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
//                        var message = '<div style="padding:5px;">' + gym.g_name + '</div>';
                        var imageUrl = '/upload/' + gym.gb_video;
                        var message = '<div class="wrap">' + 
                        '    <div class="info">' + 
                        '        <div class="title">' + gym.g_name + 
                        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                        '        </div>' + 
                        '        <div class="body">' + 
                        '            <div class="img">' +
                        '                <img src="'+imageUrl+'" width="300" height="70">' +
                        '           </div>' + 
                        '            <div class="desc">' + 
                        '                <div class="ellipsis">'+gym.g_address+'</div>' + 
                        '             		<div class="g_tel">'+gym.g_tel+'</div>' + 
                        '                <div><a href="/gymPostDetail?G_id='+gym.g_id+'" target="_blank" class="link">헬스장 방문하기</a></div>' + 
                        '            </div>' + 
                        '        </div>' + 
                        '    </div>' +    
                        '</div>';
                        displayMarker(coords, message); // 변환된 좌표로 마커 표시
                    }
                });
            });
        },
        error: function(request, status, error) {
            console.error("헬스장 위치 정보를 가져오는데 실패했습니다.", error);
        }
    });


// =====================현재위치 돌아가기 이벤트 함수 ====================
document.getElementById('btnCurrentLocation').addEventListener('click', function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            var locPosition = new kakao.maps.LatLng(lat, lon), // 현재 위치를 나타내는 좌표 객체 생성
                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우 내용
            // 지도 중심을 현재 위치로 변경하고, 마커와 인포윈도우 표시
            displayMarker(locPosition, message);
        });
    } else {
        alert("브라우저가 Geolocation을 지원하지 않습니다.");
    }
	});
});


</script>
</html>