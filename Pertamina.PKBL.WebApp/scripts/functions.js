/* Function untuk menghitung Mandays
rumus: Mandays=Duration*Man required
  
*/
function EmptyThis(index) {
    var index;

    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var equi = document.getElementById("ctl00_html_container_gv_SelectAny_ctl" + newID + "_EquipmentNumber");
    if (equi.value != "") {

        equi.value = "";
    }
    else {
        equi.value = "";
    }
}
function GetPackage(index) {
    var index;
    var i;

    var groupcounterlist = [];
    var currentList = [];
    var Header = document.getElementById("ctl00_html_container_gv_CreateTasklistHeader");
    var HeaderNumRow = 10;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var currGroupCounter = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_GroupCounter").value;
    for (i = 0; i <= HeaderNumRow;i++) {
        var n = i + 2;
        if (n.toString().length == 1) {
            var theID = "0" + n.toString();
        }
        else {
            var theID = n.toString();
        }
        var groupCounterValue = document.getElementById("ctl00_html_container_gv_CreateTasklistHeader_ctl" + theID + "_GroupCounter").value;
        groupcounterlist.push(groupCounterValue);
        var currentList = groupcounterlist;
        if (currentList[i] == currGroupCounter) {
            var x = i + 2;
            if (x.toString().length == 1) {
                var myID = "0" + x.toString();
            }
            else {
                var myID = x.toString();
            }
            var Strategy = document.getElementById("ctl00_html_container_gv_CreateTasklistHeader_ctl" + myID + "_MaintenanceStrategy").value;
            //  alert(Strategy);
            var parentField = "ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_Package1";
            window.open("../../PopUpDisplay/DisplayMaintenancePackageList.aspx?parentField=" + parentField + "&MaintStr=" + Strategy + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;
        }
     }
}
function UpperCasePlease(index) {
    var index;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var equi = document.getElementById("ctl00_html_container_gv_createEquipmentDE_ctl" + newID + "_EquipmentNumber").value;

    var upper = equi.toUpperCase();
    document.getElementById("ctl00_html_container_gv_createEquipmentDE_ctl" + newID + "_EquipmentNumber").value = upper;
}
function DisplaySelectAny(IDinitial, IDselectAny) {
    var IDinitial = document.getElementById("ctl00_html_container_pnl_MainInitialView");
    var IDselectAny = document.getElementById("ctl00_html_container_pnl_SelectAny");
    var tabel = document.getElementById("ctl00_html_container_tbl_SelectAny");
    var i;
    IDinitial.style.visibility = "hidden";
    IDselectAny.style.visibility = "visible";

}
function AddRow(id) {

    var table = document.getElementById("ctl00_html_container_test");
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell2 = row.insertCell(0);
    cell2.innerHTML = rowCount;

    var cell1 = row.insertCell(1);
    var element1 = document.createElement("input");
    element1.type = "checkbox";
    cell1.appendChild(element1);

    var cell3 = row.insertCell(2);
    var element2 = document.createElement("input");
    element2.type = "text";
    element2.id = "ctl00_html_container_equipment";
    cell3.appendChild(element2);
}
function calculateManReq(index) {
    // alert("index = "+index);
    var index;

    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var duration = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_Duration");
    var reqCapacity = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_CapacityRequired");
    var mandays = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_Mandays");

    if (duration.value != null && reqCapacity != null) {
        var Total = (parseInt(duration.value) * parseInt(reqCapacity.value));
    }
    else {
        var Total = 0;
    }
    mandays.value = Total;
}
function calculateDuration(index) {
    // alert("index = "+index);
    var index;

    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var duration = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_Duration");
    var reqCapacity = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_CapacityRequired");
    var mandays = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_Mandays");

    if (duration.value != null && reqCapacity != null) {
        var Total = (parseInt(duration.value) * parseInt(reqCapacity.value));

    }
    else {
        var Total = 0;
    }
    mandays.value = Total;
}
/* Function untuk membulatkan bilangan */
function MathRound(number) {
    return Math.round(number * 100) / 100;
}

function CheckPackage(index) {
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var Pack = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_Package1");
    var PackInt=parseInt(Pack.value);
    var PackUnit = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_PackageUnit");
    var PackUnitStr = PackUnit.value.toString();
    var IsPackageUnitValid = true;

    if (PackUnit.value == "Select") {
        var IsPackageUnitValid = true;
    }
    else {
        switch (PackUnitStr) {
            case "W":
                if (PackInt > 4) {
                    IsPackageUnitValid = false;
                }
                else {
                    IsPackageUnitValid = true;
                }
                break;

            case "M":
                if (PackInt > 11) {
                    IsPackageUnitValid = false;
                }
                else {
                    IsPackageUnitValid = true;
                }
                break;

            case "Y":
                IsPackageUnitValid = true;
                break;
        }
    }
    if (IsPackageUnitValid == true) {
        Pack.style.background = "#fee391";
    }
    else {
        Pack.style.background = "#ff0000";
    }
}


/* Function untuk mengikat dependensi thd Plant*/
function GetPlant() {
    var plant = document.getElementById("ctl00_html_container_MaintPlant").value;
    if (plant != "") {
        var parentField = "ctl00_html_container_SuperiorFL";
        window.open("../../PopUpDisplay/DisplayFuncLocation.aspx?parentField=" + parentField + "&Plant=" + plant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;
     
    }
 else {
     alert("Plant not defined!");
    }

}
function DisplayFL(plant,parentField) {
    var plant = document.getElementById(plant).value;
    if (plant != "") {
        //var parentField = "ctl00_html_container_SuperiorFL";
        window.open("../../PopUpDisplay/DisplayFuncLocation.aspx?parentField=" + parentField + "&Plant=" + plant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;

    }
    else {
        alert("Plant not defined!");
    }

}
function DisplayPlant() {
   // var menu;
  
        var Parent = "ctl00_html_container_InitialObject";
        var Plant = document.getElementById("ctl00_html_container_InitialPlant").value;
        if (Plant != "") {
            window.open("../../PopUpDisplay/DisplayEquipment.aspx?parentField=" + Parent + "&Plant=" + Plant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;
        }
        else {
            alert("Plant not defined");
        }
     
}

function GetPlantfromPlantName(Plant) {

  //  var plant = Plant.innerText;
    var plant = document.getElementById("ctl00_html_container_MaintPlant").value;
    if (plant != "") {
        var parentField = "ctl00_html_container_SuperiorFL";
        window.open("../../PopUpDisplay/DisplayFuncLocation.aspx?parentField=" + parentField + "&Plant=" + plant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;
       
    }
    else {
        alert("Plant not defined!");
    }

}
function getPlannerGroupByPlant(index) {

    var index;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var thePlant = document.getElementById("ctl00_html_container_gv_createTaskListHeader_ctl" + newID + "_PlanningPlant").value;
    var parentField = "ctl00_html_container_gv_createTaskListHeader_ctl" + newID + "_PlannerGroup";
    window.open("../../PopUpDisplay/DisplayPlannerGroup.aspx?parentField=" + parentField + "&Plant=" + thePlant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", "");  return false;
   
}

function getPlannerGroupByPlanteq(index) {

    var index;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var thePlant = document.getElementById("ctl00_html_container_gv_createEquipmentDE_ctl" + newID + "_PlanningPlant").value;
    var parentField = "ctl00_html_container_gv_createEquipmentDE_ctl" + newID + "_PlannerGroup";
    window.open("../../PopUpDisplay/DisplayPlannerGroup.aspx?parentField=" + parentField + "&Plant=" + thePlant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", "");
    return false;
}

function getWorkCenterByPlant(index) {

    var index;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var thePlant = document.getElementById("ctl00_html_container_gv_createTaskListHeader_ctl" + newID + "_PlanningPlant").value;
    var parentField = "ctl00_html_container_gv_createTaskListHeader_ctl" + newID + "_WorkCenter";
    window.open("../../PopUpDisplay/DisplayWorkCenter.aspx?parentField=" + parentField + "&Plant=" + thePlant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", "");
    return false;
}


//function setThisAsOperation(index) {
//    var index;
//    var counter = 10;
//    if (index == "0") {//baris pertama
//        var check = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_chk_IsOperation"); //checkbox baris pertama

//        var initCounter = 10; //counter baris pertama
//        var initGroupCtr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_GroupCounter").value; //groupcounter baris pertama
//        if (check.checked == true) {
//         
//            document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_TaskListOperation").value = "00" + counter;
//        }
//        else {
//           
//            document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_TaskListOperation").value = "0000";
//            
//        }
//    }
//    else {//bari ke-2 dst
//       
//        var lastCounter = 0;
//        var id = index + 2; if (id.toString().length == 1) { var stringID = "0" + id.toString(); } else { var stringID = id.toString(); }
//        var idprev = id - 1; if (idprev.toString().length == 1) { var stringIDPrev = "0" + idprev.toString(); } else { var stringIDPrev = idprev.toString(); }
//        var groupCtr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_GroupCounter").value;
//        var groupCtrPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_GroupCounter").value;
//        var checkbox = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_chk_IsOperation");
//        
//        if (groupCtr == groupCtrPrev) {
//            // alert("compare" + groupCtr + " dengan " + groupCtrPrev + "");
//            if (checkbox.checked == true) {
//                //alert("checked"+index);
//                var prevOpr = parseFloat(document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_TaskListOperation").value);
//                var currOpr = prevOpr + 10;
//                var lastCounter = lastCounter + currOpr;
//                var stringcurrOpr = "00" + lastCounter.toString();
//               
//                document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation").value = stringcurrOpr;

//            }
//            else {
//              
//                document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation").value = "0000";
//            }
//        }
//        else {
//            if (checkbox.checked == true) {
//               
//                var stringcurrOpr = "0000"
//                
//                document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation").value = stringcurrOpr;
//            }
//            else {
//              
//                document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation").value = "0000";
//            }
//        }
//    }
//}

//function setThisAsSubOperation(index) {

//    var firstOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_TaskListOperation");
//    var firstSubOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_SubOperation");
//    var firstCheckBox = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_chk_IsSubOperation");

//    var index;

//    if (index == "0") {
//        firstOpr.value = "0010";
//        firstSubOpr.value = "0000";

//    }
//    else {
//        var id = index + 2; if (id.toString().length == 1) { var stringID = "0" + id.toString(); } else { var stringID = id.toString(); }
//        var idprev = id - 1; if (idprev.toString().length == 1) { var stringIDPrev = "0" + idprev.toString(); } else { var stringIDPrev = idprev.toString(); }
//        var groupCtr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_GroupCounter");
//        var groupCtrPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_GroupCounter");
//        var Operation = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation");
//        var operationPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_TaskListOperation");
//        var subOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_SubOperation");
//        var subOprPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_SubOperation");
//        var checkboxPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_chk_IsSubOperation");
//        var checkbox = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_chk_IsSubOperation");
//        if (checkbox.checked == false) {
//            Operation.value = "0010";
//            subOpr.value = "0000";
//            groupCtr.value = "1";
//            Operation.style.background = "#fee391";
//            subOpr.style.background = "#fee391";
//            groupCtr.style.background = "#fee391";
//        }
//        if (checkboxPrev.checked == true) {
//            Operation.style.background = "#fee391";
//            subOpr.style.background = "#fee391";
//            if (groupCtr.value == groupCtrPrev.value && Operation.value == operationPrev.value) {
//                if (subOprPrev.value != "error") {
//                    if (checkbox.checked == true) {
//                        var lastCounter = parseFloat(subOprPrev.value);
//                        var lastCounter = lastCounter + 10;
//                        var lastCounterLength = lastCounter.toString().length;
//                        switch (lastCounterLength) {
//                            case 2:
//                                var stringcurrSubOpr = "00" + lastCounter.toString();
//                                break;
//                            case 3:
//                                var stringcurrSubOpr = "0" + lastCounter.toString();
//                                break;
//                            case 4:
//                                var stringcurrSubOpr = lastCounter.toString();
//                                break;
//                        }
//                        subOpr.value = stringcurrSubOpr;
//                    }
//                    else {
//                        subOpr.value = "0000";
//                    }
//                }

//                else {
//                    if (checkbox.checked == true) {
//                        subOpr.value = "error";
//                        subOpr.style.background = "#ff0000";
//                    }
//                    else {
//                        subOpr.value = "0000";
//                        subOpr.style.background = "#fee391";
//                    }

//                }

//            }
//            else if (groupCtr.value == groupCtrPrev.value && Operation.value != operationPrev.value) {
//                var numOpr = parseFloat(Operation.value);
//                var numSubOpr = parseFloat(operationPrev.value);
//                if (numSubOpr > numOpr) {
//                    if (checkbox.checked == true) {
//                        subOpr.value = "error";
//                        Operation.style.background = "#ff0000";
//                    }
//                    else {
//                        subOpr.value = "0000";
//                        Operation.style.background = "#fee391";
//                    }
//                }
//                else {
//                    if (subOprPrev.value == "0000") {
//                        if (checkbox.checked == true) {
//                            subOpr.value = "error";
//                            Operation.style.background = "#ff0000";
//                        }
//                        else {
//                            subOpr.value = "0000";
//                            Operation.style.background = "#fee391";
//                        }
//                    }
//                    else {
//                        Operation.style.background = "#fee391";
//                    }
//                }

//            }
//            else if (groupCtr.value != groupCtrPrev.value) {
//                var GCPrevValue = parseInt(groupCtrPrev.value);
//                var GCvalue = parseInt(groupCtr.value);
//                var adder = GCPrevValue + 1;
//                if (GCvalue > adder) {
//                    if (checkbox.checked == true)
//                    {
//                    subOpr.value = "error";
//                    groupCtr.style.background = "#ff0000";
//                    }
//                    else{
//                        subOpr.value = "0000";
//                        groupCtr.value = "1";
//                        groupCtr.style.background = "#fee391";
//                    }
//                }
//                else if (GCvalue < GCPrevValue)
//                {
//                    if (checkbox.checked == true) {
//                        subOpr.value = "error";
//                        groupCtr.style.background = "#ff0000";
//                    }
//                    else {
//                        subOpr.value = "0000";
//                        groupCtr.value = "1";
//                        groupCtr.style.background = "#fee391";
//                    }
//                }
//                else if (GCvalue ==adder) {
//                    if(subOprPrev.value=="0000")
//                    {
//                        if (checkbox.checked == true) {
//                            subOpr.value = "error";
//                            groupCtr.style.background = "#ff0000";
//                        }
//                        else {
//                            subOpr.value = "0000";
//                            groupCtr.value = "1";
//                            groupCtr.style.background = "#fee391";
//                        }
//                    }
//                }
//                else{
//                
//                }
//            }
//           
//            else {

//            }
//        }
//        else {
//            subOpr.value = "0000";
//            Operation.value = "0010";
//        }

//    }
//}
function SetOperation(index) {
    var firstOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_TaskListOperation");
    var firstSubOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_SubOperation");
    var firstCheckBox = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_chk_IsSubOperation");
    var OperationValid = false;
    var GroupCounterValid = false;

    if (index == 0) {


        if (firstOpr.value != "0010") {
            if (firstOpr.value == "Select") {
                firstOpr.style.background = "#fee391";
                firstSubOpr.value = "0000";
            }
            else {
                firstOpr.style.background = "#ff0000";
            }
        }
        else {
            firstOpr.style.background = "#fee391";
            firstSubOpr.value = "0000";
        }
    }

    else {
        var id = index + 2; if (id.toString().length == 1) { var stringID = "0" + id.toString(); } else { var stringID = id.toString(); }
        var idprev = id - 1; if (idprev.toString().length == 1) { var stringIDPrev = "0" + idprev.toString(); } else { var stringIDPrev = idprev.toString(); }
        var groupCtr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_GroupCounter");
        var groupCtrPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_GroupCounter");
        var Operation = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation");
        var operationPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_TaskListOperation");
        var subOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_SubOperation");
        var subOprPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_SubOperation");

        if (groupCtrPrev.value == groupCtr.value) {
            if (Operation.value == "Select") {
                OperationValid = true;
                GroupCounterValid = true;
                subOpr.value = "0000";

            }
            else {
                var OprInt = parseFloat(Operation.value);
                var OprPrevInt = parseFloat(operationPrev.value);
                if (OprInt == OprPrevInt) {
                    GroupCounterValid = true;
                    OperationValid = true;
                    var lastCounter = parseFloat(subOprPrev.value);
                    var lastCounter = lastCounter + 10;
                    var lastCounterLength = lastCounter.toString().length;

                    switch (lastCounterLength) {
                        case 2:
                            var stringcurrSubOpr = "00" + lastCounter.toString();
                            break;
                        case 3:
                            var stringcurrSubOpr = "0" + lastCounter.toString();
                            break;
                        case 4:
                            var stringcurrSubOpr = lastCounter.toString();
                            break;
                    }
                    subOpr.value = stringcurrSubOpr;

                }
                else {
                    if (OprInt > OprPrevInt) {
                        var comparer = OprPrevInt + 10;
                        if (OprInt != comparer) {
                            OperationValid = false;
                            GroupCounterValid = true;
                        }

                        else {
                            if (subOprPrev.value != "0000") {
                                OperationValid = true;
                                GroupCounterValid = true;

                                subOpr.value = "0000";
                            }

                            else {
                                OperationValid = false;
                                GroupCounterValid = true;
                            }
                        }

                    }
                    else if (OprInt < OprPrevInt) {
                        OperationValid = false;
                        GroupCounterValid = true;
                    }
                    else { }
                }
            }
        }
        else if (groupCtr.value > groupCtrPrev.value) {
            if (Operation.value == "Select") {
                OperationValid = true;
                subOpr.value = "0000";
                GroupCounterValid = true;
            }
            else {
                var GroupCtrInt = parseInt(groupCtr.value);
                var GroupCtrPrevInt = parseInt(groupCtrPrev.value);
                var comp = GroupCtrPrevInt + 1;
                if (GroupCtrInt != comp) {

                    GroupCounterValid = false;
                }
                else {
                    if (subOprPrev.value == "0000") {

                        OperationValid = true;
                        GroupCounterValid = false;
                    }
                    else {

                        if (Operation.value != "0010") {
                            OperationValid = false;
                            GroupCounterValid = true;
                        }
                        else {
                            OperationValid = true;
                            GroupCounterValid = true;
                        }


                    }

                }

            }
        }
        else if (groupCtr.value < groupCtrPrev.value) {
            if (Operation.value == "Select") {
                OperationValid = true;
                subOpr.value = "0000";
            }
            else {
                GroupCounterValid = false;
            }
        }
        else
        { }
        if (OperationValid == false) {
            var Operation = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation");
            Operation.style.background = "#ff0000";
        }
        else {
            var Operation = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation");
            Operation.style.background = "#fee391";

        }
        if (GroupCounterValid == false) {
            var Operation = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation");
            groupCtr.style.background = "#ff0000";
        }
        else {
            var Operation = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation");
            groupCtr.style.background = "#fee391";
        }
    }

}


function SetBOMOperation(index) {
    var firstOpr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_TaskListOperation");
    var firstItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_ItemNumber");
    var firstGroupCtr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_GroupCounter");
    var IsOperationValid = true;
    var IsItemNumberValid = true;
    var IsGroupCounterValid = true;

    if (index == 0) {
        if (firstOpr.value == "Select") {
            var IsOperationValid = true;
            firstItemNo.value = "0000";
        }
        else {
            if (firstOpr.value != "0010") {
                var IsOperationValid = false;
            }
            else {
                firstItemNo.value = "0010";
                var IsOperationValid = true;
            }
        }
        if (IsOperationValid == false) {
            firstOpr.style.background = "#ff0000";
        }
        else {
            firstOpr.style.background = "#fee391";
        }
    }
    else {
        var IsOperationValid = true;
        var IsItemNumberValid = true;
        var IsGroupCounterValid = true;

        var id = index + 2; if (id.toString().length == 1) { var stringID = "0" + id.toString(); } else { var stringID = id.toString(); }
        var idprev = id - 1; if (idprev.toString().length == 1) { var stringIDPrev = "0" + idprev.toString(); } else { var stringIDPrev = idprev.toString(); }
        var groupCtr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_GroupCounter");
        var groupCtrPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_GroupCounter");
        var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
        var operationPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_TaskListOperation");
        var ItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_ItemNumber");
        var ItemNoPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_ItemNumber");

        if (groupCtrPrev.value == groupCtr.value) {
            if (Operation.value == "Select") {
                OperationValid = true;
                IsGroupCounterValid = true;
                ItemNo.value = "0010";
            }
            else {
                var IsOperationValid = true;
                var IsItemNumberValid = true;

                var OprInt = parseFloat(Operation.value);
                var OprPrevInt = parseFloat(operationPrev.value);
                if (OprInt == OprPrevInt) {
                    IsOperationValid = true;
                    IsOperationValid = true;
                    var lastCounter = parseFloat(ItemNoPrev.value);
                    var lastCounter = lastCounter + 10;
                    var lastCounterLength = lastCounter.toString().length;

                    switch (lastCounterLength) {
                        case 2:
                            var stringcurrItemNo = "00" + lastCounter.toString();
                            break;
                        case 3:
                            var stringcurrItemNo = "0" + lastCounter.toString();
                            break;
                        case 4:
                            var stringcurrItemNo = lastCounter.toString();
                            break;
                    }
                    ItemNo.value = stringcurrItemNo;
                }
                else {
                    if (OprInt > OprPrevInt) {
                        IsOperationValid = true;
                        IsItemNumberValid = true;
                        ItemNo.value = "0010";
                    }
                    else if (OprInt < OprPrevInt) {
                        IsOperationValid = false;
                    }
                    else { }
                }
            }
            if (IsGroupCounterValid == false) {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                groupCtr.style.background = "#ff0000";
            }
            else {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                groupCtr.style.background = "#fee391";
            }
            if (IsItemNumberValid == false) {
                var ItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_ItemNumber");
                ItemNo.style.background = "#ff0000";
            }
            else {
                var ItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_ItemNumber");
                ItemNo.style.background = "#fee391";
            }
            if (IsOperationValid == false) {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                Operation.style.background = "#ff0000";
            }
            else {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                Operation.style.background = "#fee391";
            }
        }
        else {
            if (groupCtr.value > groupCtrPrev.value) {
                if (Operation.value == "Select") {
                    IsOperationValid = true;
                    IsGroupCounterValid = true;
                    ItemNo.value = "0010";
                }
                else {
                    if (Operation.value != "0010") {
                        IsOperationValid = false;
                    }
                    else {
                        IsOperationValid = true;
                    }
                    ItemNo.value = "0010";
                    if (ItemNo.value != "0010") {
                        IsItemNumberValid = false;
                    }
                    else {
                        IsItemNumberValid = true;
                    }
                }
            }
            else if (groupCtr.value < groupCtrPrev.value) {
                IsGroupCounterValid = false;
            }
            if (IsGroupCounterValid == false) {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                groupCtr.style.background = "#ff0000";
            }
            else {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                groupCtr.style.background = "#fee391";
            }
            if (IsItemNumberValid == false) {
                var ItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_ItemNumber");
                ItemNo.style.background = "#ff0000";
            }
            else {
                var ItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_ItemNumber");
                ItemNo.style.background = "#fee391";
            }
            if (IsOperationValid == false) {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                Operation.style.background = "#ff0000";
            }
            else {
                var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
                Operation.style.background = "#fee391";

            }
        }

    }
}

function CheckGroupCounter(index) {
    // alert("index" + index);

    if (index == 0) {
        var firstGroupCtr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_GroupCounter");
        var firstOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_TaskListOperation");
        var firstSubOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_SubOperation");

        var IsGroupCounterValid = true;

        firstOpr.value = "Select";
        firstSubOpr.value = "0000";

        if (firstGroupCtr.value == "Select") {
            IsGroupCounterValid = true;
        }
        else {
            if (firstGroupCtr.value != "1") {
                IsGroupCounterValid = false;
            }
            else {
                IsGroupCounterValid = true;
            }
        }
        if (IsGroupCounterValid == false) {
            document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_GroupCounter").style.background = "#ff0000";
        }
        else {
            document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl02_GroupCounter").style.background = "#fee391";
        }
    }
    else {
        var IsGroupCounterValid = true;
        var IsOperationValid = true;
        var id = index + 2;
       // alert("index" + index + " id=" + id);
        if (id.toString().length == 1) { var stringID = "0" + id.toString(); } else { var stringID = id.toString(); }
        var idprev = id - 1; if (idprev.toString().length == 1) { var stringIDPrev = "0" + idprev.toString(); } else { var stringIDPrev = idprev.toString(); }

        var groupCtr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_GroupCounter");
        var groupCtrPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_GroupCounter");
        var Operation = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_TaskListOperation");
        var operationPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_TaskListOperation");
        var subOpr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringID + "_SubOperation");
        var subOprPrev = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + stringIDPrev + "_SubOperation");

        if (groupCtr.value == "Select") {
            Operation.value = "Select";
            subOpr.value = "0000";
            IsGroupCounterValid = true;
        }
        else{
            if (groupCtr.value == groupCtrPrev.value) {
                var OprInt = parseFloat(Operation.value);
                var OprPrevInt = parseFloat(operationPrev.value);

                if (OprInt == OprPrevInt) {
                    var lastCounter = parseFloat(subOprPrev.value);
                    var lastCounter = lastCounter + 10;
                    var lastCounterLength = lastCounter.toString().length;

                    switch (lastCounterLength) {
                        case 2:
                            var stringcurrSubOpr = "00" + lastCounter.toString();
                            break;
                        case 3:
                            var stringcurrSubOpr = "0" + lastCounter.toString();
                            break;
                        case 4:
                            var stringcurrSubOpr = lastCounter.toString();
                            break;
                    }
                    subOpr.value = stringcurrSubOpr;
                    IsGroupCounterValid = true;
                    IsOperationValid = true;
                }
            }
            else {
                if (groupCtr.value > groupCtrPrev.value) {
                    var groupCtrInt = parseInt(groupCtr.value);
                    var groupCtrPrevInt = parseInt(groupCtrPrev.value);
                    var adder = groupCtrPrevInt + 1;

                    if (groupCtrInt != adder) {
                        IsGroupCounterValid = false;

                    }
                    else {
                        var OprInt = parseFloat(Operation.value);
                        var OprPrevInt = parseFloat(operationPrev.value);

                        if (OprInt == OprPrevInt) {
                            IsGroupCounterValid = true;
                            subOpr.value = "0000";
                        }
                        else if (subOprPrev.value == "0000") {
                            IsGroupCounterValid = false;
                            IsOperationValid = true;
                        }

                        else {
                            IsGroupCounterValid = true;
                        }
                    }
                }
                else {
                    // alert("kurang dari");
                    IsGroupCounterValid = false;
                }
            }
        }
        if (IsGroupCounterValid == false)
        {
            groupCtr.style.background = "#ff0000";
        }
        else{
            groupCtr.style.background = "#fee391";
        }
        if (IsOperationValid == false) {
            Operation.style.background = "#ff0000";
        }
        else {
            Operation.style.background = "#fee391";
        }
        //end of else
    }
}
function CheckBOMGroupCounter(index) {
    // alert("index" + index);

    if (index == 0) {
        var firstGroupCtr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_GroupCounter");
        var firstOpr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_TaskListOperation");
        var firstItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_ItemNumber");

        var IsGroupCounterValid = true;

        firstOpr.value = "Select";
        firstItemNo.value = "0000";

        if (firstGroupCtr.value == "Select") {

            IsGroupCounterValid = true;
        }
        else {
            if (firstGroupCtr.value != "1") {
                IsGroupCounterValid = false;
            }
            else {
                IsGroupCounterValid = true;
            }
        }
        if (IsGroupCounterValid == false) {
            document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_GroupCounter").style.background = "#ff0000";
        }
        else {
            document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_GroupCounter").style.background = "#fee391";
        }
    }
    else {
        var IsGroupCounterValid = true;
        var IsOperationValid = true;
        var id = index + 2;
        // alert("index" + index + " id=" + id);
        if (id.toString().length == 1) { var stringID = "0" + id.toString(); } else { var stringID = id.toString(); }
        var idprev = id - 1; if (idprev.toString().length == 1) { var stringIDPrev = "0" + idprev.toString(); } else { var stringIDPrev = idprev.toString(); }

        var groupCtr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_GroupCounter");
        var groupCtrPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_GroupCounter");
        var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
        var operationPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_TaskListOperation");
        var ItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_ItemNumber");
        var ItemNoPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_ItemNumber");

        if (groupCtr.value == "Select") {
            Operation.value = "Select";
            ItemNo.value = "0000";
            IsGroupCounterValid = true;
        }
        else {
            if (groupCtr.value == groupCtrPrev.value) {
                var OprInt = parseFloat(Operation.value);
                var OprPrevInt = parseFloat(operationPrev.value);

                if (OprInt == OprPrevInt) {
                    var lastCounter = parseFloat(ItemNoPrev.value);
                    var lastCounter = lastCounter + 10;
                    var lastCounterLength = lastCounter.toString().length;

                    switch (lastCounterLength) {
                        case 2:
                            var stringcurrItemNo = "00" + lastCounter.toString();
                            break;
                        case 3:
                            var stringcurrItemNo = "0" + lastCounter.toString();
                            break;
                        case 4:
                            var stringcurrItemNo = lastCounter.toString();
                            break;
                    }
                    ItemNo.value = stringcurrItemNo;
                    IsGroupCounterValid = true;
                    IsOperationValid = true;
                }
            }
            else {
                if (groupCtr.value > groupCtrPrev.value) {
                    var groupCtrInt = parseInt(groupCtr.value);
                    var groupCtrPrevInt = parseInt(groupCtrPrev.value);
                    var adder = groupCtrPrevInt + 1;

                    if (groupCtrInt != adder) {
                        IsGroupCounterValid = false;

                    }
                    else {

                        IsGroupCounterValid = true;
                        ItemNo.value = "0010";
                    }

                }

                else {
                    // alert("kurang dari");
                    IsGroupCounterValid = false;
                }
            }
        }
    }
    if (IsGroupCounterValid == false) {
        groupCtr.style.background = "#ff0000";
    }
    else {
        groupCtr.style.background = "#fee391";
    }
    if (IsOperationValid == false) {
        Operation.style.background = "#ff0000";
    }
    else {
        Operation.style.background = "#fee391";
    }
    //end of else
}



function getGroupCounter() {
    var numRow;
    var GroupCtrField = document.GetElementID('groupCounter');
    var i = 0;
    while (GroupCtrField.value != "") {
        var GroupCtr = GroupCtrField.value;
        i++;
        document.write("groupCounter=" + GroupCtr);
    }
}
//function SetItemNoCounter(index) {
//    var index;
//    var firstOpr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_TaskListOperation");
//    var firstGroupCtr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_GroupCounter");
//    var firstCheckBox = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_chk_IsItemNumber");
//    var firstItemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl02_ItemNumber");
//    if (index == "0") {
//        firstGroupCtr.value = "1";
//        firstOpr.value = "0010";
//        firstItemNo.value = "0010";
//    }
//    else {
//        var id = index + 2; if (id.toString().length == 1) { var stringID = "0" + id.toString(); } else { var stringID = id.toString(); }
//        var idprev = id - 1; if (idprev.toString().length == 1) { var stringIDPrev = "0" + idprev.toString(); } else { var stringIDPrev = idprev.toString(); }
//        var groupCtr = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_GroupCounter");
//        var groupCtrPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_GroupCounter");
//        var Operation = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_TaskListOperation");
//        var operationPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_TaskListOperation");
//        var checkboxPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_chk_IsItemNumber");
//        var checkbox = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_chk_IsItemNumber");
//        var itemNo = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringID + "_ItemNumber");
//        var itemNoPrev = document.getElementById("ctl00_html_container_gv_TaskListBOM_ctl" + stringIDPrev + "_ItemNumber");

//        itemNo.style.background = "#fee391";
//       // itemNo.value = "0000";
//      
//        //Operation.value = "0010";
//        groupCtr.style.background = "#fee391";
//        Operation.style.background = "#fee391";
//        if (checkbox.checked==false)
//        {
//            groupCtr.value = "1";
//            Operation.value = "0010";
//            itemNo.value = "0010";
//        }
//        if (checkboxPrev.checked == true) {
//            if (groupCtr.value == groupCtrPrev.value) {
//                if (Operation.value == operationPrev.value) {
//                    if (itemNoPrev.value != "error") {
//                        if (checkbox.checked == true) {
//                            var lastCounter = parseFloat(itemNoPrev.value);
//                            var lastCounter = lastCounter + 10;
//                            var lastCounterLength = lastCounter.toString().length;
//                            switch (lastCounterLength) {
//                                case 2:
//                                    var stringcurrItemNo = "00" + lastCounter.toString();
//                                    break;
//                                case 3:
//                                    var stringcurrItemNo = "0" + lastCounter.toString();
//                                    break;
//                                case 4:
//                                    var stringcurrItemNo = lastCounter.toString();
//                                    break;
//                            }
//                            itemNo.value = stringcurrItemNo;
//                        }
//                    }
//                    else {
//                        if (checkbox.checked == true) {
//                            itemNo.value = "error";
//                            itemNo.style.background = "#ff0000";
//                        }
//                    }

//                }
//                else {
//                    var OprPrevValue = parseInt(operationPrev.value);
//                    var OprValue = parseInt(Operation.value);
//                    var adder = OprPrevValue + 10;
//                    if (OprValue < OprPrevValue) {
//                        if (checkbox.checked == true) {
//                            itemNo.value = "error";
//                            Operation.style.background = "#ff0000";
//                        }
//                    }
//                    else if (OprValue > adder) {
//                        if (checkbox.checked == true) {
//                            itemNo.value = "error";
//                            Operation.style.background = "#ff0000";
//                        }
//                    }
//                    else if (OprValue == adder) {
//                        if (checkbox.checked == true) {
//                            itemNo.value = "0010";
//                           
//                        }
//                    }
//                }
//            }

//            else {
//                var GCPrevValue = parseInt(groupCtrPrev.value);
//                var GCvalue = parseInt(groupCtr.value);
//                var adder = GCPrevValue + 1;
//                if (GCvalue > adder) {
//                    if (checkbox.checked == true) {
//                        itemNo.value = "error";
//                        groupCtr.style.background = "#ff0000";
//                    }
//                }
//                else if (GCvalue < GCPrevValue) {
//                    if (checkbox.checked == true) {
//                        itemNo.value = "error";
//                        groupCtr.style.background = "#ff0000";
//                    }
//                }
//                else if (GCvalue == adder) {
//                    if (checkbox.checked == true) {
//                        
//                        itemNo.value = "0010";
//                    }
//                }
//                else {
//                }
//            }
//        }
//        else {
//            itemNo.value = "0000";
//        }
//    }

//}

function DoSpirCheck(index) {

    var index;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var MaterialNumber = document.getElementById('ctl00_html_container_gv_CreateBOMde_ctl' + newID + '_MaterialNumber').value;
    window.open("../../popup/SpirCheck.aspx?MaterialID=" + MaterialNumber, "window", "scrollbars=1,height=500, width=1000, resizeable=yes,modal=yes", "");
    return false;
}


function ShowGroupCounterList(index) {

    var index;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    alert("tesr");
    var DDL_GroupCtr = document.getElementById("ctl00_html_container_gv_CreateTasklistDetail_ctl" + newID + "_GroupCounter");
    DDL_GroupCtr.style.visibility = "visible";
}
function DoSpirCheckUpdate(index){
    var index;
    var id = index + 2;
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var MaterialNumber = document.getElementById('ctl00_html_container_gv_UpdateBOMde_ctl' + newID + '_MaterialNumber').value;
    window.open("../../popup/SpirCheck.aspx?MaterialID=" + MaterialNumber, "window", "scrollbars=1,height=500, width=1000, resizeable=yes,modal=yes", "");
    return false;
}

function GetPlannerGroupByPlant(index) {
    var index;
    var id = index + 2;

    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
   var plant = document.getElementById('ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_PlanningPlant').value;
    var Parent='ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_PlannerGroup';
    window.open('../../PopUpDisplay/DisplayPlannerGroup.aspx?parentField='+ Parent +'&Plant=' + plant, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,','');
    return false;
}
function GetWorkCenterByPlant(index) {
    var index;
    var id = index + 2;

    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var plant = document.getElementById('ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_PlanningPlant').value;
    var Parent = 'ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_MainWorkCenter';
    window.open('../../PopUpDisplay/DisplayWorkCenter.aspx?parentField=' + Parent + '&Plant=' + plant, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');
    return false;
}
function GetEquipment(parent) {
    var plant = document.getElementById("ctl00_html_container_plant1").value;
    if (plant != "") {
        var parentField = parent;
        window.open("../../PopUpDisplay/DisplayEquipment.aspx?parentField=" + parentField + "&Plant=" + plant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;

    }
    else {
        alert("Plant not defined!");
    }

}
function GetEquipment(parent,plantID) {
    var plantID;
    var plant = document.getElementById(plantID).value;
    if (plant != "") {
        var parentField = parent;
        window.open("../../PopUpDisplay/DisplayEquipment.aspx?parentField=" + parentField + "&Plant=" + plant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;

    }
    else {
        alert("Plant not defined!");
    }

}
function GetLocation() {
    var plant = document.getElementById("ctl00_html_container_plant1").value;
    if (plant != "") {
        var parentField = "ctl00_html_container_txt_Location";
        window.open("../../PopUpDisplay/DisplayLocation.aspx?parentField=" + parentField + "&Plant=" + plant + "", "window", "scrollbars=1,height=400, width=500, resizeable=yes", ""); return false;
    }
    else {
        alert("Plant not defined!");
    }
}
function GetLocationByPlant(index) {
    var index;
    var id = index + 2;

    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var plant = document.getElementById('ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_PlanningPlant').value;
    var Parent = 'ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_Location';
    window.open('../../PopUpDisplay/DisplayLocation.aspx?parentField=' + Parent + '&Plant=' + plant, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');
    return false;
}

function GetPlantSectionByPlant(index) {
    var index;
    var id = index + 2;

    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var plant = document.getElementById('ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_PlanningPlant').value;
    var Parent = 'ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_PlantSection';
    window.open('../../PopUpDisplay/DisplayPlantSection.aspx?parentField=' + Parent + '&Plant=' + plant, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');
    return false;
}

function UppercaseThis(index) {
    var index;
    var id = index + 2;

    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var text = document.getElementById('ctl00_html_container_gv_CreateFLME_ctl' + newID + '_FunctLocation').value;
    var upper = text.toUpperCase();
    document.getElementById('ctl00_html_container_gv_CreateFLME_ctl' + newID + '_FunctLocation').value = upper;
}
function UpperCase(TBName) {

    var TBName;
    var text = document.getElementById(TBName).value;
    var upper = text.toUpperCase();
    document.getElementById(TBName).value = upper;
}

function GetFLByPlant(index) {
    var index;
    var id = index + 2;

    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }

    var plant = document.getElementById('ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_PlanningPlant').value;
    var Parent = 'ctl00_html_container_gv_createEquipmentDE_ctl' + newID + '_FuncLocation';
    window.open('../../PopUpDisplay/DisplayFuncLocation.aspx?parentField=' + Parent + '&Plant=' + plant+'&StrInd=TAG', 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');
    return false;
}

function GetFL() {
    var strInd = document.getElementById("ctl00_html_container_StrIndicator").value;
    var plant = document.getElementById("ctl00_html_container_MaintPlant").value;
    if (strInd != "0" && plant != "") {
        var Parent = "ctl00_html_container_FuncLocation";
        window.open('../../PopUpDisplay/DisplayFuncLocation.aspx?parentField=' + Parent + '&Plant=' + plant + '&StrInd=' + strInd + '', 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');
    }
    else if (plant == "") {
        alert("Plant not defined");
    }
    else if (strInd == "0") {
        alert("Select Str Indicator");
    }
    else { }
}

function SelectEquipment(index,Plant) {
    var index;
    var id = index + 2;
    
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }
    var Plant;
    var Parent = 'ctl00_html_container_gv_SelectAny_ctl' + newID + '_EquipmentNumber';
    window.open('../../PopUpDisplay/DisplayEquipment.aspx?parentField=' + Parent+'&Plant='+Plant, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');

}
function ReportingGetEquipment(Parent) {
    var Plant = document.getElementById("ctl00_html_container_plant1");
    if (Plant.value == "") {
        alert("Plant not defined");
    }
    else {
        var thePlant = Plant.value;
        window.open('../../PopUpDisplay/DisplayEquipment.aspx?parentField=' + Parent + '&Plant=' + thePlant, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');
    
    }

}
function ReportingGetLocation(Parent) {

    var Plant = document.getElementById("ctl00_html_container_plant1");
    if (Plant.value == "") {
        alert("Plant not defined");
    }
    else {
        var thePlant = Plant.value;
        window.open('../../PopUpDisplay/DisplayLocation.aspx?parentField=' + Parent + '&Plant=' + thePlant, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');

    }
}
function Select(index) {
    var index;
    var id = index + 2;
    var plant = document.getElementById("ctl00_html_container_FieldPlant");
    var plantValue = plant.value;
   
    if (id.toString().length == 1) {
        var newID = "0" + id.toString();
    }
    else {
        var newID = id.toString();
    }


    var Parent = 'ctl00_html_container_gv_SelectAny_ctl' + newID + '_EquipmentNumber';
    window.open('../../PopUpDisplay/DisplayEquipment.aspx?parentField=' + Parent+'&Plant='+plantValue, 'window', 'scrollbars=1,height=400, width=500, resizeable=yes,', '');
}

function GetHint() {
    alert("test");

}
  
                
function IsOntheList(arr, obj) {
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == obj) return true;
    }
}

function SetItemNumber(index) {
    var i;
    var list = [];
    var anita = [];
    var index;
    var id = index + 1;
    var newID = index + 2;
    var seb = id - 1;
    document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl02_ItemNumber').value = "10";
    if (newID.toString().length == 1) {
        var stringID = '0' + newID.toString();
    }
    else {
        var stringID = newID.toString();
    }
    var idprev = newID - 1;
    if (idprev.toString().length == 1) {
        var stringIDPrev = '0' + idprev.toString();
    }
    else {
        var stringIDPrev = idprev.toString();
    } 
    var currEqui = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_ddl_EquipmentNumber').value;
    var CurrItemNo = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_ItemNumber');

    var CurrMaterialNumber = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_MaterialNumber');
    var CurrDescription = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_MaterialDescription');
    var CurrText1 = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_Text1');
    var CurrText2 = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_Text2');
    var CurritemCategory = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_ItemCategory');
    var CurrQty = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_Quantity');
    var CurrUnitofQty = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_UnitOfQuantity');
    var CurrSortString = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_SortString');
    var CurrDominantMat = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_DominantMaterial');
    var CurrExactCategory = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_ExactMatCategory');
    var Status = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringID + '_Status');

    for (i = 0; i < seb; i++) {
        var str = "equi" + i;
        var x = i + 2;
        if (x.toString().length == 1) {
            var stringID = '0' + x.toString();
        }
        else {
            var stringID = x.toString();
        }
        var equi = document.getElementById("ctl00_html_container_gv_CreateBOMme_ctl" + stringID + "_ddl_EquipmentNumber").value;
        list.push(equi);
        var anita = list;
    }
    if (index > 0) {
       
        var prevEqui = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringIDPrev + '_ddl_EquipmentNumber').value;
        var PrevItemNo = document.getElementById('ctl00_html_container_gv_CreateBOMme_ctl' + stringIDPrev + '_ItemNumber');  
        if (prevEqui != currEqui) {
            if (IsOntheList(anita, currEqui)) {
               // alert(currEqui + " sudah ada di list " + anita);
                CurrItemNo.value = "error";
                CurrItemNo.style.background = "#ff0000";
            }
            else {
                anita.push(currEqui);
                CurrItemNo.style.background = "#fee391";
                CurrItemNo.value = "10";
            }
        }
        else {
          var lastCounter = parseFloat(PrevItemNo.value);
          var lastCounter = lastCounter + 10;
          CurrItemNo.value = lastCounter;
      }
      if (CurrItemNo.value == "error") {
          CurrMaterialNumber.disabled = true;
          CurrDescription.disabled = true;
          CurrText1.disabled = true;
          CurrText2.disabled = true;
          CurritemCategory.disabled = true;
          CurrQty.disabled = true;
          CurrUnitofQty.disabled = true;
          CurrSortString.disabled = true;
          CurrDominantMat.disabled = true;
          CurrExactCategory.disabled = true;
          Status.disabled = true; 
      }
      else {
          CurrMaterialNumber.disabled = false;
          CurrDescription.disabled = true;
          CurrText1.disabled = false;
          CurrText2.disabled = false;
          CurritemCategory.disabled = false;
          CurrQty.disabled = false;
          CurrUnitofQty.disabled = false;
          CurrSortString.disabled = false;
          CurrDominantMat.disabled = false;
          CurrExactCategory.disabled = false;
          Status.disabled = false;
          CurrItemNo.style.background = "#fee391";
      }
    }
   
}