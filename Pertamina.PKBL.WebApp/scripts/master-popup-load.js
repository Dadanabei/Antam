//jQuery
$(document).ready(function () {
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
    PingSession(); //initialize PingSession();
});

function PingSession() {
    $.ajax({
        type: "POST",
        url: "/ajax/ajaxMethod.asmx/PingSession",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (parseInt(response.d) > 0) {
                setInterval("PingSession()", response.d)
            } else {
                alert("Session will time-out approximately in 30 second.");
            }
        }
    });
}