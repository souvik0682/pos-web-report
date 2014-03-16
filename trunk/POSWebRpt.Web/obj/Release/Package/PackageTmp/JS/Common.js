var dayarray = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
var montharray = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

function getthedate() {
    var mydate = new Date()
    var year = mydate.getYear()
    if (year < 1000)
        year += 1900
    var day = mydate.getDay()
    var month = mydate.getMonth()
    var daym = mydate.getDate()
    if (daym < 10)
        daym = "0" + daym
    var hours = mydate.getHours()
    var minutes = mydate.getMinutes()
    var seconds = mydate.getSeconds()
    var dn = "AM"
    if (hours >= 12)
        dn = "PM"
    if (hours > 12) {
        hours = hours - 12
    }
    if (hours == 0)
        hours = 12
    if (minutes <= 9)
        minutes = "0" + minutes
    if (seconds <= 9)
        seconds = "0" + seconds
    //change font size here
    var cdate = "<small>" + montharray[month] + " " + daym + ", " + year + " " + hours + ":" + minutes + ":" + seconds + " " + dn
+ "</small>"

    if (document.all)
        document.all.clock.innerHTML = cdate
    else if (document.getElementById)
        document.getElementById("clock").innerHTML = cdate
    else
        document.write(cdate)
}
if (!document.all && !document.getElementById)
    getthedate()
function goforit() {
    if (document.all || document.getElementById)
    //                Calling getthedate() at 1000 millisecond interval
        setInterval("getthedate()", 1000)
}
function doClick(e, btn) {
    var key;

    if (window.event)
        key = window.event.keyCode;     // for IE
    else
        key = e.which;                  // for firefox

    if (key == 13) {
        document.getElementById(btn).focus();
        document.getElementById(btn).click();
        event.keyCode = 0;
    }
}

function IsNumeric(ctrl) {
    var value = document.getElementById(ctrl.id).value;
    var validChars = "0123456789";
    var strChar;
    var result = true;

    if (value.length == 0) return false;

    for (i = 0; i < value.length && result; i++) {
        strChar = value.charAt(i);

        if (validChars.indexOf(strChar) == -1) {
            result = false;
        }
    }

    if (!result) {
        alert('Please enter a valid numeric value');
        document.getElementById(ctrl.id).value = "";
        ctrl.focus();
        return false;
    }
    else {
        return true;
    }
}

function UnderConstruction() {
    alert('This page is under construction!!');
    return false;
}

function ValidateDecimal(txt) {
    var exp = new RegExp('^[0-9]+(\.[0-9]{1,2})?$');

    if (txt.value.match(exp)) {
        return true;
    }
    else {
        return false;
    }
}

function SetMaxLength(obj, maxLen) {
    return (obj.value.length < maxLen);
}

function getTopPosition(inputObj) {

    var returnValue = inputObj.offsetTop + inputObj.offsetHeight;
    while ((inputObj = inputObj.offsetParent) != null) returnValue += inputObj.offsetTop;
    return returnValue;
}

function getLeftPosition(inputObj) {
    var returnValue = inputObj.offsetLeft;
    while ((inputObj = inputObj.offsetParent) != null) returnValue += inputObj.offsetLeft;
    return returnValue;
}

/* for other textbox */
function toggleOther(ctrl1, ctrl2) {
    var ddl = document.getElementById(ctrl1);
    var txt = document.getElementById(ctrl2);

    if (ddl != null) {
        var selValue = ddl.options[ddl.selectedIndex].text;

        if (txt != null) {
            if (selValue == "Other") {
                txt.style.display = '';
            }
            else {
                txt.value = '';
                txt.style.display = 'none';
            }
        }
    }
}

/***** For Ajax *****/
function closeErrorPanel() {
    if ($get('container_dvSync') != null)
        $get('container_dvSync').style.display = 'none';
}
function pageLoad() {
    var manager = Sys.WebForms.PageRequestManager.getInstance();
    manager.add_initializeRequest(InitializeRequest);
    manager.add_endRequest(endRequest);
    manager.add_beginRequest(OnBeginRequest);
}
function ToggleAsynDiv(visString) {
    var adiv = $get('dvAsync');

    if (adiv != null)
        adiv.style.display = visString;

}
function ClearErrorState() {
    $get('dvAsyncMessage').innerHTML = '';
    ToggleAsynDiv('none');
}

function OnBeginRequest(sender, args) {
    ToggleAsynDiv('none');
}

function endRequest(sender, args) {
    if (args.get_error() != undefined) {
        var errorMessage;
        if (args.get_response().get_statusCode() == '200') {
            errorMessage = args.get_error().message;
        }
        else {
            // Error occurred somewhere other than the server page.
            errorMessage = '* An unspecified error has occurred.';
        }
        args.set_errorHandled(true);
        ToggleAsynDiv('');

        if ($get('container_dvSync') != null)
            $get('container_dvSync').style.display = 'none';

        if ($get('ctl00_container_UpdateProgress1') != null)
            $get('ctl00_container_UpdateProgress1').style.display = 'none';

        $get('dvAsyncMessage').innerHTML = "* An error has occured. Please contact system administrator.";
    }
}

function InitializeRequest(sender, args) {
    var manager = Sys.WebForms.PageRequestManager.getInstance();

    if (manager.get_isInAsyncPostBack())
        args.set_cancel(true);

    var postBackElement;
    postBackElement = args.get_postBackElement();

    if ($get('ctl00_container_UpdateProgress1') != null)
        $get('ctl00_container_UpdateProgress1').style.display = '';
}

/***** For Ajax *****/
function hidePrintPanel(dvId, returntype) {
    document.getElementById(dvId).style.display = 'none';
    return returntype;
}
function showPrintPanel(imgId, dvId) {
    var imgPrint = document.getElementById(imgId);
    var dvPrint = document.getElementById(dvId);

    dvPrint.style.left = (getLeftPosition(imgPrint) - 134) + 'px';
    dvPrint.style.display = '';
}
