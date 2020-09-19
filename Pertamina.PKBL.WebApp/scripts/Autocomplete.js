


$(document).ready(function () {
    $(".searchinput").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../../service/MaterialDataService.asmx/GetAllNoun",
                data: "{'Keyword':'" + request.term + "'}",
                dataType: "json",
                async: true,
                success: function (data){
                    response(data.d);
                },
                error: function (result) {
                    alert("Due to unexpected errors we were unable to load data");
                }
                
            });
        },
        minLength: 2
    });
});

$(document).ready(function () {

    $(".searchModifier").autocomplete({
          
        source: function (request, response) {
           
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../../service/MaterialDataService.asmx/GetAllModifier",
                data: "{'Keyword':'" + request.term + "','Noun':'" + $("input[name$='txbNoun']").val() + "'}",

                dataType: "json",
                async: true,
                success: function (data) {
                    response(data.d);
                },
                error: function (result) {
                    alert("Due to unexpected errors we were unable to load data");
                }
                
            });
        },
        minLength: 1
    });
});


