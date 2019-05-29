<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>두근두근 데이트</title>
</head>
<body>
	<div id="map" style="width:1000px;height:800px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d9fa66b5a57ed1782dfb50131b06dfd"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.3750548, 126.631773),
			level: 3
		};
		var map = new daum.maps.Map(container, options);

        var target_location = new daum.maps.LatLng(37.374449, 126.631773); //좌표

        var marker_target = new daum.maps.Marker(
            {
                position : target_location
            }
        )
        
        marker_target.setMap(map)
	</script>
	<br>
	<br>
	<form>
	<br><br>
		<input type="button" value="갱신버튼" onClick="window.location.reload()">
	</form>
</body>
</html>