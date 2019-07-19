/**
 * Ajax 통신과 관련된 함수 라이브러리
 */
var httpRequest = null;

function getXMLHttpRequest() {
	if (window.XMLHttpRequest)
		return new XMLHttpRequest;
	if (window.ActiveXObject)
		return new ActiveXObject("microsoft.XMLHTTP");
	return null;
}

/*
 * typeof("name=홍길동&age=25") : string typeof({name:'홍길동',age:25}) : object
 */

function sendProcess(method, url, params, callback) {
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	console.log(params);
	var httpMethod = method.toUpperCase();
	if (method != 'GET' && method != "POST")
		httpMethod = 'GET'
	httpParams = '';

	if (typeof (params) == 'object') {
		// if (params != null && params != '')
		for ( var key in params) {
			if (httpParams)
				httpParams += '&';
			httpParams += key + "=" + encodeURIComponent(params[key]);
			// console.log(key+":"+params[key]);
		}
	} else if (typeof (params) == 'string') {
		args = params.split('&');
		args.forEach(function(data,index){     //배열의 0번지 인덱스부터 배열 크기만큼 익명함수를 실행한다.
			var key=data.split('=')[0]; //배열로 뽑아낸다.
			var value = data.split('=')[1];
			httpParams+=(index==0?'':'&')+key+'='+encodeURIComponent(value);
		});
	}

	console.log(httpParams);

	// httpParams=encodeURIComponent(params);
	var httpUrl = url;
	if (httpMethod == "GET")
		httpUrl += '?' + httpParams;

	httpRequest.open(httpMethod, httpUrl, true);
	if (httpMethod == 'POST')
		httpRequest.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
}

function sendProcess_V1(method, url, params, callback) {
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	console.log(params);
	var httpMethod = method.toUpperCase();
	if (method != 'GET' && method != "POST")
		httpMethod = 'GET'
	httpParams = '';
	if (params != null && params != '')
		for ( var key in params) {
			if (httpParams)
				httpParams += '&';
			httpParams += key + "=" + encodeURIComponent(params[key]);
			// console.log(key+":"+params[key]);
		}
	console.log(httpParams);

	// httpParams=encodeURIComponent(params);
	var httpUrl = url;
	if (httpMethod == "GET")
		httpUrl += '?' + httpParams;

	httpRequest.open(httpMethod, httpUrl, true);
	if (httpMethod == 'POST')
		httpRequest.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
}

function sendProcess_V0(method, url, params, callback) {
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;

	var httpMethod = method.toUpperCase();
	if (method != 'GET' && method != "POST")
		httpMethod = 'GET'

	httpParams = encodeURIComponent(params);
	var httpUrl = url;
	if (httpMethod == "GET")
		httpUrl += '?' + httpParams;

	httpRequest.open(httpMethod, httpUrl, true);
	if (httpMethod == 'POST')
		httpRequest.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
}
