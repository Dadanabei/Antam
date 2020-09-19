//  ------------------------------------------------------------------------ //
//                             PopCalendar3                                  //
//                    Copyright (c) 2005 alquanto.de                         //
//                       <http://www.alquanto.de/>                           //
//  ------------------------------------------------------------------------ //
//  This program is free software; you can redistribute it and/or modify     //
//  it under the terms of the GNU Lesser General Public License as           //
//  published by the Free Software Foundation; either version 2.1            //
//  of the License, or (at your option) any later version.                   //
//                                                                           //
//  You may not change or alter any portion of this comment or credits       //
//  of supporting developers from this source code or any supporting         //
//  source code which is considered copyrighted (c) material of the          //
//  original comment or credit authors.                                      //
//                                                                           //
//  This program is distributed in the hope that it will be useful,          //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of           //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            //
//  GNU Lesser General Public License for more details.                      //
//                                                                           //
//  You should have received a copy of the GNU Lesser General Public License //
//  along with this program; if not, write to the Free Software              //
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA //
//  ------------------------------------------------------------------------ //
//
// visit http://www.alquanto.de/goodies/popcalendar for updates
//
// TabSize: 4
//
// HISTORY
// 2005-03-08	ALQUANTO		<info at alquanto dot de>
//				* all IDs in html are now prefixed with "pc"
//				* simplier css, no Font-Tags anymore
//				* no support for NS4 anymore (what the hell is that? :-) )
// 2004-09-03	sanjaya
//				* new Language (no)
//				* new feature: added time-boxes (just add "hh:xx:ss" to your dateformat in Showcalendar)
// 2003-07-30	ALQUANTO		<info at alquanto dot de>
//				* german lang included
//				* modified languageLogic with the ISO-2letter-strings
//				* changes in in showCalendar: defaultLanguage is already set...
//				* js and html corrected... more xhtml-compliant... simplier css
// 2003-07-25	PinoToy			<pinotoy at yahoo dot com>
//				* new logic for multiple languages (English, Spanish and ready for more)
//				* changes in popUpMonth & popDownMonth methods for hiding popup
//				* changes in popDownYear & popDownYear methods for hidding popup
//				* new logic for disabling dates in the past
//				* new method showCalendar, dynamic configuration of lang, enabling past & position
//				* changes in the styles
// 2001-12-02	Tan Ling Wee	<fuushikaden at yahoo dot com>
//				* initial version, thanx!

//Jamie Modified
//2010-05-12  : Tweaking for work in ASP.Net MasterPage
//              *  Adding new Language Indonesia
//              *  Dont Use hideElement() or showElement() (remarks/comment)
//              *  Fixed showToday in footer Calendar (currently not showing)
//                 [code -> document.getElementById('pclblToday').innerHTML] in function Popupcalendar()
//              *  Adding new operand
//                 [code -> objParent.tagName.toUpperCase() != 'BODY'] adding:  && objParent.tagName.toUpperCase() != 'HTML'
//                 [code -> aTag.tagName != 'BODY'] adding: && aTag.tagName != 'HTML'
//2010-05-27  : Tweaking z-index to be 2000. for work in jQuery Dialog
//              [code -> document.write('<div onclick="bShow=true" id="pccalendar" style="z-index:+2000;....]
//2010-07-22  : if calendar inside ASP.NET gridview which is div (automatically generated) has scroll
//              then, re-calculate top & left pos
//              [code -> var gvDiv = $(ctl).closest('div');)
//2010-09-20  : Tweaking z-index to be 2000 (before z=index:+999)
//              [code -> <div id="pcselectMonth" style="z-index:+2000;...]
//              [code -> <div id="pcselectYear" style="z-index:+2000;...]

//TO DO : 1. fixed tooltip image in function init() at sHTML1. like scrollLeftMessage[lang],etc..


var lang = 'en'; // Default Language: en - english ; id - Indonesia
var enablePast = 1; 	// 0 - disabled ; 1 - enabled
var fixedX = -1; 	// x position (-1 if to appear below control)
var fixedY = -1; 	// y position (-1 if to appear below control)
var startAt = 1; 	// 0 - sunday ; 1 - monday
var showWeekNumber = 0; // 0 - don't show; 1 - show
var showToday = 1; 	// 0 - don't show; 1 - show
var imgDir = '../../App_Themes/image/calendar/'; // directory for images ... e.g. var imgDir="/img/"
var dayName = '';
var dayName2 = '';
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
    gotoString = {
        en: 'Go To Current Month',
        id: 'ke bulan ini'
    };

    todayString = {
        en: 'Today is : ',
        id: 'Hari ini : '
    };

    weekString = {
        en: 'Wk',
        id: 'Mg'
    };

    scrollLeftMessage = {
        en: 'Click to scroll to previous month. Hold mouse button to scroll automatically.',
        id: 'Klik untuk ke bulan sebelumnya. Tahan tombol mouse untuk ke bulan sebelumnya secara otomatis'
    };

    scrollRightMessage = {
        en: 'Click to scroll to next month. Hold mouse button to scroll automatically.',
        id: 'Klik untuk ke bulan berikutnya. Tahan tombol mouse untuk ke bulan berikutnya secara otomatis'
    };

    selectMonthMessage = {
        en: 'Click to select a month.',
        id: 'Klik untuk pilih bulan.'
    };

    selectYearMessage = {
        en: 'Click to select a year.',
        id: 'Klik untuk pilih tahun.'
    };

    selectDateMessage = {		// do not replace [date], it will be replaced by date.
        en: 'Select [date] as date.',
        id: 'Pilih [date] sebagai tanggal'
    };

    monthName = {
        en: new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
        id: new Array('Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember')
    };

    monthName2 = {
        en: new Array('JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'),
        id: new Array('JAN', 'FEB', 'MAR', 'APR', 'MEI', 'JUN', 'JUL', 'AGU', 'SEP', 'OKT', 'NOV', 'DES')
    };

    if (startAt == 0) {
        dayName = {
            en: new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'),
            id: new Array('Mng', 'Snn', 'Sls', 'Rab', 'Kam', 'Jmt', 'Sbt')
        };
        dayName2 = {
            en: new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'),
            id: new Array('Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')
        };
    } else {
        dayName = {
            en: new Array('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'),
            id: new Array('Snn', 'Sls', 'Rab', 'Kam', 'Jmt', 'Sbt', 'Mng')
        };
        dayName2 = {
            en: new Array('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
            id: new Array('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu')
        };
    }
}

var crossObj, crossMonthObj, crossYearObj, monthSelected, yearSelected, dateSelected, omonthSelected, oyearSelected, odateSelected, monthConstructed, yearConstructed, intervalID1, intervalID2, timeoutID1, timeoutID2, ctlToPlaceValue, ctlNow, dateFormat, nStartingYear, selDayAction, isPast;
var visYear = 0;
var visMonth = 0;
var bPageLoaded = false;
var ie = document.all;
var dom = document.getElementById;
var today = new Date();
var dateNow = today.getDate();
var monthNow = today.getMonth();
var yearNow = today.getYear();
var imgsrc = new Array('drop1.gif', 'drop2.gif', 'left1.gif', 'left2.gif', 'right1.gif', 'right2.gif');
var img = new Array();
var bShow = false;

var hour = 00;
var minute = 00;
var second = 00;
function setHour(VHour) {
    if (VHour.length == 2) {
        hour = VHour;
    } else if (VHour.length == 1) {
        hour = '0' + VHour;
    }

}

function setMinute(VMinute) {
    if (VMinute.length == 2) {
        minute = VMinute;
    } else if (VMinute.length == 1) {
        minute = '0' + VMinute;
    }
}

function setSecond(VSecond) {
    if (VSecond.length == 2) {
        second = VSecond;
    } else if (VSecond.length == 1) {
        second = '0' + VSecond;
    }
}



/* hides <select> and <applet> objects (for IE only) */
function hideElement(elmID, overDiv) {
    if (ie) {
        for (i = 0; i < document.all.tags(elmID).length; i++) {
            obj = document.all.tags(elmID)[i];
            if (!obj || !obj.offsetParent) { continue; }

            // Find the element's offsetTop and offsetLeft relative to the BODY tag.
            objLeft = obj.offsetLeft;
            objTop = obj.offsetTop;
            objParent = obj.offsetParent;

            while (objParent.tagName.toUpperCase() != 'BODY' && objParent.tagName.toUpperCase() != 'HTML') {
                objLeft += objParent.offsetLeft;
                objTop += objParent.offsetTop;
                objParent = objParent.offsetParent;
            }

            objHeight = obj.offsetHeight;
            objWidth = obj.offsetWidth;

            if ((overDiv.offsetLeft + overDiv.offsetWidth) <= objLeft) { }
            else if ((overDiv.offsetTop + overDiv.offsetHeight) <= objTop) { }
            /* CHANGE by Charlie Roche for nested TDs*/
            else if (overDiv.offsetTop >= (objTop + objHeight + obj.height)) { }
            /* END CHANGE */
            else if (overDiv.offsetLeft >= (objLeft + objWidth)) { }
            else {
                obj.style.visibility = 'hidden';
            }
        }
    }
}

/*
* unhides <select> and <applet> objects (for IE only)
*/
function showElement(elmID) {
    if (ie) {
        for (i = 0; i < document.all.tags(elmID).length; i++) {
            obj = document.all.tags(elmID)[i];
            if (!obj || !obj.offsetParent) { continue; }
            obj.style.visibility = '';
        }
    }
}

if (dom) {
    for (i = 0; i < imgsrc.length; i++) {
        img[i] = new Image();
        img[i].src = imgDir + imgsrc[i];
    }
    //document.write('<html><head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15"></head><body>');
    document.write('<div onclick="bShow=true" id="pccalendar" style="z-index:+2000;position:absolute;visibility:hidden;"><table style="width:' + ((showWeekNumber == 1) ? 250 : 220) + 'px;font:11px Arial;border:1px solid #A0A0A0;background:#fff"><tr bgcolor="#000066"><td><table width="' + ((showWeekNumber == 1) ? 248 : 218) + '"><tr><td style="padding:2px;font:bold 11px Arial;color:#fff"><span id="pccaption"></span></td><td align="right"><a href="javascript:hideCalendar()"><img src="' + imgDir + 'close.gif" width="15" height="13" border="0" /></a></td></tr></table></td></tr><tr><td style="padding:5px;background:#fff"><span id="pccontent"></span></td></tr>');

    if (showToday == 1) {
        document.write('<tr bgcolor="#f0f0f0"><td style="padding:5px;text-align:center"><span id="pclblToday"></span></td></tr>');
    }

    document.write('</table></div><div id="pcselectMonth" style="z-index:+2000;position:absolute;visibility:hidden;"></div><div id="pcselectYear" style="z-index:+2000;position:absolute;visibility:hidden;"></div>');
    //document.write('</html></body>');
}

var styleAnchor = 'text-decoration:none;color:black;';
var styleLightBorder = 'border:1px solid #a0a0a0;';

function swapImage(srcImg, destImg) {
    if (ie) { document.getElementById(srcImg).setAttribute('src', imgDir + destImg); }
}

function init() {
    if (!ie) yearNow += 1900;

    crossObj = (dom) ? document.getElementById('pccalendar').style : ie ? document.all.pccalendar : document.pccalendar;
    hideCalendar();

    crossMonthObj = (dom) ? document.getElementById('pcselectMonth').style : ie ? document.all.pcselectMonth : document.pcselectMonth;

    crossYearObj = (dom) ? document.getElementById('pcselectYear').style : ie ? document.all.pcselectYear : document.pcselectYear;

    monthConstructed = false;
    yearConstructed = false;

    sHTML1 = '<span style="border:1px solid #36f;cursor:pointer" onmouseover="swapImage(\'pcchangeLeft\',\'left2.gif\');this.style.borderColor=\'#8af\';window.status=\'' + scrollLeftMessage[lang] + '\'" onclick="decMonth()" onmouseout="clearInterval(intervalID1);swapImage(\'pcchangeLeft\',\'left1.gif\');this.style.borderColor=\'#36f\';window.status=\'\'" onmousedown="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'StartDecMonth()\',500)" onmouseup="clearTimeout(timeoutID1);clearInterval(intervalID1)">&nbsp<img id="pcchangeLeft" src="' + imgDir + 'left1.gif" width="10" height="11" border="0">&nbsp</span>&nbsp;';
    sHTML1 += '<span style="border:1px solid #36f;cursor:pointer" onmouseover="swapImage(\'pcchangeRight\',\'right2.gif\');this.style.borderColor=\'#8af\';window.status=\'' + scrollRightMessage[lang] + '\'" onmouseout="clearInterval(intervalID1);swapImage(\'pcchangeRight\',\'right1.gif\');this.style.borderColor=\'#36f\';window.status=\'\'" onclick="incMonth()" onmousedown="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'StartIncMonth()\',500)" onmouseup="clearTimeout(timeoutID1);clearInterval(intervalID1)">&nbsp<img id="pcchangeRight" src="' + imgDir + 'right1.gif" width="10" height="11" border="0">&nbsp</span>&nbsp;';
    sHTML1 += '<span id="pcspanMonth" style="border:1px solid #36f;cursor:pointer" onmouseover="swapImage(\'pcchangeMonth\',\'drop2.gif\');this.style.borderColor=\'#8af\';window.status=\'' + selectMonthMessage[lang] + '\'" onmouseout="swapImage(\'pcchangeMonth\',\'drop1.gif\');this.style.borderColor=\'#36f\';window.status=\'\'" onclick="popUpMonth()"></span>&nbsp;';
    sHTML1 += '<span id="pcspanYear" style="border:1px solid #36f;cursor:pointer" onmouseover="swapImage(\'pcchangeYear\',\'drop2.gif\');this.style.borderColor=\'#8af\';window.status=\'' + selectYearMessage[lang] + '\'" onmouseout="swapImage(\'pcchangeYear\',\'drop1.gif\');this.style.borderColor=\'#36f\';window.status=\'\'" onclick="popUpYear()"></span>&nbsp;';
    document.getElementById('pccaption').innerHTML = sHTML1;

    bPageLoaded = true;
}

// holidays...
var HolidaysCounter = 0;
var Holidays = new Array();
function HolidayRec(d, m, y, desc) {
    this.d = d;
    this.m = m;
    this.y = y;
    this.desc = desc;
}
function addHoliday(d, m, y, desc) { Holidays[HolidaysCounter++] = new HolidayRec(d, m, y, desc); }


function hideCalendar() {
    crossObj.visibility = 'hidden';
    if (crossMonthObj != null) crossMonthObj.visibility = 'hidden';
    if (crossYearObj != null) crossYearObj.visibility = 'hidden';
    //showElement('SELECT');
    //showElement('APPLET');
}

function padZero(num) {
    return (num < 10) ? '0' + num : num;
}

function constructDate(d, m, y) {
    sTmp = dateFormat;
    sTmp = sTmp.replace('dd', '<e>');
    sTmp = sTmp.replace('d', '<d>');
    sTmp = sTmp.replace('<e>', padZero(d));
    sTmp = sTmp.replace('<d>', d);
    sTmp = sTmp.replace('mmmm', '<p>');
    sTmp = sTmp.replace('mmm', '<o>');
    sTmp = sTmp.replace('mm', '<n>');
    sTmp = sTmp.replace('m', '<m>');
    sTmp = sTmp.replace('<m>', m + 1);
    sTmp = sTmp.replace('<n>', padZero(m + 1));
    sTmp = sTmp.replace('<o>', monthName[lang][m]);
    sTmp = sTmp.replace('<p>', monthName2[lang][m]);
    sTmp = sTmp.replace('yyyy', y);
    sTmp = sTmp.replace('yy', padZero(y % 100));
    sTmp = sTmp.replace('hh', hour);
    sTmp = sTmp.replace('xx', minute);
    sTmp = sTmp.replace('ss', second);
    return sTmp.replace('yy', padZero(y % 100));
}

function closeCalendar() {
    hideCalendar();
    ctlToPlaceValue.value = constructDate(dateSelected, monthSelected, yearSelected);
    //create range text, for place cursor in the last character in TextBox
    if (ctlToPlaceValue.createTextRange) {
        var FieldRange = ctlToPlaceValue.createTextRange();
        FieldRange.moveStart('character', ctlToPlaceValue.value.length);
        FieldRange.collapse();
        FieldRange.select();
    }
    ctlToPlaceValue.focus();
}

/*** Month Pulldown	***/
function StartDecMonth() {
    intervalID1 = setInterval("decMonth()", 80);
}

function StartIncMonth() {
    intervalID1 = setInterval("incMonth()", 80);
}

function incMonth() {
    monthSelected++;
    if (monthSelected > 11) {
        monthSelected = 0;
        yearSelected++;
    }
    constructCalendar();
}

function decMonth() {
    monthSelected--;
    if (monthSelected < 0) {
        monthSelected = 11;
        yearSelected--;
    }
    constructCalendar();
}

function constructMonth() {
    popDownYear();
    if (!monthConstructed) {
        sHTML = "";
        for (i = 0; i < 12; i++) {
            sName = monthName[lang][i];
            if (i == monthSelected) {
                sName = '<b>' + sName + '</b>';
            }
            sHTML += '<tr><td id="m' + i + '" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onclick="monthConstructed=false;monthSelected=' + i + ';constructCalendar();popDownMonth();event.cancelBubble=true">&nbsp;' + sName + '&nbsp;</td></tr>';
        }

        document.getElementById('pcselectMonth').innerHTML = '<table style="width:70px;font:11px Arial;border:1px solid #a0a0a0;" bgcolor="#f0f0f0" cellspacing="0" onmouseover="clearTimeout(timeoutID1)" onmouseout="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'popDownMonth()\',100);event.cancelBubble=true">' + sHTML + '</table>';

        monthConstructed = true;
    }
}

function popUpMonth() {
    if (visMonth == 1) {
        popDownMonth();
        visMonth--;
    } else {
        constructMonth();
        crossMonthObj.visibility = (dom || ie) ? 'visible' : 'show';
        crossMonthObj.left = parseInt(crossObj.left) + 50 + "px";
        crossMonthObj.top = parseInt(crossObj.top) + 26 + "px";
        //hideElement('SELECT', document.getElementById('pcselectMonth'));
        //hideElement('APPLET', document.getElementById('pcselectMonth'));
        visMonth++;
    }
}

function popDownMonth() {
    crossMonthObj.visibility = 'hidden';
    visMonth = 0;
}

/*** Year Pulldown ***/
function incYear() {
    for (i = 0; i < 7; i++) {
        newYear = (i + nStartingYear) + 1;
        if (newYear == yearSelected) {
            txtYear = '<span style="color:#006;font-weight:bold;">&nbsp;' + newYear + '&nbsp;</span>';
        }
        else {
            txtYear = '<span style="color:#006">&nbsp;' + newYear + '&nbsp;</span>';
        }
        document.getElementById('y' + i).innerHTML = txtYear;
    }
    nStartingYear++;
    bShow = true;
}

function decYear() {
    for (i = 0; i < 7; i++) {
        newYear = (i + nStartingYear) - 1;
        if (newYear == yearSelected) {
            txtYear = '<span style="color:#006;font-weight:bold">&nbsp;' + newYear + '&nbsp;</span>';
        }
        else {
            txtYear = '<span style="color:#006;">&nbsp;' + newYear + '&nbsp;</span>';
        }
        document.getElementById('y' + i).innerHTML = txtYear;
    }
    nStartingYear--;
    bShow = true;
}

function selectYear(nYear) {
    yearSelected = parseInt(nYear + nStartingYear);
    yearConstructed = false;
    constructCalendar();
    popDownYear();
}

function constructYear() {
    popDownMonth();
    sHTML = '';
    if (!yearConstructed) {
        sHTML = '<tr><td align="center" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="clearInterval(intervalID1);this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onmousedown="clearInterval(intervalID1);intervalID1=setInterval(\'decYear()\',30)" onmouseup="clearInterval(intervalID1)">-</td></tr>';

        j = 0;
        nStartingYear = yearSelected - 3;
        for (i = (yearSelected - 3); i <= (yearSelected + 3); i++) {
            sName = i;
            if (i == yearSelected) sName = '<b>' + sName + '</b>';
            sHTML += '<tr><td id="y' + j + '" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onclick="selectYear(' + j + ');event.cancelBubble=true">&nbsp;' + sName + '&nbsp;</td></tr>';
            j++;
        }

        sHTML += '<tr><td align="center" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="clearInterval(intervalID2);this.style.backgroundColor=\'\'" style="cursor:pointer;color:#006" onmousedown="clearInterval(intervalID2);intervalID2=setInterval(\'incYear()\',30)" onmouseup="clearInterval(intervalID2)">+</td></tr>';

        document.getElementById('pcselectYear').innerHTML = '<table width="44" cellspacing="0" style="font:11px Arial;border:1px solid #a0a0a0;background:#f0f0f0" onmouseover="clearTimeout(timeoutID2)" onmouseout="clearTimeout(timeoutID2);timeoutID2=setTimeout(\'popDownYear()\',100)">' + sHTML + '</table>';

        yearConstructed = true;
    }
}

function popDownYear() {
    clearInterval(intervalID1);
    clearTimeout(timeoutID1);
    clearInterval(intervalID2);
    clearTimeout(timeoutID2);
    crossYearObj.visibility = 'hidden';
    visYear = 0;
}

function popUpYear() {
    var leftOffset;
    if (visYear == 1) {
        popDownYear();
        visYear--;
    } else {
        constructYear();
        crossYearObj.visibility = (dom || ie) ? 'visible' : 'show';
        leftOffset = parseInt(crossObj.left) + document.getElementById('pcspanYear').offsetLeft;
        if (ie) leftOffset += 6;
        crossYearObj.left = leftOffset + "px";
        crossYearObj.top = parseInt(crossObj.top) + 26 + "px";
        visYear++;
    }
}

/*** calendar ***/
function WeekNbr(n) {
    // Algorithm used:
    // From Klaus Tondering's Calendar document (The Authority/Guru)
    // http://www.tondering.dk/claus/calendar.html
    // a = (14-month) / 12
    // y = year + 4800 - a
    // m = month + 12a - 3
    // J = day + (153m + 2) / 5 + 365y + y / 4 - y / 100 + y / 400 - 32045
    // d4 = (J + 31741 - (J mod 7)) mod 146097 mod 36524 mod 1461
    // L = d4 / 1460
    // d1 = ((d4 - L) mod 365) + L
    // WeekNumber = d1 / 7 + 1

    year = n.getFullYear();
    month = n.getMonth() + 1;
    if (startAt == 0) {
        day = n.getDate() + 1;
    } else {
        day = n.getDate();
    }

    a = Math.floor((14 - month) / 12);
    y = year + 4800 - a;
    m = month + 12 * a - 3;
    b = Math.floor(y / 4) - Math.floor(y / 100) + Math.floor(y / 400);
    J = day + Math.floor((153 * m + 2) / 5) + 365 * y + b - 32045;
    d4 = (((J + 31741 - (J % 7)) % 146097) % 36524) % 1461;
    L = Math.floor(d4 / 1460);
    d1 = ((d4 - L) % 365) + L;
    week = Math.floor(d1 / 7) + 1;

    return week;
}

function constructCalendar() {
    var aNumDays = new Array(31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var dateMessage;
    var startDate = new Date(yearSelected, monthSelected, 1);
    var endDate;

    if (monthSelected == 1) {
        endDate = new Date(yearSelected, monthSelected + 1, 1);
        endDate = new Date(endDate - (24 * 60 * 60 * 1000));
        numDaysInMonth = endDate.getDate();
    } else {
        numDaysInMonth = aNumDays[monthSelected];
    }

    datePointer = 0;
    dayPointer = startDate.getDay() - startAt;

    if (dayPointer < 0) dayPointer = 6;

    sHTML = '<table style="border:0;font:10px verdana;"><tr>';

    if (showWeekNumber == 1) {
        sHTML += '<td width="27"><strong>' + weekString[lang] + '</strong></td><td width="1" rowspan="7" style="background:#d0d0d0;padding:0"><img src="' + imgDir + 'divider.gif" width="1"></td>';
    }

    for (i = 0; i < 7; i++) {
        sHTML += '<td style="width:27px;text-align:right;color:#006;font-weight:bold">' + dayName[lang][i] + '</td>';
    }

    sHTML += '</tr><tr>';

    if (showWeekNumber == 1) {
        sHTML += '<td align="right">' + WeekNbr(startDate) + '&nbsp;</td>';
    }

    for (var i = 1; i <= dayPointer; i++) {
        sHTML += '<td>&nbsp;</td>';
    }

    for (datePointer = 1; datePointer <= numDaysInMonth; datePointer++) {
        dayPointer++;
        sHTML += '<td align="right">';
        sStyle = styleAnchor;
        if ((datePointer == odateSelected) && (monthSelected == omonthSelected) && (yearSelected == oyearSelected))
        { sStyle += styleLightBorder; }

        sHint = '';
        for (k = 0; k < HolidaysCounter; k++) {		// insert holidays
            if ((parseInt(Holidays[k].d) == datePointer) && (parseInt(Holidays[k].m) == (monthSelected + 1))) {
                if ((parseInt(Holidays[k].y) == 0) || ((parseInt(Holidays[k].y) == yearSelected) && (parseInt(Holidays[k].y) != 0))) {
                    sStyle += 'background-color:#fdd;';
                    sHint += sHint == "" ? Holidays[k].desc : "\n" + Holidays[k].desc;
                }
            }
        }

        sHint = sHint.replace('/\"/g', '&quot;');

        dateMessage = 'onmousemove="window.status=\'' + selectDateMessage[lang].replace('[date]', constructDate(datePointer, monthSelected, yearSelected)) + '\'" onmouseout="window.status=\'\'" ';


        //////////////////////////////////////////////
        //////////  Modifications PinoToy  //////////
        //////////////////////////////////////////////
        if (enablePast == 0 && ((yearSelected < yearNow) || (monthSelected < monthNow) && (yearSelected == yearNow) || (datePointer < dateNow) && (monthSelected == monthNow) && (yearSelected == yearNow))) {
            selDayAction = '';
            isPast = 1;
        } else {
            selDayAction = 'href="javascript:dateSelected=' + datePointer + ';closeCalendar();"';
            isPast = 0;
        }

        sHTML += '<a ' + dateMessage + ' title="' + sHint + '" style="' + sStyle;

        if ((datePointer == dateNow) && (monthSelected == monthNow) && (yearSelected == yearNow)) {
            sHTML += 'font-weight:bold;color:red;" '; 		// today
        } else if (dayPointer % 7 == (startAt * -1) + 1) {
            if (isPast == 1)										// sunday
            {
                sHTML += 'color:#909090;" ';
            }
            else {
                sHTML += 'color:#54A6E2;" ';
            }
        } else if ((dayPointer % 7 == (startAt * -1) + 7 && startAt == 1) || (dayPointer % 7 == startAt && startAt == 0)) {
            if (isPast == 1)										// saturday
            {
                sHTML += 'color:#909090;" ';
            }
            else {
                sHTML += 'color:#54A6E2;" ';
            }
        } else {
            if (isPast == 1)										// all other days
            {
                sHTML += 'color:#909090;" ';
            }
            else {
                sHTML += 'color:#006;" ';
            }
        }
        sHTML += selDayAction + '>&nbsp;' + datePointer + '&nbsp;</a>';

        if ((dayPointer + startAt) % 7 == startAt) {
            sHTML += '</tr><tr>';
            if ((showWeekNumber == 1) && (datePointer < numDaysInMonth)) {
                sHTML += '<td align="right">' + (WeekNbr(new Date(yearSelected, monthSelected, datePointer + 1))) + '&nbsp;</td>';
            }
        }
    }
    document.getElementById('pccontent').innerHTML = sHTML;
    document.getElementById('pcspanMonth').innerHTML = '&nbsp;' + monthName[lang][monthSelected] + '&nbsp;<img id="pcchangeMonth" src="' + imgDir + 'drop1.gif" width="12" height="10" border="0">';
    document.getElementById('pcspanYear').innerHTML = '&nbsp;' + yearSelected + '&nbsp;<img id="pcchangeYear" src="' + imgDir + 'drop1.gif" width="12" height="10" border="0">';
}

function popUpCalendar(ctl, ctl2, format) {
    loadArrays();
    //enable backdate
    //enablePast = null;
    var leftpos = 0;
    var toppos = 0;

    if (bPageLoaded) {
        if (crossObj.visibility == 'hidden') {
            ctlToPlaceValue = ctl2;
            dateFormat = format;
            formatChar = ' ';
            aFormat = dateFormat.split(formatChar);
            if (aFormat.length < 3) {
                formatChar = '/';
                aFormat = dateFormat.split(formatChar);
                if (aFormat.length < 3) {
                    formatChar = '.';
                    aFormat = dateFormat.split(formatChar);
                    if (aFormat.length < 3) {
                        formatChar = '-';
                        aFormat = dateFormat.split(formatChar);
                        if (aFormat.length < 3) {
                            formatChar = ''; 				// invalid date format

                        }
                    }
                }
            }

            tokensChanged = 0;
            if (formatChar != "") {
                aData = ctl2.value.split(formatChar); 		// use user's date

                for (i = 0; i < 3; i++) {
                    if ((aFormat[i] == "d") || (aFormat[i] == "dd")) {
                        dateSelected = parseInt(aData[i], 10);
                        tokensChanged++;
                    } else if ((aFormat[i] == "m") || (aFormat[i] == "mm")) {
                        monthSelected = parseInt(aData[i], 10) - 1;
                        tokensChanged++;
                    } else if (aFormat[i] == "yyyy") {
                        yearSelected = parseInt(aData[i], 10);
                        tokensChanged++;
                    } else if (aFormat[i] == "mmm") {
                        for (j = 0; j < 12; j++) {
                            if (aData[i] == monthName[lang][j]) {
                                monthSelected = j;
                                tokensChanged++;
                            }
                        }
                    } else if (aFormat[i] == "mmmm") {
                        for (j = 0; j < 12; j++) {
                            if (aData[i] == monthName2[lang][j]) {
                                monthSelected = j;
                                tokensChanged++;
                            }
                        }
                    }
                }
            }
            var TimeFormatChar = ':';
            timeString = ctl2.value.split(" ");
            if (timeString[1] != null) {
                var timeTokens = timeString[1].split(':');
                if (timeTokens[0].length == 2) {
                    hour = timeTokens[0];
                }
                if (timeTokens[1].length == 2) {
                    minute = timeTokens[1];
                }
                if (timeTokens[2].length == 2) {
                    second = timeTokens[2];
                }
            } else {
                hour = 00;
                minute = 00;
                second = 00;
            }


            if ((tokensChanged != 3) || isNaN(dateSelected) || isNaN(monthSelected) || isNaN(yearSelected)) {
                dateSelected = dateNow;
                monthSelected = monthNow;
                yearSelected = yearNow;
            }

            odateSelected = dateSelected;
            omonthSelected = monthSelected;
            oyearSelected = yearSelected;

            aTag = ctl;
            do {
                aTag = aTag.offsetParent;
                leftpos += aTag.offsetLeft;
                toppos += aTag.offsetTop;
            } while (aTag.tagName != 'BODY' && aTag.tagName != 'HTML');

            //if calendar inside ASP.NET gridview which is div (automatically generated) has scroll
            //re-calculate top & left pos
            var gvDiv = $(ctl).closest('.gridview').parent();
            if ($(gvDiv).length > 0) {
                if (gvDiv[0].scrollTop && gvDiv[0].scrollTop > 0) {
                    toppos -= gvDiv[0].scrollTop;
                }
                if (gvDiv[0].scrollLeft && gvDiv[0].scrollLeft > 0) {
                    leftpos -= gvDiv[0].scrollLeft;
                }
            }

            crossObj.left = (fixedX == -1) ? ctl.offsetLeft + leftpos + "px" : fixedX + "px";
            crossObj.top = (fixedY == -1) ? ctl.offsetTop + toppos + ctl.offsetHeight + 2 + "px" : fixedY + "px";
            constructCalendar(1, monthSelected, yearSelected);
            crossObj.visibility = (dom || ie) ? "visible" : "show";

            //hideElement('SELECT', document.getElementById('pccalendar'));
            //hideElement('APPLET', document.getElementById('pccalendar'));

            if (showToday == 1) {
                document.getElementById('pclblToday').innerHTML = todayString[lang] + " <a onmousemove='window.status=\"" + gotoString[lang] + "\"' onmouseout='window.status=\"\"' title='" + gotoString[lang] + "' style='" + styleAnchor + "' href='javascript:monthSelected=monthNow;yearSelected=yearNow;constructCalendar();'>" + dayName[lang][(today.getDay() - startAt == -1) ? 6 : (today.getDay() - startAt)] + ", " + dateNow + " " + monthName[lang][monthNow].substring(0, 3) + "   " + yearNow + "</a>";
            }

            bShow = true;
        } else {
            hideCalendar();
            if (ctlNow != ctl) popUpCalendar(ctl, ctl2, format);
        }
        ctlNow = ctl;
    }
}

document.onkeypress = function hidecal1(e) {
    var keyPressed;
    if (window.event)
        keyPressed = window.event.keyCode; // IE
    else
        keyPressed = e.which;
    if (keyPressed == 27) hideCalendar();
};
document.onclick = function hidecal2() {
    if (!bShow) hideCalendar();
    bShow = false;
};

if (ie) {
    init();
} else {
    window.onload = init();
}