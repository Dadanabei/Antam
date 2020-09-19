//jQuery
$(document).ready(function() {
    $('ul.AspNet-Menu').superfish({
        delay: 50,
        speed: '50',
        animation: { opacity: 'show', height: 'show'}  // fade-in and slide-down animation 
    });
    $('a.jpanel-collapse').click(function() {
        $(this).toggleClass('jpanel-expand').offsetParent().children('div.jpanel-content').stop().animate({ height: ['toggle', 'easeInOutQuart'], opacity: 'toggle' }, 500)
    });
    $('a.jpanel-close').click(function() {
        var msgBox = $(this).offsetParent();
        if ($(this).prev().hasClass('jpanel-expand')) {
            $(msgBox).stop().animate({ height: ['0px', 'linear'], opacity: 0 }, 500, function() {
                $(msgBox).hide();
            });
        } else {
            $(msgBox).children('div.jpanel-content').stop().animate({ height: ['0px', 'easeInQuart'], opacity: 0 }, 500, function() {
                $(msgBox).children('div.jpanel-content').hide();
                $(msgBox).stop().animate({ height: ['0px', 'linear'], opacity: 0 }, 500, function() {
                    $(msgBox).hide();
                });
            });
        }
    });
    // focus on the first input field in the first field on the page
    //$("input[type='text']:first", document.forms[0]).focus();
    $(':text:visible:enabled:first').focus();

    //DateTimeTicking("datetime"); //get client datetime

    $("#datetime").WebClock({
        clockType: "client",
        milliSecond: 1000,
        showSecondTick: true
    });

    //setFooter();
    $("#html-footer").footer();

    $("DIV.AspNet-GridView-Content").fixIEOverflow()

    //Prevent Session TimeOut
    //PingSession(); //initialize PingSession();
});

//function PingSession() {
//    $.ajax({
//        type: "POST",
//        url: "/ajax/ajaxMethod.asmx/PingSession",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function(response) {
//            if (parseInt(response.d) > 0) {
//                setInterval("PingSession()", response.d)
//            } else {
//                alert("Session will time-out approximately in 30 second.");
//            }
//        }
//    });
//}