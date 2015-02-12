/*------------------------  有用的  ------------------------*/
//另開視窗
function openWindow(theURL, winName, width, height, scrollbars) {
    var screenW = (screen.width - width) / 2
    var screenH = (screen.height - height) / 3
    features = 'width=' + width + ',height=' + height + ',left=' + screenW + ',top=' + screenH + ',scrollbars=' + scrollbars + ',resizable=yes',
    window.open(theURL, winName, features);
};

//自動調整物件高度
function ResizeiFrameHeight(obj) {
    parent.document.getElementById(obj).height = document.body.scrollHeight;
};

//調整版面左邊目錄開關
function switchFrameCols(obj) {
    if (top.document.getElementById('freMain').cols == "0,*") {
        top.document.getElementById('freMain').cols = '200,*';
        $(obj).find('span').removeClass('ui-icon-pin-w');
        $(obj).find('span').addClass('ui-icon-pin-s');
    } else {
        top.document.getElementById('freMain').cols = '0,*';
        $(obj).find('span').removeClass('ui-icon-pin-s');
        $(obj).find('span').addClass('ui-icon-pin-w');
    }
};

// 顯示特定物件
function DisplayByID(obj, b) {
    if (b == 'y')
        document.getElementById(obj).style.display = "";
    else
        document.getElementById(obj).style.display = "none";
}

var yh = new function() {
    this.Common = new function() {
        //String
        this.trim = function(strText) {
            return strText.replace(/^\s+|\s+$/g, '').replace(/^[\s　]+|[\s　]+$/g, '');
        };
        this.clrHtmlTag = function(strHTML) {
            return strHTML.replace(/<[^<>]+>/g, '')
        };
        this.repSpecialWord = function(strText) {
            strText = strText.replace(/^\s+|\s+$/g, '').replace(/^[\s　]+|[\s　]+$/g, '');
            strText = strText.replace(/'/g, '');
            strText = strText.replace(/"/g, '');
            strText = strText.replace(/</g, '＜');
            strText = strText.replace(/>/g, '＞');
            return strText;
        };
        this.TrimAndClear = function(strText) {
            strText = strText.replace(/^\s+|\s+$/g, '').replace(/^[\s　]+|[\s　]+$/g, '');
            strText = strText.replace(/'/g, '');
            strText = strText.replace(/"/g, '');
            strText = strText.replace(/</g, '＜');
            strText = strText.replace(/>/g, '＞');
            strText = strText.replace(/<[^<>]+>/g, '')
            return strText;
        };
        this.getRadom = function(intMax) {
            var intR = Math.floor(Math.random() * (intMax + 1));
            if (intR == 0) {
                intR = 1;
            }
            return intR;
        };
        this.ReplaceAll = function(sString, strSource, strObject) {
            while (sString.indexOf(strSource) != -1) {
                sString = sString.replace(strSource, strObject);
            }
            return sString;
        };
        this.Dialog = function(message, callback) {
            $("#dialog:ui-dialog").dialog("destroy");
            document.getElementById("dialog-message").innerHTML = message;
            $("#dialog-message").dialog({
                modal: true,
                buttons: {
                    "确认": function() {
                    if (typeof callback === 'function') callback();
                        $(this).dialog("close");
                    }
                }
            });
        };
        this.Confirm = function(message, Ok_callback, Cancel_callback) {
            $("#dialog:ui-dialog").dialog("destroy");
            document.getElementById("dialog-confirm").innerHTML = message;
            $("#dialog-confirm").dialog({
                resizable: false,
                height: 140,
                modal: true,
                buttons: {
                    "确认": function() {
                        if (typeof Ok_callback === 'function') Ok_callback();
                        $(this).dialog("close");
                    },
                    "关闭": function() {
                        if (typeof Cancel_callback === 'function') Cancel_callback();
                        $(this).dialog("close");
                    }
                }
            });
        };
    };
};

// 顯示Flash
function SafeLoadFlash(sFlashPath, nFlashWidth, nFlashHeight, bIsTransparent) {
    var sOrgFlashPath = sFlashPath;
    var nLastSlashPosion = sOrgFlashPath.lastIndexOf("/");
    var sFlashDirPath = sOrgFlashPath.substr(0, nLastSlashPosion + 1);
    var sFlashFileName = sOrgFlashPath.substr(nLastSlashPosion + 1, sOrgFlashPath.length - nLastSlashPosion - 1).replace('.swf', '');
    try {
        AC_FL_RunContent
        (
            'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
            'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
            'src', sFlashDirPath + sFlashFileName,
            'movie', sFlashDirPath + sFlashFileName,
            'id', sFlashFileName,
            'name', sFlashFileName,
            'width', nFlashWidth,
            'height', nFlashHeight,
            'bgcolor', '#ffffff',
            'quality', 'high',
            'align', 'middle',
            'menu', 'false',
            'play', 'true',
            'loop', 'true',
            'scale', 'showall',
            'wmode', (bIsTransparent ? 'transparent' : 'window'),
            'devicefont', 'false',
            'allowFullScreen', 'false',
            'allowScriptAccess', 'sameDomain',
            'salign', ''
        );
    } catch (e) {
    }
};

// 顯示Flash
function SafeLoadFlashRet(sFlashPath, nFlashWidth, nFlashHeight, bIsTransparent) {
    var sOrgFlashPath = sFlashPath;
    var nLastSlashPosion = sOrgFlashPath.lastIndexOf("/");
    var sFlashDirPath = sOrgFlashPath.substr(0, nLastSlashPosion + 1);
    var sFlashFileName = sOrgFlashPath.substr(nLastSlashPosion + 1, sOrgFlashPath.length - nLastSlashPosion - 1).replace('.swf', '');
    return AC_FL_RunContentRet
    (
        'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
        'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
        'src', sFlashDirPath + sFlashFileName,
        'movie', sFlashDirPath + sFlashFileName,
        'id', sFlashFileName,
        'name', sFlashFileName,
        'width', nFlashWidth,
        'height', nFlashHeight,
        'bgcolor', '#ffffff',
        'quality', 'high',
        'align', 'middle',
        'menu', 'false',
        'play', 'true',
        'loop', 'true',
        'scale', 'showall',
        'wmode', (bIsTransparent ? 'transparent' : 'window'),
        'devicefont', 'false',
        'allowFullScreen', 'true',
        'allowScriptAccess', 'sameDomain',
        'salign', ''
    );
};

// 顯示Flash
var isIE = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;
var swf_params = "";
function My_SWF_params(params) {
    swf_params = params;
};

// 顯示Flash
function ControlVersion() {
    var version;
    var axo;
    var e;
    try {
        axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
        version = axo.GetVariable("$version");
    } catch (e) {
    }
    if (!version) {
        try {
            axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
            version = "WIN 6,0,21,0";
            axo.AllowScriptAccess = "always";
            version = axo.GetVariable("$version");
        } catch (e) {
        }
    }
    if (!version) {
        try {
            axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
            version = axo.GetVariable("$version");
        } catch (e) {
        }
    }
    if (!version) {
        try {
            axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
            version = "WIN 3,0,18,0";
        } catch (e) {
        }
    }
    if (!version) {
        try {
            axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
            version = "WIN 2,0,0,11";
        } catch (e) {
            version = -1;
        }
    }
    return version;
};

// 顯示Flash
function GetSwfVer() {
    var flashVer = -1;
    if (navigator.plugins != null && navigator.plugins.length > 0) {
        if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
            var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
            var flashDescription = navigator.plugins["Shockwave Flash" + swVer2].description;
            var descArray = flashDescription.split(" ");
            var tempArrayMajor = descArray[2].split(".");
            var versionMajor = tempArrayMajor[0];
            var versionMinor = tempArrayMajor[1];
            var versionRevision = descArray[3];
            if (versionRevision == "") {
                versionRevision = descArray[4];
            }
            if (versionRevision[0] == "d") {
                versionRevision = versionRevision.substring(1);
            } else if (versionRevision[0] == "r") {
                versionRevision = versionRevision.substring(1);
                if (versionRevision.indexOf("d") > 0) {
                    versionRevision = versionRevision.substring(0, versionRevision.indexOf("d"));
                }
            }
            var flashVer = versionMajor + "." + versionMinor + "." + versionRevision;
        }
    }
    else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1) flashVer = 4;
    else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1) flashVer = 3;
    else if (navigator.userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 2;
    else if (isIE && isWin && !isOpera) {
        flashVer = ControlVersion();
    }
    return flashVer;
};

// 顯示Flash
function DetectFlashVer(reqMajorVer, reqMinorVer, reqRevision) {
    versionStr = GetSwfVer();
    if (versionStr == -1) {
        return false;
    } else if (versionStr != 0) {
        if (isIE && isWin && !isOpera) {
            tempArray = versionStr.split(" ");
            tempString = tempArray[1];
            versionArray = tempString.split(",");
        } else {
            versionArray = versionStr.split(".");
        }
        var versionMajor = versionArray[0];
        var versionMinor = versionArray[1];
        var versionRevision = versionArray[2];
        if (versionMajor > parseFloat(reqMajorVer)) {
            return true;
        } else if (versionMajor == parseFloat(reqMajorVer)) {
            if (versionMinor > parseFloat(reqMinorVer))
                return true;
            else if (versionMinor == parseFloat(reqMinorVer)) {
                if (versionRevision >= parseFloat(reqRevision))
                    return true;
            }
        }
        return false;
    }
};

// 顯示Flash
function AC_AddExtension(src, ext) {
    if (src.indexOf('?') != -1)
        return src.replace(/\?/, ext + '?');
    else
        return src + ext;
};

// 顯示Flash
function AC_Generateobj(objAttrs, params, embedAttrs) {
    var str = '';
    if (isIE && isWin && !isOpera) {
        str += '<object ';
        for (var i in objAttrs) {
            str += i + '="' + objAttrs[i] + '" ';
        }
        str += '>';
        for (var i in params) {
            str += '<param name="' + i + '" value="' + params[i] + '" /> ';
        }
        str += '</object>';
    } else {
        str += '<embed ';
        for (var i in embedAttrs) {
            str += i + '="' + embedAttrs[i] + '" ';
        }
        str += '> </embed>';
    }
    document.write(str);
};

// 顯示Flash
function AC_GenerateobjRet(objAttrs, params, embedAttrs) {
    var str = '';
    if (isIE && isWin && !isOpera) {
        str += '<object ';
        for (var i in objAttrs) {
            str += i + '="' + objAttrs[i] + '" ';
        }
        str += '>';
        for (var i in params) {
            str += '<param name="' + i + '" value="' + params[i] + '" /> ';
        }
        str += '</object>';
    } else {
        str += '<embed ';
        for (var i in embedAttrs) {
            str += i + '="' + embedAttrs[i] + '" ';
        }
        str += '> </embed>';
    }
    return str;
};

function AC_FL_RunContentRet() {
    var ret =
    AC_GetArgs
    (arguments, ".swf" + swf_params, "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
     , "application/x-shockwave-flash"
    );
    return AC_GenerateobjRet(ret.objAttrs, ret.params, ret.embedAttrs);
};
function AC_FL_RunContent() {
    var ret =
    AC_GetArgs
    (arguments, ".swf" + swf_params, "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
     , "application/x-shockwave-flash"
    );
    AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
};
function AC_SW_RunContent() {
    var ret =
    AC_GetArgs
    (arguments, ".dcr", "src", "clsid:166B1BCA-3F9C-11CF-8075-444553540000"
     , null
    );
    AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
};
function AC_GetArgs(args, ext, srcParamName, classid, mimeType) {
    var ret = new Object();
    ret.embedAttrs = new Object();
    ret.params = new Object();
    ret.objAttrs = new Object();
    for (var i = 0; i < args.length; i = i + 2) {
        var currArg = args[i].toLowerCase();
        switch (currArg) {
            case "classid":
                break;
            case "pluginspage":
                ret.embedAttrs[args[i]] = args[i + 1];
                break;
            case "src":
            case "movie":
                args[i + 1] = AC_AddExtension(args[i + 1], ext);
                ret.embedAttrs["src"] = args[i + 1];
                ret.params[srcParamName] = args[i + 1];
                break;
            case "onafterupdate":
            case "onbeforeupdate":
            case "onblur":
            case "oncellchange":
            case "onclick":
            case "ondblClick":
            case "ondrag":
            case "ondragend":
            case "ondragenter":
            case "ondragleave":
            case "ondragover":
            case "ondrop":
            case "onfinish":
            case "onfocus":
            case "onhelp":
            case "onmousedown":
            case "onmouseup":
            case "onmouseover":
            case "onmousemove":
            case "onmouseout":
            case "onkeypress":
            case "onkeydown":
            case "onkeyup":
            case "onload":
            case "onlosecapture":
            case "onpropertychange":
            case "onreadystatechange":
            case "onrowsdelete":
            case "onrowenter":
            case "onrowexit":
            case "onrowsinserted":
            case "onstart":
            case "onscroll":
            case "onbeforeeditfocus":
            case "onactivate":
            case "onbeforedeactivate":
            case "ondeactivate":
            case "type":
            case "codebase":
            case "id":
                ret.objAttrs[args[i]] = args[i + 1];
                break;
            case "width":
            case "height":
            case "align":
            case "vspace":
            case "hspace":
            case "class":
            case "title":
            case "accesskey":
            case "name":
            case "tabindex":
                ret.embedAttrs[args[i]] = ret.objAttrs[args[i]] = args[i + 1];
                break;
            default:
                ret.embedAttrs[args[i]] = ret.params[args[i]] = args[i + 1];
        }
    };
    ret.objAttrs["classid"] = classid;
    if (mimeType) ret.embedAttrs["type"] = mimeType;
    return ret;
};

/*------------------------  不知到哪邊再用的  ------------------------*/
function changeFrameCols(obj) {
    var imgUrl = obj.src;
    imgUrl = imgUrl.replace("https://" + location.host, "");
    if (top.freMain.cols == "0,*") {
        top.freMain.cols = "180,*";
        obj.src = "/Images/Btn/BtnFrameCloseOver.gif";
    } else {
        top.freMain.cols = "0,*";
        obj.src = "/Images/Btn/BtnFrameOpenOver.gif";
    }
}
function changeFrameBtn(obj) {
    var imgUrl = obj.src;
    imgUrl = imgUrl.replace("https://" + location.host, "");
    if (imgUrl == "/Images/Btn/BtnFrameCloseOut.gif") {
        obj.src = "/Images/Btn/BtnFrameCloseOver.gif";
    } else if (imgUrl == "/Images/Btn/BtnFrameCloseOver.gif") {
        obj.src = "/Images/Btn/BtnFrameCloseOut.gif";
    } else if (imgUrl == "/Images/Btn/BtnFrameOpenOver.gif") {
        obj.src = "/Images/Btn/BtnFrameOpenOut.gif";
    } else {
        obj.src = "/Images/Btn/BtnFrameOpenOver.gif";
    }
}



function DisplayBar(b) {
    if (b == 'y')
        document.getElementById("trBar").style.display = "";
    else
        document.getElementById("trBar").style.display = "none";
}

function DisplayByIDAuto(obj) {
    if (document.getElementById(obj).style.display == '')
        document.getElementById(obj).style.display = "none";
    else
        document.getElementById(obj).style.display = "";
}

function LoadiFrame(trid, iframeid, iframeurl) {
    if (document.getElementById(trid).style.display == '') {
        document.getElementById(trid).style.display = "none";
    }
    else {
        document.getElementById(trid).style.display = "";
        document.getElementById(iframeid).src = iframeurl;
    }
}

function newwindow(link, width, height) {
    window.open(link, '_blank', 'location=no, toolbar=no, menubar=no, status=no, scrollbars=yes, resizable=no, width=' + width + ', height=' + height);
}

function newwindowresize(link, width, height) {
    window.open(link, '_blank', 'location=no, toolbar=no, menubar=no, status=no, scrollbars=yes, resizable=yes, width=' + width + ', height=' + height);
}

function newdialog(link, width, height) {
    window.showModalDialog(link, self, 'modal=yes,width=' + width + ',height=' + height + ',resizable=no,scrollbars=no');
}

function CopyValue(sData) {
    var format = "Text";
    var clipboard = window.clipboardData;
    clipboard.setData(format, sData);
    alert('網址已複製到剪貼簿!');
}



function isMaxLength(obj, mlength) {
    //TextArea Max Length
    //var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : maxlength
    //Setting On onkeyup Event
    if (obj.value.length > mlength)
        obj.value = obj.value.substring(0, mlength)
}


function snaponload(sid, swidth, bid) {
    //check special snapid, then do some action , like: resize etc..
    switch (bid) {
        case "block8":
        case "block9":
        case "block12":
        case "block13":
        case "block14":
        case "block15":
            swidth = 150;
            break;
        case "block2":
        case "block3":
        case "block5":
        case "block6":
        case "block10":
        case "block11":
        case "block16":
            swidth = 310;
            break;
        case "block4":
        case "block7":
            swidth = 620;
            break;
        default:
            swidth = 150;
    }

    //alert(bid + " ~ " + swidth);

    if (sid == 'Snap0_9' || false) {
        //620*265
        //### miniroom size ratio(450,200)
        srcWidth = 620;
        srcHeight = 265;

        //### padding pixel, not to 100%
        iMaxWidth = swidth - 10;

        //### Don't change blow line order..
        srcHeight = iMaxWidth * srcHeight / srcWidth;
        srcWidth = iMaxWidth;
        //### End

        srcHeight = Math.round(srcHeight);
        srcWidth = Math.round(srcWidth);

        //alert(srcWidth + "," + srcHeight);

        document.getElementById('miniroom').width = srcWidth - 8;
        document.getElementById('miniroom').height = srcHeight - 1;
    }
    if (sid == 'Snap0_1' || false) {
        iMaxWidth = Math.round(swidth * 0.85);
        ImageReSizeMaxNoSpac(document.getElementById('ImgMyPic'), iMaxWidth, iMaxWidth);
    }

    //Don't remove it.
    if (document.getElementById('sspanelitem') != null) {
        document.getElementById('sspanelitem').style.visibility = 'visible';
    }

}
function snapmovemouseup() {
    //alert('snapmovemouseup~~~');
}

MyHTMLEncode = function(text) {
    if (typeof (text) != "string")
        text = text.toString();

    text = text.replace(/&/g, "&amp;");
    text = text.replace(/"/g, "&quot;");
    text = text.replace(/</g, "&lt;");
    text = text.replace(/>/g, "&gt;");
    text = text.replace(/'/g, "&#39;");

    return text;
}


var preid = "";

function preidnow() {
    return preid;
}

function playtrial(trialid) {
    var objwmp = "wmptrial";
    var sURL;

    if (parent.window.parent.topframe)
        parent.window.parent.topframe.window.Stop();

    if (window.parent.topframe)
        window.parent.topframe.window.Stop();

    if (window.iFrameShop) {
        if (window.iFrameShop.document.getElementById(objwmp)) {
            window.iFrameShop.document.getElementById(objwmp).controls.stop();
            var idx = window.iFrameShop.preidnow();
            if (idx != '')
                window.iFrameShop.document.getElementById('play' + window.iFrameShop.preidnow()).src = "/myhp/giftshop/image/music_play.gif";
        }
    }

    if (window.parent) {
        if (window.parent.document.getElementById(objwmp)) {
            window.parent.document.getElementById(objwmp).controls.stop();
            var idx = window.parent.preidnow();
            if (idx != '')
                window.parent.document.getElementById('play' + window.parent.preidnow()).src = "/myhp/giftshop/image/music_play.gif";
        }
    }

    if (preid != trialid) {
        if (preid != "")
            document.getElementById('play' + preid).src = "/myhp/giftshop/image/music_play.gif";
        document.getElementById('play' + trialid).src = "/myhp/giftshop/image/music_stop.gif";

        document.getElementById(objwmp).URL = "../PlayListTrial.aspx?trialid=" + trialid;
        document.getElementById(objwmp).controls.play();
    }
    else {
        //alert(document.getElementById(objwmp).playState);
        if (document.getElementById(objwmp).playState == 3) {	//play
            document.getElementById(objwmp).controls.stop();
            document.getElementById('play' + trialid).src = "/myhp/giftshop/image/music_play.gif";
        }
        else {
            document.getElementById(objwmp).URL = "../PlayListTrial.aspx?trialid=" + trialid;
            document.getElementById('play' + trialid).src = "/myhp/giftshop/image/music_stop.gif";
            document.getElementById(objwmp).controls.play();
        }

    }

    preid = trialid;
}


var srcColor = '';

function OnChangeColor(sFunc, obj, sChgColor) {
    //obj.id
    //obj.innerText

    switch (sFunc) {
        case 'on':
            if (sChgColor == '') {
                sChgColor = '#DEDEDE';
                //sChgColor = '#FDEFDE';						
            }
            srcColor = obj.style.backgroundColor;
            obj.style.backgroundColor = sChgColor;
            obj.style.color = 'blue';
            break;
        case 'off':
            obj.style.backgroundColor = srcColor;
            obj.style.color = '#000000';
            //if (sColor.indexOf("," + obj.style.backgroundColor + ",") == -1) {
            //	obj.style.backgroundColor = 'white';
            //}
            break;
    }
}

function SelectCheckbox_All(name, value) {
    var forminputs;
    forminputs = document.getElementsByTagName('input');

    for (i = 0; i < forminputs.length; i++) {
        //regex here to check name attribute
        var regex = new RegExp(name, "i");
        if (regex.test(forminputs[i].getAttribute('name'))) {
            if (value == '1') {
                forminputs[i].checked = true;
            }
            else {
                forminputs[i].checked = false;
            }
        }
    }
}

//For IE 複製到剪貼簿
function copyToClipboard(txt) {

    if (window.clipboardData) { window.clipboardData.clearData(); window.clipboardData.setData("Text", txt); }
    else if (navigator.userAgent.indexOf("Opera") != -1) { window.location = txt; } else if (window.netscape) { try { netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); } catch (e) { alert("被瀏覽器拒絕！\n請在瀏覽器地址欄輸入'about:config'並回車\n然後將'signed.applets.codebase_principal_support'設置為'true'"); } var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard); if (!clip) return; var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable); if (!trans) return; trans.addDataFlavor('text/unicode'); var str = new Object(); var len = new Object(); var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString); var copytext = txt; str.data = copytext; trans.setTransferData("text/unicode", str, copytext.length * 2); var clipid = Components.interfaces.nsIClipboard; if (!clip) return false; clip.setData(trans, null, clipid.kGlobalClipboard); }
    //        alert('已經複製');
}
	