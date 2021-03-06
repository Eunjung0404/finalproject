<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
.nonePadding {
	padding: 0px;
}

.centerPosition {
	display: flex;
	align-items: center;
	justify-content: center;
}

.centerTopPosition {
	display: flex;
	align-items: center;
	flex-direction: column;
}

#daytable {
	text-align: center;
}

#daytable th {
	padding: 5px;
}

#daytable tr {
	padding: 5px;
}

#daytable tobody {
	padding: 5px;
}

#daytable td {
	padding: 5px;
}

#daytable thead {
	padding: 5px;
}

#daytable .nextDate {
	color: #D5D5D5;
}

#daytable .prevDate {
	color: #D5D5D5;
}

.movemonth {
	background: none;
	border: none;
}

.Tab li:hover {
	background-color: gray;
	color: white;
}

.Tab li {
	padding: 10px;
}

.clickli {
	border: none;
	background-color: #ED4C00;
	color: white;
}

.clickarea {
	background-color: gray;
	color: white;
}

.time {
	border: 1px solid gray;
}

.time:hover {
	background-color: #ED4C00;
	color: white;
}

.Tab {
	list-style: none;
	padding: 0;
}

#theaterList li:hover {
	background-color: #ED4C00;
	color: white;
}

#theaterList li {
	padding: 10px;
}

#theaterList {
	list-style: none;
	padding: 0;
}

#areas li:hover {
	background-color: gray;
	color: white;
}

#areas li {
	padding: 10px;
}

#areas {
	list-style: none;
	padding: 0;
}

.screentime {
	display: flex;
	border: 1px solid gray;
	width: 120px;
	text-align: center;
	height: 80px;
	justify-content: center;
	align-content: center;
	align-items: center;
	margin: 10px;
	flex-direction: column;
}

.screentime:hover {
	border: none;
	background-color: #ED4C00;
	color: white;
}

.nextpage {
	width: 100px;
	height: 100px;
	position: fixed;
	top: 50%;
	left: 92%;
	opacity: 50%;
	border: none;
	background: none;
}

.click {
	background-color: #ED4C00;
	opacity: 100%;
}

.nonedisplay {
	display: none;
}

.inputsearch {
	padding: 0 0 5px 1px;
	width: calc(100% - 200px);
	line-height: 1;
	border: none;
	border-bottom: 1px solid #777;
	font-size: 13px;
	font-weight: normal;
	color: #2b2b2b;
	outline: none;
	background: none;
	line-height: 1;
}

.nonebackground {
	background: none;
	border: none;
}

.search_result {
	margin-left: 79px;
	padding: 10px 0;
	display: none;
	max-height: 430px;
	overflow: hidden;
	overflow-y: auto;
	background: #fff;
	border: 1px solid #1a1a1a;
	border-top: none;
	width: calc(100% - 1470px);
	position: absolute;
	z-index: 3;
}

.search_result li:hover {
	background-color: #ED4C00;
	color: white;
}

.search_result ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.search_result li {
	padding: 10px;
}

#screenName {
	font-size: 18px;
	font-weight: bold;
	padding: 10px;
}

.moviediv {
	overflow-y: scroll;
	max-height: 390px;
}

.rating {
	padding-top: 5px;
	margin: 5px;
	display: inline-block;
	width: 25px;
	height: 22px;
	line-height: 1;
	text-align: center;
	font-size: 13px;
	display: inline-block;
}

#rating15 {
	color: orange;
	border: 1px solid orange;
	padding-top: 5px;
}

#rating12 {
	color: green;
	border: 1px solid green;
}

#ratingALL {
	color: aqua;
	border: 1px solid aqua;
}

.enone {
	pointer-events: none
}
</style>
<input id="num" value="${moviecode }" type="hidden">
<div class="row centerPosition">
	<!-- ??????????????? -->
	<div class="col-3 nonePadding" style="margin-top: 100px;">
		<span style="font-size: 18px; font-weight: bold;">????????????</span>
		<!-- ?????? -->
		<input type="text" placeholder="???????????? ??????????????????" class="inputsearch"
			id="searchMovie" onkeyup="searchinfo(event)">
		<button class="nonebackground">
			<img src="/finalproject/resources/images/icon/search_black.png"
				alt="??????">
		</button>
		<div class="search_result" id="result-searchMovie">
			<ul></ul>
		</div>
		<div class="accordion accordion-flush" id="accordionFlushExample"
			style="border: 1px solid gray; height: 500px; margin-top: 10px;">

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button class="accordion-button " type="button" id="flushbtn1"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="true" aria-controls="flush-collapseOne"
						onclick="accordionctrl('flush-collapseOne','flush-collapseTwo',event,'flushbtn2')">
						?????? TOP 10</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body nonePadding moviediv">
						<ul id="Tab1" class="Tab">

						</ul>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button class="accordion-button collapsed" type="button"
						id="flushbtn2" data-bs-toggle="collapse"
						data-bs-target="#flush-collapseTwo" aria-expanded="false"
						aria-controls="flush-collapseTwo"
						onclick="accordionctrl('flush-collapseTwo','flush-collapseOne',event,'flushbtn1')">
						TOP 10 ??? ??????</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body nonePadding moviediv">
						<ul id="Tab2" class="Tab">

						</ul>
					</div>
				</div>
			</div>

		</div>


	</div>
	<!-- ?????????  -->

	<div class="col-3 nonePadding" style="margin-top: 100px">
		<span style="font-size: 18px; font-weight: bold;">????????????</span>
		<!-- ?????? -->
		<input type="text" placeholder="???????????? ??????????????????" class="inputsearch"
			id="searchTheater" onkeyup="searchinfo(event)">
		<button class="nonebackground">
			<img src="/finalproject/resources/images/icon/search_black.png"
				alt="??????">
		</button>
		<div class="search_result" id="result-searchTheater">
			<ul></ul>
		</div>
		<div style="height: 500px; margin-top: 10px; border: 1px solid gray;">
			??????<br>
			<div class="centerPosition" style="height: 95%;">
				<div style="width: 35%; border: 1px solid gray; height: 100%;">
					<ul id="areas">
						<li id="??????">??????<span></span></li>
						<li id="??????">??????<span></span></li>
						<li id="??????">??????<span></span></li>
						<li id="??????/??????">??????/??????<span></span></li>
						<li id="??????">??????<span></span></li>
						<li id="??????/??????">??????/??????<span></span></li>
						<li id="??????">??????<span></span></li>
						<li id="??????/??????/??????">??????/??????/??????<span></span></li>
					</ul>

				</div>

				<div style="width: 65%; border: 1px solid gray; height: 100%;">

					<ul id="theaterList">
					</ul>

				</div>
			</div>
		</div>
	</div>

	<!-- ????????? ?????? -->
	<div class="col-2 nonePadding" style="margin-top: 100px">

		<span style="font-size: 18px; font-weight: bold;">????????? ??????</span>

		<div id="Calendar" class="centerTopPosition"
			style="width: 250px; height: 300px; border: 1px solid gray; height: 500px; margin-top: 10px;">
			<span id="text-year">2022</span>
			<div>
				<button class="movemonth" id="prevmonth" onclick="prevmonthbtn()">
					<img src="/finalproject/resources/images/icon/back.png" alt="????????????">
				</button>
				<span id="text-month"
					style="padding-left: 50px; padding-right: 50px;"></span>
				<button class="movemonth" id="nextmonth" onclick="nextmonthbtn()">
					<img src="/finalproject/resources/images/icon/next.png" alt="????????????">
				</button>
			</div>
			<table id="daytable">
				<thead id="day">
					<tr>
						<th style="color: red;">???</th>
						<th>???</th>
						<th>???</th>
						<th>???</th>
						<th>???</th>
						<th>???</th>
						<th style="color: blue">???</th>
					</tr>
				</thead>
				<tbody id="week">

				</tbody>
			</table>
			<div style="display: flex; align-items: center;">
				<div style="border: 1px solid gray; width: 10px; height: 10px;"></div>
				<span style="font-size: 5px; padding: 10px;"> ???????????? </span>
				<div style="width: 11px; height: 11px; background-color: #ED4C00;"></div>
				<span style="font-size: 5px; padding: 10px;">?????? </span>
			</div>
			<div style="border-top: 1px solid; width: 100%; margin-top: 50px;"
				class="centerPosition">
				<span style="font-size: 5px; padding: 30px">??????, ??????, ????????????
					??????????????? <br>?????? ????????? ???????????? ???????????????.
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row centerPosition nonedisplay" id="timesdiv">
	<div class="col-8 nonePadding" style="margin-top: 50px;">
		<span style="font-size: 18px; font-weight: bold;">????????????></span>
	</div>
	<div class="col-8 nonePadding" style="border: 1px solid gray;">

		<div id="theater-info">???????????? ????????? ??????????????????</div>

	</div>

</div>
<div class="row centerPosition">
	<div class="col-8 nonePadding" style="margin-top: 50px;">
		<span style="font-size: 18px; font-weight: bold;">???????????? ></span>
	</div>
	<div class="col-8 nonePadding"
		style="border: 1px solid gray; height: 300px; overflow: hidden; position: relative;">

		<div id="movieposterinfo"
			style="height: 100%; width: 100%; background-size: 5000px; position: absolute; filter: brightness(40%) blur(20px); transform: scale(1.1)">
		</div>
		<div>

			<div>
				<img src="/finalproject/resources/images/icon/img.png" alt="???????????????"
					style="width: 150px; position: absolute; margin-left: 50px; margin-top: 35px;"
					id="posterImg">
			</div>
			<div
				style="z-index: 1; color: black; position: absolute; margin-left: 230px; margin-top: 100px;">
				<span id="movie-name" style="font-size: 22px; font-weight: bold;">?????????
					??????????????????</span><br> <br> <span id="select-area">????????? ??????????????????</span><span
					id="select-screen"></span><br> <span id="select-time">???????????????
					??????????????????</span><span id="select-screentime"></span>
			</div>
		</div>
	</div>
</div>


<form:form method="post"
	action="${pageContext.request.contextPath}/member/seat" id="nextform">
	<!-- ???????????? -->
	<input type="hidden" value="" id="moviecode" name="moviecode">
	<!-- ???????????? -->
	<input type="hidden" value="" id="movienamehtml" name="movienamehtml">
	<!-- ???????????? -->
	<input type="hidden" value="" id="moviename" name="moviename">
	<!--???????????? -->
	<input type="hidden" value="" id="theatercode" name="theatercode">
	<!--???????????? -->
	<input type="hidden" value="" id="theatername" name="theatername">
	<!-- ????????? -->
	<input type="hidden" value="" id="screendate" name="screendate">
	<!-- ??????????????? -->
	<input type="hidden" value="" id="screencode" name="screencode">
	<!-- ??????????????? -->
	<input type="hidden" value="" id="screenname" name="screenname">
	<!-- ??????????????? -->
	<input type="hidden" value="" id="timecode" name="timecode">
	<!-- ???????????? -->
	<input type="hidden" value="" id="screentime" name="screentime">
	<!-- ??????????????? -->
	<input type="hidden" value="" id="movieimgname" name="movieimgname">

	<button id="nextpage" disabled="disabled" onclick="nextpage()"
		class="nextpage">
		<img src="/finalproject/resources/images/icon/forword.png" alt="???????????????">
	</button>

</form:form>
<script type="text/javascript">
	//???????????????
	var year = document.getElementById("text-year").innerText;
	var table = document.getElementById("daytable");
	var thead = document.getElementById("day");
	var tr = table.getElementsByTagName("tr");
	var th = tr[0].getElementsByTagName("th").length;
	var tbody = document.getElementById("week");
	//??????
	const weekday = [ '???', '???', '???', '???', '???', '???', '???' ];
	//??????????????? ????????????
	let moviecode = document.getElementById("moviecode");
	//??????????????? ????????????
	let theatercode = document.getElementById("theatercode");

	//?????????????????? ????????????
	let screendate = document.getElementById("screendate");
	//???????????? ?????? ????????????
	let ul = document.getElementById("areas");
	let areas = ul.getElementsByTagName("li");

	//?????? ?????? ???????????????.
	window.onload = function() {

		//????????????
		drawCerrentCalendar(0, 0);
		var month = parseInt(document.getElementById("text-month").innerText) - 1;
		//????????????
		drawprevCalendar(year, month);
		console.log("???????????? " + month);
		//??????????????? ????????????
		for (var i = 0; i < areas.length; i++) {
			getTheaterCount(areas[i], "");
			areas[0].className = "clickarea";
			areas[i].onclick = function(event) {
				resetArea();
				event.target.className = "clickarea";
				getTheaterName(event.target.id, moviecode.value);
			}
		}
		getMovieInfo();
		getTheaterName('??????', "");
		getScreenTime("", "");

	}

	function checkparam() {
		let num = document.getElementById("num");
		if (num.value != 0) {
			//???????????? ????????????
			console.log("????????????" + num.value);
			let aco = document.getElementById('accordionFlushExample');
			for (var x = 0; x < aco.childNodes.length; x++) {

				//ul?????? ????????????
				let tab = document.getElementsByClassName('Tab');
				for (var y = 0; y < tab.length; y++) {

					//ul-li????????????
					let lis = tab[y].getElementsByTagName('li');
					console.log("??????" + lis.length);
					for (var z = 0; z < lis.length; z++) {
						//console.log("z="+z);
						//li???????????? moviecode??? ???????????? ?????? li click()????????? ??????
						if (lis[z].id == num.value) {
							lis[z].click();
							//console.log("z="+z);
							if (lis[z].parentNode.id == "Tab2") {
								accordionctrl('flush-collapseTwo',
										'flush-collapseOne', document
												.getElementById('flushbtn2'),
										'flushbtn1')
								//console.log();
							}

						}
					}
				}
			}
		}
	}
	function nextpage() {
		document.getElementById("nextform").submit();
	}
	function resetArea() {
		let areas = document.getElementById("areas");
		let lis = areas.getElementsByTagName("li");
		for (var i = 0; i < lis.length; i++) {
			lis[i].className = "";
		}

	}
	//??????
	function accordionctrl(id, id2, event, id3) {
		let flush = document.getElementById(id);
		let flush2 = document.getElementById(id2);
		let btn = document.getElementById(id3);
		if (!flush.classList.contains('show')) {
			flush.className += ' show';
			flush2.classList.remove('show');
			event.target.classList.remove('collapsed');
			console.log("?????????=" + event.target.classList)
			btn.className += " collapsed"
		}

	}

	//?????? 
	function searchinfo(event) {

		let xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let resultdiv = document.getElementById("result-"
						+ event.target.id);
				let resultul = resultdiv.children[0];

				let length = resultul.childNodes.length;
				console.log(length);
				for (var i = 0; i < length; i++) {
					resultul.removeChild(resultul.lastChild);
					console.log("??????!");
				}

				//??????????????? li????????????
				if (event.target.value != "") {
					for (var i = 0; i < json.result.length; i++) {
						//div ?????????
						resultdiv.style.display = "block";

						//????????? ?????? li???????????? ????????????
						let li = document.createElement('li');
						if (event.target.id == 'searchMovie') {
							li.id = json.result[i].MOVIECODE;
							li.innerText = json.result[i].MOVIENAME;
							//li????????? ????????? ??????
							li.onclick = function(event) {

								event.target.className = "clickli";
								//???????????? ????????????
								let aco = document
										.getElementById('accordionFlushExample');
								for (var x = 0; x < aco.childNodes.length; x++) {
									//ul?????? ????????????
									let tab = document
											.getElementsByClassName('Tab');
									for (var y = 0; y < tab.length; y++) {
										//ul-li????????????
										let lis = tab[y]
												.getElementsByTagName('li');
										for (var z = 0; z < lis.length; z++) {
											//li???????????? moviecode??? ???????????? ?????? li click()????????? ??????
											if (lis[z].id == event.target.id) {
												lis[z].click();
												if (lis[z].parentNode.id == "Tab2") {
													accordionctrl('flush-collapseTwo',
															'flush-collapseOne', document
																	.getElementById('flushbtn2'),
															'flushbtn1')
													//console.log();
												}
												
											}
										}
									}

								}
								resultdiv.style.display = "none";
							}

						}
						if (event.target.id == 'searchTheater') {
							li.id = json.result[i].THEATERCODE;
							li.innerText = json.result[i].THEATERNAME;
							let input = document.createElement('input');
							input.setAttribute('type', 'hidden');
							input.value = json.result[i].AREA;
							li.appendChild(input);
							li.onclick = function(event) {
								event.target.className = "clickli";
								//?????? li???????????? click????????? 
								let areas = document.getElementById("areas");
								let lis = areas.getElementsByTagName("li");
								for (var z = 0; z < lis.length; z++) {
									if (lis[z].id == event.target.lastChild.value) {
										lis[z].click();
										//console.log(lis[z]);
										/////////////////////////////////////////////////
										let theaterList = document
												.getElementById("theaterList");
										let theaterlis = theaterList
												.getElementsByTagName("li");
										console.log(theaterlis);
										for (var s = 0; s < theaterlis.length; s++) {
											console.log(theaterlis[s].id);
											if (theaterlis[s].id == event.target.id) {
												theaterlis[s].click();
												console.log(theaterlis[z]);
											}

										}
										/////////////////////////////////////////////////
									}

								}

								resultdiv.style.display = "none";

							}
						}

						resultul.appendChild(li);
					}

				} else {
					//div????????????
					resultdiv.style.display = "none";
				}

				//li??? ????????? ????????????
			}
		}
		xhr.open('get', '/finalproject/tiket-' + event.target.id + "?keyword="
				+ event.target.value, true);
		xhr.send();
	}
	//????????????????????????
	function getMovieInfo() {
		let xhr = new XMLHttpRequest();
		let tab1 = document.getElementById("Tab1");
		let tab2 = document.getElementById("Tab2");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				for (var i = 0; i < json.result.length; i++) {

					let li = document.createElement('li');
					let ratingid = "";
					if (json.result[i].RATING == 'ALL') {
						ratingid = "ratingALL"
					} else if (json.result[i].RATING == '12') {
						ratingid = "rating12"
					} else if (json.result[i].RATING == '15') {
						ratingid = "rating15"
					}
					if (i < 10) {
						li.innerHTML = i + 1 + " ";
					}

					li.innerHTML += "<span id="+ratingid+" class='rating enone'>"
							+ json.result[i].RATING + "</span>"

					li.innerHTML += "<span class='enone'>"
							+ json.result[i].MOVIENAME + "</span>";
					li.id = json.result[i].MOVIECODE;
					li.onclick = function(event) {
						//??????????????????
						let nextpage = document.getElementById('nextpage');
						nextpage.disabled = true;
						nextpage.className = 'nextpage';
						resetArea();
						areas[0].className = "clickarea";
						let tab = document.getElementById("Tab1");
						let lis = tab.getElementsByTagName("li");
						for (var i = 0; i < lis.length; i++) {
							lis[i].className = "";
							lis[i].lastChild.className = "";
						}
						event.target.className = "clickli";
						for (var i = 0; i < areas.length; i++) {

							getTheaterCount(areas[i], event.target.id);

						}
						//???????????? ??????
						moviecode.value = event.target.id;//????????????

						let moviename = document.getElementById('movie-name');
						moviename.value = event.target.innerHTML;//????????????
						moviename.style.color = "white";

						getTheaterName('??????', event.target.id);
						//?????????img?????????
						let posterdiv = document
								.getElementById("movieposterinfo");
						let movieimgname = document
								.getElementById('movieimgname');
						movieimgname.value = event.target.lastChild.value;
						let posterImg = document.getElementById('posterImg');
						posterImg.src = getContextPath()
								+ "/resources/images/movieupload/"
								+ event.target.lastChild.value;
						//????????? img??????
						posterdiv.style.backgroundImage = "url("
								+ getContextPath()
								+ "/resources/images/movieupload/"
								+ event.target.lastChild.value + ")";

						let movienamediv = document
								.getElementById("movie-name");

						let mn = document.getElementById('moviename');
						let mnh = document.getElementById('movienamehtml');
						mn.value = event.target.childNodes[2].innerText;
						if (event.target.parentNode.id == "Tab1") {
							movienamediv.innerHTML = event.target.innerHTML
									.substr(1);
							mnh.value = event.target.innerHTML.substr(1);

						} else {
							movienamediv.innerHTML = event.target.innerHTML;
							mnh.value = event.target.innerHTML;

						}

						//?????????
						let selectarea = document.getElementById("select-area");
						selectarea.style.color = 'white';
						selectarea.innerText = '????????? ??????????????????';
						let selecttime = document.getElementById("select-time");
						selecttime.style.color = 'white';
						selecttime.innerText = '??????????????? ??????????????????';
						let selectscreen = document
								.getElementById("select-screen");
						selectscreen.style.color = 'white';
						selectscreen.innerText = '';
						let selectscreentime = document
								.getElementById("select-screentime");
						selectscreentime.style.color = 'white';
						selectscreentime.innerText = '';
						//timediv ????????????(?????????)
						let timesdiv = document.getElementById('timesdiv');
						if (!timesdiv.classList.contains('nonedisplay')) {
							timesdiv.className += " nonedisplay";
						}
						//????????? ????????????
						getScreenTime(event.target.id, "");
					}

					let movieimg = document.createElement('input');
					movieimg.setAttribute("type", "hidden");
					movieimg.id = "movieimg";
					movieimg.value = json.result[i].MOVIEIMG;
					li.appendChild(movieimg);
					if (i < 10) {
						tab1.appendChild(li);
					} else {
						tab2.appendChild(li);
					}

				}
				checkparam();
			}

		}
		xhr.open('get', '/finalproject/tiket-movie', true);
		xhr.send();
	}

	//???????????????????????????
	function getTheaterCount(area, moviecode) {
		let xhr = new XMLHttpRequest();
		if (area == "")
			return;

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				//????????? ????????? 
				let count = json.count;
				let span = area.lastChild;
				span.id = "count";
				span.innerText = "(" + count + ")";

			}
		}
		xhr.open('get', '/finalproject/tiket-theaterCount?area=' + area.id
				+ '&moviecode=' + moviecode, true);
		xhr.send();

	}
	//??????????????? ????????????
	function getTheaterName(areaname, moviecode) {
		let xhr = new XMLHttpRequest();
		if (areaname == "")
			return;
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;
				let json = JSON.parse(data);
				//????????? ???????????????
				let list = json.list;
				//console.log(list);
				let theaterList = document.getElementById("theaterList");
				let length = theaterList.childNodes.length
				for (var i = 0; i < length; i++) {
					theaterList.removeChild(theaterList.lastChild);
				}
				for (var i = 0; i < list.length; i++) {
					let li = document.createElement('li');
					li.innerText = list[i].THEATERNAME;
					li.id = list[i].THEATERCODE;
					li.onclick = function(event) {
						//??????????????????
						let nextpage = document.getElementById('nextpage');
						nextpage.disabled = true;
						nextpage.className = 'nextpage';
						//let tab = document.getElementById("theaterList");
						let lis = theaterList.getElementsByTagName("li");
						for (var i = 0; i < lis.length; i++) {
							lis[i].className = "";
							lis[i].lastChild.className = "";
						}
						event.target.className = "clickli";
						let sn = document.getElementById("theatername");
						sn.value = event.target.innerText;
						theatercode.value = event.target.id;
						//?????????????????? ?????? ????????????
						let selectarea = document.getElementById('select-area');
						selectarea.innerText = event.target.innerText;
						selectarea.style.color = "white";
						//??????????????? ????????????
						let mc = document.getElementById("moviecode");
						//timediv ????????????(?????????)
						let timesdiv = document.getElementById('timesdiv');
						if (!timesdiv.classList.contains('nonedisplay')) {
							timesdiv.className += " nonedisplay";
						}
						//?????????
						let selecttime = document.getElementById("select-time");
						selecttime.innerText = '??????????????? ??????????????????';
						getScreenTime(mc.value, theatercode.value);

					}

					theaterList.appendChild(li);

				}

			}
		}
		xhr.open('get', '/finalproject/tiket-theater?area=' + areaname
				+ '&moviecode=' + moviecode, true);
		xhr.send();

	}

	//????????? ???????????????
	function drawprevCalendar(year, month) {
		let prevdate = new Date(year, month - 1)
		console.log(month);
		let getyear = prevdate.getFullYear();
		let getMonth = prevdate.getMonth() + 1;
		var getlastday = getLastday(getyear, getMonth);
		let td = document.getElementsByClassName("date");
		let count = 0;
		for (var i = 0; i < td.length; i++) {
			if (!td[i].id) {
				count++;
			}

		}
		for (var i = 0; i < td.length; i++) {
			if (!td[i].id) {
				let d = prevdate.getDate() + (getlastday - count);
				td[i].innerText = d;
				td[i].className = "date prevDate";
				console.log(prevdate.getMonth() + 1);
				if (getMonth < 10) {

					td[i].id = prevdate.getFullYear() + "/0"
							+ (prevdate.getMonth() + 1) + "/" + d;

				} else {

					td[i].id = prevdate.getFullYear() + "/"
							+ (prevdate.getMonth() + 1) + "/" + d;

				}
				count--;

			}

		}
		count = 0;

	}

	//???????????????????????????
	function drawCerrentCalendar(year, month) {
		let date = 0;
		if (year == 0 && month == 0) {
			date = new Date();
			//?????? ?????????
			console.log("00000");
			date.setDate(1);
		} else {

			console.log("11111");
			date = new Date(year, month);
		}
		console.log(date);
		let getyear = date.getFullYear();
		let getMonth = date.getMonth() + 1;
		let getstartday = date.getDay();
		var getlastday = getLastday(getyear, getMonth);
		document.getElementById("text-month").innerText = getMonth;
		console.log("???:" + getMonth);
		console.log("?????????:" + getstartday);
		console.log("??????:" + getlastday);
		//table tr/td??????
		for (var i = 0; i < 6; i++) {
			//tr??????
			var trweek = document.createElement("tr");
			trweek.id = "week" + i;
			tbody.appendChild(trweek);

			for (var j = 0; j < 7; j++) {
				//td??????
				var tdDate = document.createElement("td");
				tdDate.className = "date";
				document.getElementById("week" + i).appendChild(tdDate);
				if (j == getstartday) {

					tdDate.innerText = date.getDate();
					//?????? ++
					if ((getMonth - 1) == date.getMonth()) {
						tdDate.className += " currentDate"

					} else {

						tdDate.className = " nextDate"
					}
					if (getMonth < 10) {
						if (date.getDate() < 10) {
							tdDate.id = date.getFullYear() + "/0"
									+ (date.getMonth() + 1) + "/0"
									+ date.getDate();
						} else {
							tdDate.id = date.getFullYear() + "/0"
									+ (date.getMonth() + 1) + "/"
									+ date.getDate();
						}

					} else {
						if (date.getDate() < 10) {
							tdDate.id = date.getFullYear() + "/"
									+ (date.getMonth() + 1) + "/0"
									+ date.getDate();
						} else {
							tdDate.id = date.getFullYear() + "/"
									+ (date.getMonth() + 1) + "/"
									+ date.getDate();
						}

					}
					date.setDate(date.getDate() + 1);
					getstartday = date.getDay();

				}

			}

		}
	}

	//????????? ?????? ???????????? 
	function getLastday(year, month) {
		let lastdays = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		let lastdays2 = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
		if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
			console.log("??????!");
			return lastdays2[month - 1];
		} else {

			return lastdays[month - 1];
		}
	}

	//???????????? ?????? ???????????? 
	function getScreenTime(moviecode, theatercode) {
		let xhr = new XMLHttpRequest();
		//console.log("????????????");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;
				let json = JSON.parse(data);
				//??????
				let screendate = json.result.screendate;
				//???????????? ??????

				let td = tbody.getElementsByTagName("td");

				//??????????????? ??????...
				for (var i = 0; i < td.length; i++) {

					if (td[i].classList.contains('time')) {
						td[i].classList.remove('time');
						td[i].classList.remove('clickli');
					}

				}
				for (var i = 0; i < json.result.length; i++) {
					console.log(json.result[i].screendate);
					for (var j = 0; j < td.length; j++) {

						if (td[j].id == json.result[i].screendate) {

							//?????????????????? ??????
							const datesAreOnSameDay = (first, second) =>
						    first.getFullYear() === second.getFullYear() &&
						    first.getMonth() === second.getMonth() &&
						    first.getDate() === second.getDate();
							let cdate=new Date();
							let ndate=new Date(json.result[i].screendate);
							//????????? ????????? ??????
							if(ndate>cdate || datesAreOnSameDay(cdate,ndate))
								{
								//???????????? ??????
								td[j].className += " time";
								//console.log("???????????????"+ndate+","+cdate);
								}
							//td[j].className += " time";
							td[j].onclick = function(event) {
								if (event.target.classList.contains('time')) {
									//??????????????????
									let nextpage = document
											.getElementById('nextpage');
									nextpage.disabled = true;
									nextpage.className = 'nextpage';
									let timearea = document
											.getElementById('select-time');
									let day = new Date(event.target.id);
									timearea.innerText = event.target.id + ' ('
											+ weekday[day.getDay()] + ')';
									timearea.style.color = "white";
									for (var s = 0; s < td.length; s++) {

										td[s].classList.remove('clickli');

									}
									event.target.className += " clickli";
									let sd = document
											.getElementById("screendate");
									let mc = document
											.getElementById("moviecode");
									let tc = document
											.getElementById("theatercode");
									sd.value = event.target.id;
									if (mc.value != "" && tc.value != "") {

										console.log("??????????????????!" + mc.value + ","
												+ tc.value);
										getScreeninfo(mc.value, tc.value,
												sd.value);
									}
								}
							}
						}

					}
				}

			}
		}
		xhr.open('get', '/finalproject/tiket-ScreenDate?moviecode=' + moviecode
				+ '&theatercode=' + theatercode, true);
		xhr.send();

	}

	//???????????? ?????????
	function nextmonthbtn() {

		
		//?????? ???????????? ??????
		for (var i = tbody.rows.length; i >= 0; i--) {
			console.log(tbody.rows.length);
			tbody.deleteRow(tbody.rows.length - 1);

		}
		//
		let nextM = parseInt(document.getElementById("text-month").innerText) + 1;
		document.getElementById("text-month").innerText = nextM;
		drawCerrentCalendar(year, nextM - 1)
		drawprevCalendar(year, nextM - 1);
	}

	//???????????? ?????????
	function prevmonthbtn() {

		for (var i = tbody.rows.length; i >= 0; i--) {
			console.log(tbody.rows.length);
			tbody.deleteRow(tbody.rows.length - 1);

		}
		let prevM = parseInt(document.getElementById("text-month").innerText) - 1;
		document.getElementById("text-month").innerText = prevM;
		drawCerrentCalendar(year, prevM - 1)
		drawprevCalendar(year, prevM - 1);
	}

	//???????????? ????????????~
	function getScreeninfo(moviecode, theatercode, screendate) {
		let xhr = new XMLHttpRequest();
		if (moviecode == "")
			return;
		//console.log(getContextPath());
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				let data = xhr.responseText;
				let json = JSON.parse(data);
				let timesdiv = document.getElementById('timesdiv');
				timesdiv.classList.remove("nonedisplay");
				let div = document.getElementById('theater-info');
				let length = div.childNodes.length
				for (var i = 0; i < length; i++) {
					div.removeChild(div.lastChild);
				}
				for (var j = 0; j < json.screenName.length; j++) {

					let screendiv = document.createElement('div');
					screendiv.innerHTML = "<br><span id='screenName'>"
							+ json.screenName[j] + "</span>";
					let timediv = document.createElement('div');
					timediv.style.display = "flex";

					for (var i = 0; i < json.result.length; i++) {
						if (json.screenName[j] == json.result[i].name) {
							let infodiv = document.createElement('div');
							infodiv.innerText = json.result[i].starttime + "-"
									+ json.result[i].endtime;
							infodiv.id = json.result[i].timecode;
							infodiv.className = "screentime";
						//	let countinfo = document.createElement('p');
							//countinfo.style.fontSize="10px";
							//countinfo.innerText=json.bookcountlist[i]+"/"+json.totalcountlist[i];
							//infodiv.appendChild(countinfo);
							
							infodiv.name = json.result[i].screencode;
							
							
							//????????? ?????? 
							let nameinput = document.createElement('input');
							nameinput.setAttribute('type', 'hidden');
							nameinput.value = json.result[i].name;
							infodiv.appendChild(nameinput);
							
							//???????????????
							infodiv.onclick = function(event) {
								let divs = document.getElementsByClassName('screentime clickli');
								for(var i=0;i<divs.length;i++)
									{
									divs[i].classList.remove('clickli');
									}
								
								//???????????????
								let nextpage = document
										.getElementById('nextpage');
								nextpage.disabled = false;
								nextpage.className += ' click';
								event.target.className += " clickli";
								let timecode = document
										.getElementById("timecode");
								timecode.value = event.target.id;
								//????????????
								let sc = document.getElementById("screencode");
								let st = document.getElementById("screentime");
								let sn = document.getElementById('screenname');
								sn.value = event.target.lastChild.value;
								sc.value = event.target.name;
								st.value = event.target.innerText;
								//????????????
								let timearea = document
										.getElementById('select-screentime');
								timearea.innerText = "/"
										+ event.target.innerText;
								//????????????
								let selectscreen = document
										.getElementById("select-screen");
								selectscreen.style.color = 'white';
								selectscreen.innerText = '/'
										+ event.target.lastChild.value;

							}
							timediv.appendChild(infodiv);
						}
					}
					div.appendChild(screendiv);
					div.appendChild(timediv);
				}

			}
		}
		xhr.open('get', '/finalproject/tiket-screen?moviecode=' + moviecode
				+ '&theatercode=' + theatercode + '&screendate=' + screendate,
				true);
		xhr.send();

	}

	//contextPath???????????? ??????
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	}
</script>