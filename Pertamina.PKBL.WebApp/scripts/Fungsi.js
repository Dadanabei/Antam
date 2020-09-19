// JScript File
function FormatNumber(input)
{
    if (input.value.substring(input.value.length-1) != ' ')
    {
        var num = input.value.replace(/\,/g,'');
        if(!isNaN(num))
        {
            if(num.indexOf('.') > -1)
            {
                num = num.split('.');
                num[0] = num[0].toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1,').split('').reverse().join('').replace(/^[\,]/,'');
                if(num[1].length > 3)
                {
                    //alert('You may only enter two decimals!');
                    num[1] = num[1].substring(0,num[1].length-1);
                }  
             input.value = num[0]+'.'+num[1];        
             } 
             else
             { 
                input.value = num.toString().split('').reverse().join('').replace(/(?=\d*\.?)(\d{3})/g,'$1,').split('').reverse().join('').replace(/^[\,]/,'') };
             }
        else
        {
            //alert('You may enter only numbers in this field!');
            input.value ='';
            //input.value = input.value.substring(0,input.value.length-1);
        }
    }
    else
    {
        //alert('You may enter only numbers in this field!');
        input.value = input.value.substring(0,input.value.length-1);
    }
}

function checkAllBoxes() {

    //get total number of rows in the gridview and do whatever
    //you want with it..just grabbing it just cause
    var totalChkBoxes = parseInt('<%= Me.gvdepot.Rows.Count %>');
    var gvControl = document.getElementById('<%= Me.gvdepot.ClientID %>');

    //this is the checkbox in the item template...this has to be the same name as the ID of it
    var gvChkBoxControl = "KDBarang";

    //this is the checkbox in the header template
    var mainChkBox = document.getElementById("chkBoxAll");

    //get an array of input types in the gridview
    var inputTypes = gvControl.getElementsByTagName("input");

    for (var i = 0; i < inputTypes.length; i++) {
        //if the input type is a checkbox and the id of it is what we set above
        //then check or uncheck according to the main checkbox in the header template            
        if (inputTypes[i].type == 'checkbox' && inputTypes[i].id.indexOf(gvChkBoxControl, 0) >= 0)
            inputTypes[i].checked = mainChkBox.checked;
    }
}