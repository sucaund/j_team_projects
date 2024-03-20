<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>geolocation으로 마커 표시하기</title>
 <style type="text/css">
        .wrap * {padding: 0;margin: 0;}
        .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
        .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
        .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
        .info .close:hover {cursor: pointer;}
        .info .body {position: relative;overflow: hidden;}
        .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
        .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
        .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
        .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
        .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .info .link {color: #5085BB;}
    </style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=119d8c360526256aaaa4b6c379b06a9a&libraries=services"></script>

<body>

	<form:form commandName="searchVO" method="get" name="listForm"
		id="listForm" action="/index">
		<!-- Start Blog Singel Area -->
		<section class="section blog-single">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1 col-md-12 col-12">
						<div class="single-inner">
							<div class="post-details">
								<div class="main-content-head">

									<div class="meta-information">
										<button id="btnCurrentLocation" class="btn btn-primary" style="top: 20px; left: 20px; z-index: 1;">현재 위치로 돌아가기</button>

									</div>

									<div class="post-thumbnils">
										<div class="map_wrap">
											<div id="map"
												style="width: 700px; height: 500px; position: relative; overflow: hidden;"></div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	
	</form:form>

</body>
<script>
	document.getElementById('SearchGym').addEventListener('click', function() {
		window.location.href = '/yourControllerPath'; // 이동하고자 하는 경로
	});
</script>
<script>
	$(document).ready(
					function() {
						//지도를 표시할 div
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = { //지도초기 옵션
							center : new kakao.maps.LatLng(37.5566, 126.9404), // 초기 지도의 중심좌표
							level : 4
						// 지도의 확대 레벨 
						};
						// ============================지도를 생성합니다=========================================
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// ================지도에 마커와 인포윈도우를 표시하는 함수입니다====================
						function displayMarker(locPosition, message) {
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : locPosition
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
							kakao.maps.event.addListener(marker, 'click',
									function() {
										// 마커 위에 인포윈도우를 표시합니다
										infowindow.open(map, marker);
									});
							// 지도 중심좌표를 접속위치로 변경합니다
							map.setCenter(locPosition);
						}
						//=====================주소-좌표 변환 객체를 생성합니다==============================
						var geocoder = new kakao.maps.services.Geocoder();

						$
								.ajax({
									url : '/gyms', // 헬스장 정보를 제공하는 서버의 엔드포인트
									type : 'GET',
									dataType : 'json',
									success : function(gyms) {gyms.forEach(function(gym) {
													// 주소를 좌표로 변환
													geocoder
															.addressSearch(
																	gym.gym.g_address,
																	function(
																			result,
																			status) {
																		if (status === kakao.maps.services.Status.OK) {
																			var coords = new kakao.maps.LatLng(
																					result[0].y,
																					result[0].x);
																			//                        var message = '<div style="padding:5px;">' + gym.g_name + '</div>';
																			var imageUrl = '/upload/' + (gym.boardFiles.length > 0 ? gym.boardFiles[0].gbf_storedFileName : 'default_image.png');
																			var message = '<div class="wrap">'
																					+ '    <div class="info">'
																					+ '        <div class="title">'
																					+ gym.gym.g_name
																					+ '            <div class="close" onclick="closeOverlay()" title="닫기">1</div>'
																					+ '        </div>'
																					+ '        <div class="body">'
																					+ '           <div class="img">'
																					+ '                <img src="'+imageUrl+'">'
																					+ '           </div>' 
																					+ '            <div class="desc">'
																					+ '                <div class="ellipsis">'
																					+ gym.gym.g_address
																					+ '</div>'
																					+ '             		<div class="g_tel">'
																					+ gym.gym.g_tel
																					+ '</div>'
																					+ '                <div style="margin-top: 5px;">'
																					+ '                <div><a href="/gymPostDetail?G_id='
																					+ gym.gym.g_id
																					+ '" target="_blank" class="link">헬스장 방문하기</a></div>'
																					+ '            </div>'
																					+ '            </div>'
																					+ '        </div>'
																					+ '    </div>'
																					+ '</div>';
																			displayMarker(
																					coords,
																					message); // 변환된 좌표로 마커 표시
																		}
																	});
												});
									},
									error : function(request, status, error) {
										console.error(
												"헬스장 위치 정보를 가져오는데 실패했습니다.",
												error);
									}
								});

						// =====================현재위치 돌아가기 이벤트 함수 ====================
						document
								.getElementById('btnCurrentLocation')
								.addEventListener(
										'click',
										function() {
											if (navigator.geolocation) {
												navigator.geolocation
														.getCurrentPosition(function(
																position) {
															var lat = position.coords.latitude, // 위도
															lon = position.coords.longitude; // 경도
															var locPosition = new kakao.maps.LatLng(
																	lat, lon), // 현재 위치를 나타내는 좌표 객체 생성
															message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우 내용
															// 지도 중심을 현재 위치로 변경하고, 마커와 인포윈도우 표시
															displayMarker(
																	locPosition,
																	message);
														});
											} else {
												alert("브라우저가 Geolocation을 지원하지 않습니다.");
											}
										});
					});
</script>
<%@ include file="../footer.jsp"%>
</html>