$(document).ready(function() {
    //    $(":input[id$='ddl_CompanyCode']").change(populateUnitBisnis);
    //    $(":input[id$='ddl_SalesOrg']").attr('disabled', true).removeOption(/./).addOption('', '-- Pilih Unit Bisnis --');
    //    if ($(":input[id$='ddl_CompanyCode']").selectedValues() == '-- Pilih Company Code --') {
    //        $(":input[id$='ddl_SalesOrg']").removeOption(/./).addOption('', '-- Pilih Unit Bisnis --');
    //        $(":input[id$='ddl_SalesOrg']").attr('disabled', true);
    //    }
    //    else {
    //        populateUnitBisnis();
    //        $(":input[id$='ddl_SalesOrg']").selectOptions($(":input[id$='hidden_SalesOrgVal']").val());
    //    }

    if ($(":input[id$='ddl_CompanyCode']").selectedValues() == '-- Pilih Company Code --') {
        $(":input[id$='ddl_SalesOrg']").attr('disabled', true).removeOption(/./).addOption('', '-- Pilih Unit Bisnis --');
    }
    else {
        populateTreeMapping()
        $(":input[id$='ddl_SalesOrg']").change(populateTreeMapping);
        $(":input[id$='ddl_SalesOrg']").attr('disabled', false);
    }
});


function populateUnitBisnis() {
    $(":input[id$='ddl_SalesOrg']").attr('disabled', true).removeOption(/./).addOption('', 'Loading ...');
    populateTreeMapping();
    $.ajax({
        type: "POST",
        url: "/ajax/ajaxCommonData.asmx/populateSalesOrg",
        data: "{companyCode: '" + $(":input[id$='ddl_CompanyCode']").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(response) {
            var results = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (results.length == 0) {
                $(":input[id$='ddl_SalesOrg']").attr('disabled', true).removeOption(/./).addOption('', '-- Pilih Unit Bisnis --');
            } else {
                $(":input[id$='ddl_SalesOrg']").attr('disabled', false).change(populateTreeMapping).removeOption(/./).addOption('', '-- Pilih Unit Bisnis --');
                for (var i = 0; i < results.length; i++) {
                    var val = results[i];
                    var text = results[i];
                    $(":input[id$='ddl_SalesOrg']").addOption(val, text, false);
                }
            }
        }
    });
}
function populateTreeMapping() {
    //    $("#treeMapping").dynatree({
    //        checkbox: true,
    //        selectMode: 3,
    //        fx: { height: "toggle", duration: 200 },
    //        initAjax: {
    //            type: "POST",
    //            contentType: "application/json; charset=utf-8",
    //            url: "/ajax/ajaxCommonData.asmx/getMappingData",
    //            data: "{salesOrg:'" + $(":input[id$='ddl_SalesOrg']").val() + "'}"
    //        }
    //    });
    //    $("#treeMapping").dynatree("getTree").reload();
    $.ajax({
        type: "POST",
        url: "/ajax/ajaxCommonData.asmx/getMappingData",
        data: "{salesOrg:'" + $(":input[id$='ddl_SalesOrg']").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(response) {
            var results = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (results.length == 0) {
                //$("#treeMapping").hide();
                //$("#treeMapping").dynatree("getRoot").removeChildren();
            } else {
                $("#treeMapping").show();
                $("#treeMapping").dynatree({
                    checkbox: true,
                    selectMode: 3,
                    fx: { height: "toggle", duration: 200 },
                    persist: true, // Persist expand-status to a cookie
                    children: results,
                    onPostInit: function(isReloading, isError) {
                        //logMsg("onPostInit(%o, %o)", isReloading, isError);
                        // Re-fire onActivate, so the text is update
                        this.reactivate();
                    }
                });
                $("#treeMapping").dynatree("getTree").reload();
            }
        }
    });
}


function populateFullTreeMapping() {
    $("#fullTreeMapping").dynatree({
        title: "User Profile Data Mapping",
        checkbox: true, // Show checkboxes.
        selectMode: 3, // 1:single, 2:multi, 3:multi-hier
        persist: true, // Persist expand-status to a cookie
        fx: { height: "toggle", duration: 200 },
        initAjax: {
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/ajax/ajaxCommonData.asmx/getFullMappingData"
        }
    });
}