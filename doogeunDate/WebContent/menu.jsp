<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>

<head>
    <meta charset="EUC-KR">
    <title>두근두근 데이트</title>
    <link rel="stylesheet" type="text/css" href="style/menu.css" />
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d9fa66b5a57ed1782dfb50131b06dfd"></script>
</head>

<body>
	<div id="mainContent">
		<div id="map"></div>
    	<div id="category">
    	<ul>
	            <li>음식점(중복 선택 가능)</li>
	            한식<input type="checkbox" name="food" value="resturant">
	            양식<input type="checkbox" name="food" value="resturant">
	            중식<input type="checkbox" name="food" value="resturant">
	            일식<input type="checkbox" name="food" value="resturant">
	            기타<input type="checkbox" name="food" value="resturant">
	            <li>그 외 가고싶은 장소(중복 선택 가능)</li>
	            카페<input type="checkbox" name="place" value="destination">
	            노래방<input type="checkbox" name="place" value="destination">
	        </ul>
	        <p>지도에서 가고싶은 지역을 선택후 장소를 체크합니다.</p>
    	</div>
	</div>
</body>

<script>
    var container = document.getElementById('map');
    var options = {
        center: new daum.maps.LatLng(37.556767, 126.936609),
        level: 3
    };
    var map = new daum.maps.Map(container, options);
    var rcLocation = new daum.maps.LatLng(37.556767, 126.936609);
    var mkLocation = new daum.maps.Marker(
        {
            position: rcLocation
        }
    )

    mkLocation.setMap(map)
</script>

</html>