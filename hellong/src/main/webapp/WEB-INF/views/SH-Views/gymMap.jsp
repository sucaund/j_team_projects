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
<form:form commandName="searchVO" method="get" name="listForm" id="listForm" action="/">
 
<div>
    <input type="text" class="text" id="searchWrd" name="searchWrd" placeholder="검색어를 입력해주세요" style="width: 300px;" value="${searchVO.searchWrd }" /> 
    <a href="#" onclick="fn_search();"    class="btn-login" style="width: 100px; height: 40px; margin-left: 5px;">"검색"</a>
</div>
 
 
<div>
      <div class="map_wrap">
        <div id="map" style="width:50%;height:50%;position:relative;overflow:hidden;"></div> 
    </div>
</div>
 
</form:form>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=119d8c360526256aaaa4b6c379b06a9a"></script>
<script>
//지도를 표시할 div
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { //지도초기 옵션
        center: new kakao.maps.LatLng(37.5566, 126.9404), // 초기 지도의 중심좌표
        level: 4 // 지도의 확대 레벨 
    }; 
// ============================지도를 생성합니다=========================================
	var map = new kakao.maps.Map(mapContainer, mapOption); 


//=====================주소-좌표 변환 객체를 생성합니다==============================
	var geocoder = new kakao.maps.services.Geocoder();
//===============================주소 리스트======================================
	rdnmadrList.forEach(function(addr, index){
	    
		// 주소로 좌표를 검색합니다
	    geocoder.addressSearch(addr, function(result, status) {
	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	    
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	            
	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords
	            });
	            
	            var content = '<div class="overlay_info">';
	            content += '    <a><strong>' + cmpnmList[index] +'</strong></a>';
	            content += '    <div class="desc">';
	            content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
	            content += '        <span class="address">'+ rdnmadrList[index]  +'</span>';
	            content += '    </div>';
	            content += '</div>';
	    
	            // 인포윈도우로 장소에 대한 설명을 표시합니다
	            var infowindow = new kakao.maps.InfoWindow({
	                //  content: cmpnmList[index], 
	                content: content,
	                   disableAutoPan: true
	            });
	            infowindow.open(map, marker);
	    
	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            if(index == 0){
	                map.setCenter(coords);    
	            }
	        } 
	    });    
	}); 


//==========================현재위치======================================
// geolocation으로 사용할 수 있는지 확인
if (navigator.geolocation) {
// GeoLocation을 이용해서 접속 위치를 얻어
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

//==============================다른 헬스장 표시===============================
	
	

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '영화관', 
        latlng: new kakao.maps.LatLng(37.5566, 126.9404)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>


<button id="btnCurrentLocation" style="position: absolute; top: 20px; left: 20px; z-index: 1;">현재 위치로 돌아가기</button>

</body>
<script>
// 현재위치 돌아가기 이벤트 함수 
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