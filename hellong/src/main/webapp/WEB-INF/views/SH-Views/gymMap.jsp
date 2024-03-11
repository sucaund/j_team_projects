<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>geolocation으로 마커 표시하기</title>
    
</head>
<body>
<p style="margin-top:-12px">
    <b>Chrome 브라우저는 https 환경에서만 geolocation을 지원합니다.</b> 참고해주세요.
</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=119d8c360526256aaaa4b6c379b06a9a"></script>
<script>
//지도를 표시할 div===================================================
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 초기 지도의 중심좌표
        level: 10 // 지도의 확대 레벨 
    }; 
// ========================지도를 생성합니다===========================
	var map = new kakao.maps.Map(mapContainer, mapOption); 

// ======================HTML5의 geolocation으로 사용할 수 있는지 확인합니다 =====================
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
// =======================마커와 인포윈도우를 표시합니다!!!!!!!==============================
        displayMarker(locPosition, message);
    });
 
    //===================== HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다===========
} else { 
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
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
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
</script>

<script>
// 버튼 클릭 이벤트 핸들러 함수
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
</script>
<button id="btnCurrentLocation" style="position: absolute; top: 20px; left: 20px; z-index: 1;">현재 위치로 돌아가기</button>

</body>
</html>