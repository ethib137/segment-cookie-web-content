<script>
	if ($('.fragments-editor').length == 0) {
		function getCookies() {
			var cookiesObj = {};

			var cookies = document.cookie.split('; ');

			cookies.forEach(
				function(cookie) {
					cookieArr = cookie.split('=');

					cookiesObj[cookieArr[0]] = cookieArr[1];
				}
			)

			return cookiesObj;
		}

		function getSegmentCookie(cookiesObj, key) {
			var segmentCookie = cookiesObj[key];

			if (segmentCookie) {
				segmentCookie = JSON.parse(segmentCookie);
			}
			else {
				segmentCookie = null;
			}

			return segmentCookie;
		}

		function setCookie(key, value) {
			document.cookie = key + '=' + value;
		}

		function setSegmentCookie(key, value, visits) {
			var newSegmentCookie = {
				value,
				visits
			}

			console.log('newSegmentCookie:', newSegmentCookie);

			setCookie(key, JSON.stringify(newSegmentCookie));
		}

		function handleSegmentCookie(key, value, threshold) {
			var segmentCookie = getSegmentCookie(getCookies(), key);

			var visits = 1;

			console.log(segmentCookie);

			if (segmentCookie) {
				console.log('segmentCookie:', segmentCookie);
				visits = segmentCookie.visits + 1;
			}

			console.log('visits:', visits);

			if (visits < threshold) {
				console.log('Cookie NOT Added');

				setSegmentCookie(key, value + 'false', visits);
			}
			else {
				console.log('Cookie Added');

				setCookie(key, value)
			}
		}

		function resetSegmentCookie() {
			setSegmentCookie(
				'${CookieKey.getData()}',
				'${CookieValue.getData()}' + 'false',
				0
			);
		}

		handleSegmentCookie(
			'${CookieKey.getData()}',
			'${CookieValue.getData()}',
			parseInt(${SegmentationVisitsThreshold.getData()})
		);
	}
</script>