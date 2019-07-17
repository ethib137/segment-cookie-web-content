<script>
	if ($('.fragments-editor').length == 0) {
		var cKey = '${CookieKey.getData()}';
		var cValue = '${CookieValue.getData()}';
		var cDomain = <#if CookieDomain??>'${CookieDomain.getData()}'<#else>''</#if>;
		var cThreshold = parseInt(${SegmentationVisitsThreshold.getData()});

		var segmentCookieKey = cKey + '_DATA';

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
			var cookie = key + '=' + value + ';';

			if (cDomain != '') {
				cookie = cookie + ' domain=' + cDomain + ';';
			}

			document.cookie = cookie;
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
			var segmentCookie = getSegmentCookie(getCookies(), segmentCookieKey);

			var visits = 1;

			console.log(segmentCookie);

			if (segmentCookie) {
				console.log('segmentCookie:', segmentCookie);

				visits = segmentCookie.visits + 1;
			}

			setSegmentCookie(segmentCookieKey, value, visits);

			console.log('visits:', visits);

			if (visits >= threshold) {
				console.log('Cookie Added');

				setCookie(key, value)
			}
		}

		function resetSegmentCookie() {
			setCookie(
				cKey,
				cValue + 'false'
			);

			setSegmentCookie(segmentCookieKey, cValue, 0);
		}

		handleSegmentCookie(
			cKey,
			cValue,
			cThreshold
		);
	}
</script>