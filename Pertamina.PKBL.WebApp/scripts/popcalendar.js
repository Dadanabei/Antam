var language = 'en';
var enablePast = 0;
var fixedX = -1;
var fixedY = -1;
var startAt = 1;
var showWeekNumber = 0;
var showToday = 1;
var imgDir = '../../App_Themes/image/calendar/';
var dayName = '';
var gotoString = new Array();
var todayString = new Array();
var weekString = new Array();
var scrollLeftMessage = new Array();
var scrollRightMessage = new Array();
var selectMonthMessage = new Array();
var selectYearMessage = new Array();
var selectDateMessage = new Array(); 
var monthName = new Array(); 
var monthName2 = new Array();
function loadArrays() {
    gotoString = { en: 'Go To Current Month' };
    todayString = { en: 'Today is' };
    weekString = { en: 'Wk' };
    scrollLeftMessage = { en: 'Click to scroll to previous month. Hold mouse button to scroll automatically.' };
    scrollRightMessage = { en: 'Click to scroll to next month. Hold mouse button to scroll automatically.' };
    selectMonthMessage = { en: 'Click to select a month.' }; 
    selectYearMessage = { en: 'Click to select a year.' };
    selectDateMessage = { en: 'Select [date] as date.' };
    monthName = { en: new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December') };
    monthName2 = { en: new Array('JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC') };
    if (startAt == 0) { dayName = { en: new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')} }
    else { dayName = { en: new Array('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')} } 
};
var crossobj, crossMonthObj, crossYearObj, monthSelected, yearSelected, dateSelected, omonthSelected, oyearSelected, odateSelected, monthConstructed, yearConstructed, intervalID1, intervalID2, timeoutID1, timeoutID2, ctlToPlaceValue, ctlNow, dateFormat, nStartingYear, selDayAction, isPast; var visYear = 0; var visMonth = 0; var bPageLoaded = false; var ie = document.all; var dom = document.getElementById;
var today = new Date();
var dateNow = today.getDate();
var monthNow = today.getMonth(); var yearNow = today.getYear();
var imgsrc = new Array('drop1g.png', 'drop2g.png', 'left1g.png', 'left2g.png', 'right1g.png', 'right2g.png');
var img = new Array();
var bShow = false;
 var hour = 00;
 var minute = 00;
 var second = 00; 
          function setHour(a) { if (a.length == 2) { hour = a } else if (a.length == 1) { hour = '0' + a } } function setMinute(a) { if (a.length == 2) { minute = a } else if (a.length == 1) { minute = '0' + a } } function setSecond(a) { if (a.length == 2) { second = a } else if (a.length == 1) { second = '0' + a } } function hideElement(a, b) { if (ie) { for (i = 0; i < document.all.tags(a).length; i++) { obj = document.all.tags(a)[i]; if (!obj || !obj.offsetParent) { continue } objLeft = obj.offsetLeft; objTop = obj.offsetTop; objParent = obj.offsetParent; while (objParent.tagName.toUpperCase() != 'BODY') { objLeft += objParent.offsetLeft; objTop += objParent.offsetTop; objParent = objParent.offsetParent } objHeight = obj.offsetHeight; objWidth = obj.offsetWidth; if ((b.offsetLeft + b.offsetWidth) <= objLeft) { } else if ((b.offsetTop + b.offsetHeight) <= objTop) { } else if (b.offsetTop >= (objTop + objHeight + obj.height)) { } else if (b.offsetLeft >= (objLeft + objWidth)) { } else { obj.style.visibility = 'hidden' } } } } function showElement(a) { if (ie) { for (i = 0; i < document.all.tags(a).length; i++) { obj = document.all.tags(a)[i]; if (!obj || !obj.offsetParent) { continue } obj.style.visibility = '' } } } if (dom) { for (i = 0; i < imgsrc.length; i++) { img[i] = new Image(); img[i].src = imgDir + imgsrc[i] } document.write('<div onclick="bShow=true" id="pccalendar" style="z-index:+999;position:absolute;visibility:hidden;"><table style="width:' + ((showWeekNumber == 1) ? 250 : 220) + 'px;font:11px Arial;border:1px solid #A0A0A0;background:#fff"><tr bgcolor="#65C21B"><td><table width="' + ((showWeekNumber == 1) ? 248 : 218) + '"><tr><td style="padding:2px;font:bold 11px Arial;color:#fff"><span id="pccaption"></span></td><td align="right"><a href="javascript:hideCalendar()"><img src="' + imgDir + 'close.gif" width="15" height="13" border="0" /></a></td></tr></table></td></tr><tr><td style="padding:5px;background:#fff"><span id="pccontent"></span></td></tr>'); if (showToday == 1) { document.write('<tr bgcolor="#f0f0f0"><td style="padding:5px;text-align:center"><span id="pclblToday"></span></td></tr>') } document.write('</table></div><div id="pcselectMonth" style="z-index:+999;position:absolute;visibility:hidden;"></div><div id="pcselectYear" style="z-index:+999;position:absolute;visibility:hidden;"></div>') } var styleAnchor = 'text-decoration:none;color:black;'; var styleLightBorder = 'border:1px solid #a0a0a0;'; function swapImage(a, b) { if (ie) { document.getElementById(a).setAttribute('src', imgDir + b) } } function init() { if (!ie) { yearNow += 1900 } crossobj = (dom) ? document.getElementById('pccalendar').style : ie ? document.all.pccalendar : document.pccalendar; hideCalendar(); crossMonthObj = (dom) ? document.getElementById('pcselectMonth').style : ie ? document.all.pcselectMonth : document.pcselectMonth; crossYearObj = (dom) ? document.getElementById('pcselectYear').style : ie ? document.all.pcselectYear : document.pcselectYear; monthConstructed = false; yearConstructed = false; sHTML1 = '<span style="border:1px solid #65C21B;cursor:pointer" onmouseover="swapImage(\'pcchangeLeft\',\'left2g.png\');this.style.borderColor=\'#65C21B\';window.status=\'' + scrollLeftMessage[language] + '\'" onclick="decMonth()" onmouseout="clearInterval(intervalID1);swapImage(\'pcchangeLeft\',\'left1g.png\');this.style.borderColor=\'#65C21B\';window.status=\'\'" onmousedown="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'StartDecMonth()\',500)" onmouseup="clearTimeout(timeoutID1);clearInterval(intervalID1)">&nbsp<img id="pcchangeLeft" src="' + imgDir + 'left1g.png" width="10" height="11" border="0">&nbsp</span>&nbsp;'; sHTML1 += '<span style="border:1px solid #65C21B;cursor:pointer" onmouseover="swapImage(\'pcchangeRight\',\'right2g.png\');this.style.borderColor=\'#65C21B\';window.status=\'' + scrollRightMessage[language] + '\'" onmouseout="clearInterval(intervalID1);swapImage(\'pcchangeRight\',\'right1g.png\');this.style.borderColor=\'#65C21B\';window.status=\'\'" onclick="incMonth()" onmousedown="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'StartIncMonth()\',500)" onmouseup="clearTimeout(timeoutID1);clearInterval(intervalID1)">&nbsp<img id="pcchangeRight" src="' + imgDir + 'arrow-right.png" width="10" height="11" border="0">&nbsp</span>&nbsp;'; sHTML1 += '<span id="pcspanMonth" style="border:1px solid #65C21B;cursor:pointer" onmouseover="swapImage(\'pcchangeMonth\',\'drop2g.png\');this.style.borderColor=\'#8af\';window.status=\'' + selectMonthMessage[language] + '\'" onmouseout="swapImage(\'pcchangeMonth\',\'drop1g.png\');this.style.borderColor=\'#65C21B\';window.status=\'\'" onclick="popUpMonth()"></span>&nbsp;'; sHTML1 += '<span id="pcspanYear" style="border:1px solid #65C21B;cursor:pointer" onmouseover="swapImage(\'pcchangeYear\',\'drop2g.png\');this.style.borderColor=\'#8af\';window.status=\'' + selectYearMessage[language] + '\'" onmouseout="swapImage(\'pcchangeYear\',\'drop1g.png\');this.style.borderColor=\'#65C21B\';window.status=\'\'" onclick="popUpYear()"></span>&nbsp;'; document.getElementById('pccaption').innerHTML = sHTML1; bPageLoaded = true } var HolidaysCounter = 0; var Holidays = new Array(); function HolidayRec(d, m, y, a) { this.d = d; this.m = m; this.y = y; this.desc = a } function addHoliday(d, m, y, a) { Holidays[HolidaysCounter++] = new HolidayRec(d, m, y, a) } function hideCalendar() { crossobj.visibility = 'hidden'; if (crossMonthObj != null) crossMonthObj.visibility = 'hidden'; if (crossYearObj != null) crossYearObj.visibility = 'hidden'; showElement('SELECT'); showElement('APPLET') } function padZero(a) { return (a < 10) ? '0' + a : a } function constructDate(d, m, y) { sTmp = dateFormat; sTmp = sTmp.replace('dd', '<e>'); sTmp = sTmp.replace('d', '<d>'); sTmp = sTmp.replace('<e>', padZero(d)); sTmp = sTmp.replace('<d>', d); sTmp = sTmp.replace('mmmm', '<p>'); sTmp = sTmp.replace('mmm', '<o>'); sTmp = sTmp.replace('mm', '<n>'); sTmp = sTmp.replace('m', '<m>'); sTmp = sTmp.replace('<m>', m + 1); sTmp = sTmp.replace('<n>', padZero(m + 1)); sTmp = sTmp.replace('<o>', monthName[language][m]); sTmp = sTmp.replace('<p>', monthName2[language][m]); sTmp = sTmp.replace('yyyy', y); sTmp = sTmp.replace('yy', padZero(y % 100)); sTmp = sTmp.replace('hh', hour); sTmp = sTmp.replace('xx', minute); sTmp = sTmp.replace('ss', second); return sTmp.replace('yy', padZero(y % 100)) } function closeCalendar() { hideCalendar(); ctlToPlaceValue.value = constructDate(dateSelected, monthSelected, yearSelected) } function StartDecMonth() { intervalID1 = setInterval("decMonth()", 80) } function StartIncMonth() { intervalID1 = setInterval("incMonth()", 80) } function incMonth() { monthSelected++; if (monthSelected > 11) { monthSelected = 0; yearSelected++ } constructCalendar() } function decMonth() { monthSelected--; if (monthSelected < 0) { monthSelected = 11; yearSelected-- } constructCalendar() } function constructMonth() { popDownYear(); if (!monthConstructed) { sHTML = ""; for (i = 0; i < 12; i++) { sName = monthName[language][i]; if (i == monthSelected) { sName = '<b>' + sName + '</b>' } sHTML += '<tr><td id="m' + i + '" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onclick="monthConstructed=false;monthSelected=' + i + ';constructCalendar();popDownMonth();event.cancelBubble=true">&nbsp;' + sName + '&nbsp;</td></tr>' } document.getElementById('pcselectMonth').innerHTML = '<table style="width:70px;font:11px Arial;border:1px solid #a0a0a0;" bgcolor="#f0f0f0" cellspacing="0" onmouseover="clearTimeout(timeoutID1)" onmouseout="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'popDownMonth()\',100);event.cancelBubble=true">' + sHTML + '</table>'; monthConstructed = true } } function popUpMonth() { if (visMonth == 1) { popDownMonth(); visMonth-- } else { constructMonth(); crossMonthObj.visibility = (dom || ie) ? 'visible' : 'show'; crossMonthObj.left = parseInt(crossobj.left) + 50 + "px"; crossMonthObj.top = parseInt(crossobj.top) + 26 + "px"; hideElement('SELECT', document.getElementById('pcselectMonth')); hideElement('APPLET', document.getElementById('pcselectMonth')); visMonth++ } } function popDownMonth() { crossMonthObj.visibility = 'hidden'; visMonth = 0 } function incYear() { for (i = 0; i < 7; i++) { newYear = (i + nStartingYear) + 1; if (newYear == yearSelected) { txtYear = '<span style="color:#006;font-weight:bold;">&nbsp;' + newYear + '&nbsp;</span>' } else { txtYear = '<span style="color:#006">&nbsp;' + newYear + '&nbsp;</span>' } document.getElementById('y' + i).innerHTML = txtYear } nStartingYear++; bShow = true } function decYear() { for (i = 0; i < 7; i++) { newYear = (i + nStartingYear) - 1; if (newYear == yearSelected) { txtYear = '<span style="color:#006;font-weight:bold">&nbsp;' + newYear + '&nbsp;</span>' } else { txtYear = '<span style="color:#006;">&nbsp;' + newYear + '&nbsp;</span>' } document.getElementById('y' + i).innerHTML = txtYear } nStartingYear--; bShow = true } function selectYear(a) { yearSelected = parseInt(a + nStartingYear); yearConstructed = false; constructCalendar(); popDownYear() } function constructYear() { popDownMonth(); sHTML = ''; if (!yearConstructed) { sHTML = '<tr><td align="center" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="clearInterval(intervalID1);this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onmousedown="clearInterval(intervalID1);intervalID1=setInterval(\'decYear()\',30)" onmouseup="clearInterval(intervalID1)">-</td></tr>'; j = 0; nStartingYear = yearSelected - 3; for (i = (yearSelected - 3); i <= (yearSelected + 3); i++) { sName = i; if (i == yearSelected) sName = '<b>' + sName + '</b>'; sHTML += '<tr><td id="y' + j + '" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onclick="selectYear(' + j + ');event.cancelBubble=true">&nbsp;' + sName + '&nbsp;</td></tr>'; j++ } sHTML += '<tr><td align="center" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="clearInterval(intervalID2);this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onmousedown="clearInterval(intervalID2);intervalID2=setInterval(\'incYear()\',30)" onmouseup="clearInterval(intervalID2)">+</td></tr>'; document.getElementById('pcselectYear').innerHTML = '<table width="44" cellspacing="0" style="font:11px Arial;border:1px solid #a0a0a0;background:#f0f0f0" onmouseover="clearTimeout(timeoutID2)" onmouseout="clearTimeout(timeoutID2);timeoutID2=setTimeout(\'popDownYear()\',100)">' + sHTML + '</table>'; yearConstructed = true } } function popDownYear() { clearInterval(intervalID1); clearTimeout(timeoutID1); clearInterval(intervalID2); clearTimeout(timeoutID2); crossYearObj.visibility = 'hidden'; visYear = 0 } function popUpYear() { var a; if (visYear == 1) { popDownYear(); visYear-- } else { constructYear(); crossYearObj.visibility = (dom || ie) ? 'visible' : 'show'; a = parseInt(crossobj.left) + document.getElementById('pcspanYear').offsetLeft; if (ie) a += 6; crossYearObj.left = a + "px"; crossYearObj.top = parseInt(crossobj.top) + 26 + "px"; visYear++ } } function WeekNbr(n) { year = n.getFullYear(); month = n.getMonth() + 1; if (startAt == 0) { day = n.getDate() + 1 } else { day = n.getDate() } a = Math.floor((14 - month) / 12); y = year + 4800 - a; m = month + 12 * a - 3; b = Math.floor(y / 4) - Math.floor(y / 100) + Math.floor(y / 400); J = day + Math.floor((153 * m + 2) / 5) + 365 * y + b - 32045; d4 = (((J + 31741 - (J % 7)) % 146097) % 36524) % 1461; L = Math.floor(d4 / 1460); d1 = ((d4 - L) % 365) + L; week = Math.floor(d1 / 7) + 1; return week } function constructCalendar() { var a = new Array(31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); var b; var c = new Date(yearSelected, monthSelected, 1); var d; if (monthSelected == 1) { d = new Date(yearSelected, monthSelected + 1, 1); d = new Date(d - (24 * 60 * 60 * 1000)); numDaysInMonth = d.getDate() } else { numDaysInMonth = a[monthSelected] } datePointer = 0; dayPointer = c.getDay() - startAt; if (dayPointer < 0) dayPointer = 6; sHTML = '<table style="border:0;font:10px verdana;"><tr>'; if (showWeekNumber == 1) { sHTML += '<td width="27"><strong>' + weekString[language] + '</strong></td><td width="1" rowspan="7" style="background:#d0d0d0;padding:0"><img src="' + imgDir + 'divider.gif" width="1"></td>' } for (i = 0; i < 7; i++) { sHTML += '<td style="width:27px;text-align:right;color:#006;font-weight:bold">' + dayName[language][i] + '</td>' } sHTML += '</tr><tr>'; if (showWeekNumber == 1) { sHTML += '<td align="right">' + WeekNbr(c) + '&nbsp;</td>' } for (var i = 1; i <= dayPointer; i++) { sHTML += '<td>&nbsp;</td>' } for (datePointer = 1; datePointer <= numDaysInMonth; datePointer++) { dayPointer++; sHTML += '<td align="right">'; sStyle = styleAnchor; if ((datePointer == odateSelected) && (monthSelected == omonthSelected) && (yearSelected == oyearSelected)) { sStyle += styleLightBorder } sHint = ''; for (k = 0; k < HolidaysCounter; k++) { if ((parseInt(Holidays[k].d) == datePointer) && (parseInt(Holidays[k].m) == (monthSelected + 1))) { if ((parseInt(Holidays[k].y) == 0) || ((parseInt(Holidays[k].y) == yearSelected) && (parseInt(Holidays[k].y) != 0))) { sStyle += 'background-color:#fdd;'; sHint += sHint == "" ? Holidays[k].desc : "\n" + Holidays[k].desc } } } sHint = sHint.replace('/\"/g', '&quot;'); b = 'onmousemove="window.status=\'' + selectDateMessage[language].replace('[date]', constructDate(datePointer, monthSelected, yearSelected)) + '\'" onmouseout="window.status=\'\'" '; if (enablePast == 0 && ((yearSelected < yearNow) || (monthSelected < monthNow) && (yearSelected == yearNow) || (datePointer < dateNow) && (monthSelected == monthNow) && (yearSelected == yearNow))) { selDayAction = ''; isPast = 1 } else { selDayAction = 'href="javascript:dateSelected=' + datePointer + ';closeCalendar();"'; isPast = 0 } sHTML += '<a ' + b + ' title="' + sHint + '" style="' + sStyle; if ((datePointer == dateNow) && (monthSelected == monthNow) && (yearSelected == yearNow)) { sHTML += 'font-weight:bold;color:red;" ' } else if (dayPointer % 7 == (startAt * -1) + 1) { if (isPast == 1) { sHTML += 'color:#909090;" ' } else { sHTML += 'color:#54A6E2;" ' } } else if ((dayPointer % 7 == (startAt * -1) + 7 && startAt == 1) || (dayPointer % 7 == startAt && startAt == 0)) { if (isPast == 1) { sHTML += 'color:#909090;" ' } else { sHTML += 'color:#54A6E2;" ' } } else { if (isPast == 1) { sHTML += 'color:#909090;" ' } else { sHTML += 'color:#006;" ' } } sHTML += selDayAction + '>&nbsp;' + datePointer + '&nbsp;</a>'; if ((dayPointer + startAt) % 7 == startAt) { sHTML += '</tr><tr>'; if ((showWeekNumber == 1) && (datePointer < numDaysInMonth)) { sHTML += '<td align="right">' + (WeekNbr(new Date(yearSelected, monthSelected, datePointer + 1))) + '&nbsp;</td>' } } } document.getElementById('pccontent').innerHTML = sHTML; document.getElementById('pcspanMonth').innerHTML = '&nbsp;' + monthName[language][monthSelected] + '&nbsp;<img id="pcchangeMonth" src="' + imgDir + 'drop1g.png" width="12" height="10" border="0">'; document.getElementById('pcspanYear').innerHTML = '&nbsp;' + yearSelected + '&nbsp;<img id="pcchangeYear" src="' + imgDir + 'drop1g.png" width="12" height="10" border="0">' } function popUpCalendar(a, b, c) { loadArrays(); enablePast = null; var d = 0; var e = 0; if (bPageLoaded) { if (crossobj.visibility == 'hidden') { ctlToPlaceValue = b; dateFormat = c; formatChar = ' '; aFormat = dateFormat.split(formatChar); if (aFormat.length < 3) { formatChar = '/'; aFormat = dateFormat.split(formatChar); if (aFormat.length < 3) { formatChar = '.'; aFormat = dateFormat.split(formatChar); if (aFormat.length < 3) { formatChar = '-'; aFormat = dateFormat.split(formatChar); if (aFormat.length < 3) { formatChar = '' } } } } tokensChanged = 0; if (formatChar != "") { aData = b.value.split(formatChar); for (i = 0; i < 3; i++) { if ((aFormat[i] == "d") || (aFormat[i] == "dd")) { dateSelected = parseInt(aData[i], 10); tokensChanged++ } else if ((aFormat[i] == "m") || (aFormat[i] == "mm")) { monthSelected = parseInt(aData[i], 10) - 1; tokensChanged++ } else if (aFormat[i] == "yyyy") { yearSelected = parseInt(aData[i], 10); tokensChanged++ } else if (aFormat[i] == "mmm") { for (j = 0; j < 12; j++) { if (aData[i] == monthName[language][j]) { monthSelected = j; tokensChanged++ } } } else if (aFormat[i] == "mmmm") { for (j = 0; j < 12; j++) { if (aData[i] == monthName2[language][j]) { monthSelected = j; tokensChanged++ } } } } } var f = ':'; timeString = b.value.split(" "); if (timeString[1] != null) { var g = timeString[1].split(':'); if (g[0].length == 2) { hour = g[0] } if (g[1].length == 2) { minute = g[1] } if (g[2].length == 2) { second = g[2] } } else { hour = 00; minute = 00; second = 00 } if ((tokensChanged != 3) || isNaN(dateSelected) || isNaN(monthSelected) || isNaN(yearSelected)) { dateSelected = dateNow; monthSelected = monthNow; yearSelected = yearNow } odateSelected = dateSelected; omonthSelected = monthSelected; oyearSelected = yearSelected; aTag = a; do { aTag = aTag.offsetParent; d += aTag.offsetLeft; e += aTag.offsetTop } while (aTag.tagName != 'BODY'); crossobj.left = (fixedX == -1) ? a.offsetLeft + d + "px" : fixedX + "px"; crossobj.top = (fixedY == -1) ? a.offsetTop + e + a.offsetHeight + 2 + "px" : fixedY + "px"; constructCalendar(1, monthSelected, yearSelected); crossobj.visibility = (dom || ie) ? "visible" : "show"; hideElement('SELECT', document.getElementById('pccalendar')); hideElement('APPLET', document.getElementById('pccalendar')); bShow = true } else { hideCalendar(); if (ctlNow != a) popUpCalendar(a, b, c) } ctlNow = a } } document.onkeypress = function hidecal1(e) { var a; if (window.event) a = window.event.keyCode; else a = e.which; if (a == 27) hideCalendar() }; document.onclick = function hidecal2() { if (!bShow) hideCalendar(); bShow = false }; if (ie) { init() } else { window.onload = init }
