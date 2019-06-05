<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page errorPage = "error/errorpage.jsp" %>
<html>

<head>
<meta charset="UTF-8">
<title>두근두근 데이트</title>
<link rel="stylesheet" type="text/css" href="./style/menu.css" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d9fa66b5a57ed1782dfb50131b06dfd"></script>
<%@include file="f_loaddata.jsp"%>
<%! Double rslo = 0.0;
		Double rsla = 0.0;
		Double rs2lo = 0.0;
		Double rs2la = 0.0;
		String shopname = "";
		String category = "";
		int filter_size = 0;
		String[] categoryAll = {"c_food", "c_smallshop", "c_build", "c_service", "c_educate", "c_visit", "c_medical", "c_tour"};%>
<script>
		var markers = [];
		window.onload = function () {
		}
		function bt_shop_over_event(map, latitude, longtitude) {
			var sLatitude = latitude;
			var sLongtitude = longtitude;
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
				imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
				imageOption = { offset: new daum.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
				markerPosition = new daum.maps.LatLng(sLatitude, sLongtitude); // 마커가 표시될 위치입니다

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position: markerPosition,
				image: markerImage // 마커이미지 설정 
			});

			marker.setMap(map);
			markers.push(marker);
		}
		function setMarkers(map) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}
		function hideMarkers() {
			setMarkers(null);
		}
		function makeButton(ct, sn, map, la, lo){
			var jbBtn = document.createElement('input');
			jbBtn.type = 'button';
			jbBtn.value = "<" + ct +"> " + sn;
			jbBtn.id = "shopInfo";
			jbBtn.addEventListener("mouseover", function () {
				bt_shop_over_event(map, la, lo);
			}, false);
			jbBtn.addEventListener("mouseout", hideMarkers);

			document.body.appendChild(jbBtn);
		}
		function settingMap() {
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(<%= mLatitude %>, <%= mLongtitude %>),
				level: 3
			};
			var map = new daum.maps.Map(container, options);
			<% while (rs.next()) {
					rs2lo = Double.parseDouble(rs.getString("longtitude"));
					rs2la = Double.parseDouble(rs.getString("latitude"));
					shopname = rs.getString("shopname");
					category = rs.getString("bigname");%>
					var rcLocation = new daum.maps.LatLng(<%= rs2la %>, <%= rs2lo %>);
					var mkLocation = new daum.maps.Marker(
						{
							position: rcLocation
						}
					);
					mkLocation.setMap(map);
					
					<%if(categoryList != null){
						filter_size =categoryList.length;%>
						console.log("<%=filter_size%>");
						<%for(int val= 0; val < filter_size; val++){
							String aaaa = categoryList[val];
									if(aaaa.equals("c_food")){%>
										if("<%=category%>" == "음식"){
											console.log("들어옴");
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
											}
										<%
										}
									else if(aaaa.equals("c_smallshop")){%>
										
										if("<%=category%>" == "소매"){
											console.log("들어옴");
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
											}
										<%
										}
									else if(aaaa.equals("c_build")){%>
										if("<%=category%>" == "부동산"){
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
											}
										<%
										}
									else if(aaaa.equals("c_service")){%>
										if("<%=category%>" == "생활서비스"){
											var jbBtn = document.createElement('input');
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
										
											}
										<%
										}
									else if(aaaa.equals("c_educate")){%>
										if("<%=category%>" == "학문/교육"){
											var jbBtn = document.createElement('input');
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
											
											}
										<%
										}
									else if(aaaa.equals("c_visit")){%>
										if("<%=category%>" == "숙박"){
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
											
											}
										<%
										}
									else if(aaaa.equals("c_medical")){%>
										if("<%=category%>" == "의료"){
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
											
											}
										<%
										}
									else if(aaaa.equals("c_tour")){%>
										if("<%=category%>" == "관광/여가/오락"){
											makeButton("<%= category%>", "<%=shopname%>", map, <%= rs2la %>, <%= rs2lo %>);
								
										}
									<%}
					}
				}

			}%>
	}
</script>
</head>

<body>
	<%!Double lo = 0.0;
	Double la = 0.0;%>
	장소 : <%=location%>
	<br> 좌표 : (<%=mLatitude%>,
	<%=mLongtitude%>)
	<div id="mainContent">
		<div id="map" style="width: 500px; height: 500px;"></div>
		<script>
			settingMap();
		</script>
		<div>
			<div id="category">
				<form action="f_filtering.jsp" method="get">
					음식<input type="checkbox" name="cateCheck" value="c_food">
					소매<input type="checkbox" name="cateCheck" value="c_smallshop">
					부동산<input type="checkbox" name="cateCheck" value="c_build">
					생활서비스<input type="checkbox" name="cateCheck" value="c_service">
					학문/교육<input type="checkbox" name="cateCheck" value="c_educate">
					숙박<input type="checkbox" name="cateCheck" value="c_visit">
					의료<input type="checkbox" name="cateCheck" value="c_medical">
					관광/여가/오락<input type="checkbox" name="cateCheck" value="c_tour">
					<input type="hidden" name="location" value="<%=location%>">
					<input type="submit" name="bt_confirm" value="해당조건으로 검색">
				</form>
			</div>
			<div id="location">
				<form action="f_savecourse.jsp" method="post">
					1번 장소 : <input type="text" name="loc1"><br>
					<br> 2번 장소 : <input type="text" name="loc2"><br>
					<br> 3번 장소 : <input type="text" name="loc3"><br>
					<br> 4번 장소 : <input type="text" name="loc4"><br>
					<br> 5번 장소 : <input type="text" name="loc5"><br>
					<br> <input type="submit" value="확정">
				</form>
			</div>
		</div>
		<a href="mypage.jsp">내 기록 보기</a>
	</div>
	<br>
	<br>
	<div id="divbt">
		<%
			if (rset.next()) {
				String bt_first = rset.getString("villageName");
		%>

		<form action="f_bt_location.jsp" method="get">
			<input type="submit" name="clicked_location" value=<%=bt_first%>>
		</form>
		<%
			while (rset.next()) {
					vName = rset.getString("villageName");
		%>
		<form action="f_bt_location.jsp" method="get">
			<input type="submit" name="clicked_location" value="<%=vName%>">
		</form>
		<%
			}
			}
		%>
	</div>
	<div>
	<input type="button" value="logout" onclick="location.href='f_logout.jsp'">
	</div>
</body>

</html>