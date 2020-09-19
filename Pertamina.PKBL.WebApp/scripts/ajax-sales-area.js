$(document).ready(function() {
    if ($(":input[id$='ddl_UnitBisnis']").selectedValues() == '-- Pilih Unit Bisnis --') {
        $(":input[id$='ddl_RegionUnitBisnis']").removeOption(/./).addOption('', '-- Pilih Region Unit Bisnis --');
        $(":input[id$='ddl_CustomerGroup']").removeOption(/./).addOption('', '-- Pilih Customer Group --');

        $(":input[id$='ddl_RegionUnitBisnis']").attr('disabled', true);
        $(":input[id$='ddl_CustomerGroup']").attr('disabled', true);

        $(":input[id$='ddl_UnitBisnis']").change(getRegionUnitBisnis);
        $(":input[id$='ddl_RegionUnitBisnis']").change(getCustomerGroup);
        $(":input[id$='ddl_CustomerGroup']").change(finishCascadeSelection);
    }
    else {
        $(":input[id$='ddl_UnitBisnis']").val($(":input[id$='hide_UB']").val());
        $(":input[id$='ddl_RegionUnitBisnis']").val($(":input[id$='hide_RUB']").val());
        $(":input[id$='ddl_CustomerGroup']").val($(":input[id$='hide_CG']").val());
        getRegionUnitBisnis(); //getCustomerGroup(); finishCascadeSelection();
    }
});

function setSelectedRegionUnitBisnis() {
    var values = $(":input[id$='ddl_RegionUnitBisnis']").selectedValues();
    $(":input[id$='hide_RUB']").val(values);
}

function getRegionUnitBisnis() {
    $(":input[id$='ddl_RegionUnitBisnis']").removeOption(/./).addOption('', 'Loading ...');
    $.ajax({
        type: "POST",
        url: "/ajax/ajaxSalesArea.asmx/GetDivision",
        data: "{distributionChannel: '" + $(":input[id$='ddl_UnitBisnis']").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(response) {
            var results = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (results.length == 0) {
                $(":input[id$='ddl_RegionUnitBisnis']").attr('disabled', true).removeOption(/./).addOption('', '-- Pilih Region Unit Bisnis --');
                $(":input[id$='ddl_CustomerGroup']").attr('disabled', true).removeOption(/./).addOption('', '-- Pilih Customer Group --');
                $(":input[id$='hide_RUB']").val('');
                $(":input[id$='hide_CG']").val('');
            } else {
            $(":input[id$='ddl_RegionUnitBisnis']").attr('disabled', false).change(getCustomerGroup).removeOption(/./).addOption('', '-- Pilih Region Unit Bisnis --');
                for (var i = 0; i < results.length; i++) {
                    var val = results[i];
                    var text = results[i];
                    $(":input[id$='ddl_RegionUnitBisnis']").addOption(val, text, false);
                }
                $(":input[id$='hide_UB']").val($(":input[id$='ddl_UnitBisnis']").selectedValues());
            }
        }
    });
}
function getCustomerGroup() {
    $.ajax({
        type: "POST",
        url: "/ajax/ajaxSalesArea.asmx/GetCustomerGroup",
        data: "{distributionChannel: '" + $(":input[id$='ddl_UnitBisnis']").val() + "', division: '" + $(":input[id$='ddl_RegionUnitBisnis']").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(response) {
            var results = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (results.length == 0) {
                $(":input[id$='ddl_CustomerGroup']").attr('disabled', true).removeOption(/./).addOption('', '-- Pilih Customer Group --');
                $(":input[id$='hide_CG']").val('');
            } else {
                $(":input[id$='ddl_CustomerGroup']").attr('disabled', false).removeOption(/./).addOption('', '-- Pilih Customer Group --');
                for (var i = 0; i < results.length; i++) {
                    var val = results[i];
                    var text = results[i];
                    $(":input[id$='ddl_CustomerGroup']").addOption(val, text, false);
                }
                $(":input[id$='hide_RUB']").val($(":input[id$='ddl_RegionUnitBisnis']").selectedValues());
            }
        }
    });
}

function finishCascadeSelection() {
    $(":input[id$='hide_CG']").val($(":input[id$='ddl_CustomerGroup']").selectedValues());
}