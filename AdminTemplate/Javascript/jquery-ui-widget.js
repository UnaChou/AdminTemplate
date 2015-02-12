$.widget('ui.form', {
    options: {
        thHeight: '40px',
        thColor: null,
        tdHeight: '35px',
        tdColor: null
    },
    _init: function() {
        var obj = this.element,
            options = this.options;
            
        var theme = GetCookie('jquery-ui-theme');
        if ((theme == null || theme == 'cupertino') && options.thColor == null) {
            options.thColor = '#2779aa';
        }
        
        $(obj).removeAttr('cellpadding').removeAttr('cellspacing').attr('width', function() {return ($(this).attr('width') == '') ? '90%' : $(this).attr('width');}).children('tbody').children('tr')
        .children('th').addClass('ui-widget-header').css({'font-weight':'bold', 'padding': '0px 5px', 'height': options.thHeight, 'color': ((options.thColor) ? options.thColor : '')}).end()
        .children('td').addClass('ui-widget-content').css({'padding': '0px 5px', 'height': options.tdHeight, 'color': ((options.tdColor) ? options.tdColor : '')}).end()
        .find('input, select, textarea').addClass('ui-state-default ui-corner-all');
        
    }
});


$.widget('ui.table', {
    options: {
        thHeight: '25px',
        thColor: null,
        tdHeight: '23px',
        tdColor: null,
        bHover: true,
        bClick: true
    },
    _init: function() {
        var obj = this.element,
            options = this.options;
            
        var theme = GetCookie('jquery-ui-theme');
        if ((theme == null || theme == 'cupertino') && options.thColor == null) {
            options.thColor = '#2779aa';
        }
        
        $(obj).removeAttr('cellpadding').removeAttr('cellspacing').attr('width', function() {return ($(this).attr('width') == '') ? '90%' : $(this).attr('width');}).children('tbody').children('tr')
        .children('th').addClass('ui-widget-header').css({'font-weight':'bold', 'height': options.thHeight, 'color': ((options.thColor) ? options.thColor : '')}).end()
        .children('td').addClass('ui-widget-content').css({'height': options.tdHeight, 'color': ((options.tdColor) ? options.tdColor : '')}).end()
        .find('input, select, textarea').addClass('ui-state-default ui-corner-all');
        
        if (options.bHover == true) {
            $(obj).children('tbody').children('tr').hover(
                function() {
                    $(this).children('td').addClass('ui-state-hover');
                },
                function() {
                    $(this).children('td').removeClass('ui-state-hover');
                }
            );
        }
        
        if (options.bClick == true) {
            $(obj).children('tbody').children('tr').click(function() {
                $(this).children('td').toggleClass('ui-state-highlight');
            });
        }
        
    }
});


$.widget('8zy.paging', {
    _init: function() {
        var obj = this.element;
        
        $(obj).css('width', '90%').addClass('ui-widget').addClass('ui-widget-content')
        .css({'padding':'7px 0px', 'margin-top':'5px', 'text-align':'right'})
        .children('span').addClass('ui-state-default')
        .css({'padding':'2px 5px', 'margin-right':'5px'}).end()
        .children('a').addClass('ui-state-default')
        .css({'padding':'2px 5px', 'margin-right':'5px', 'text-decoration':'none'})
        .hover(
            function() {
                $(this).addClass('ui-state-hover');
            },
            function() {
                $(this).removeClass('ui-state-hover');
            }
        );
        
    }
});


$.widget('ui.pager', {
    _init: function() {
        var obj = this.element;
        
        
        $(obj).addClass('ui-datepicker-inline')
        .addClass('ui-datepicker')
        .addClass('ui-widget')
        .addClass('ui-widget-content')
        .addClass('ui-helper-clearfix')
        .css('display', 'block');
        
        $(obj).find('table').each(function() {
            $(this).addClass('ui-datepicker-calendar');
        });
        
        $(obj).find('a').each(function() {
            $(this).addClass('ui-state-default');
            $(this).css('text-align', 'center');
        });
        
        $(obj).find('td').hover(
            function() {
                $(this).children('a').addClass('ui-state-hover');
            },
            function() {
                $(this).children('a').removeClass('ui-state-hover');
            }
        );
    }
});


$.widget('ui.buttonsetv', {
    options: {
        margin: null,
        height: null,
        width: null
    },
    _init: function() {
        var obj = this.element,
            options = this.options;
        $(obj).buttonset();
        
        if (options.margin != null) {
            $(':radio, :checkbox', obj).wrap('<div style="margin:' + options.margin + '" />');
        }
        
        if (options.height != null) {
            $('label', obj).css('height', options.height);
        }
        
        if (options.width != null) {
            $('label', obj).css('width', options.width);
        } else {
            var maxWidth = 0;
            $('label', obj).each(function(index){
                 if ($(this).width() > maxWidth) { maxWidth = $(this).width(); } 
            });
            
            $('label', obj).each(function(index){
                 $(this).width(maxWidth); 
            });
        }
        
        $('label:first', obj).removeClass('ui-corner-left').addClass('ui-corner-top');
        $('label:last', obj).removeClass('ui-corner-right').addClass('ui-corner-bottom');
    }
});

function GetCookie(Name) {
    var strcookie=document.cookie;
    var arrcookie=strcookie.split("; ");
    for(var gc=0;gc<arrcookie.length;gc++) {
        if (arrcookie[gc].substring(0, arrcookie[gc].indexOf("=")) == Name) {
            return unescape(arrcookie[gc].substring(arrcookie[gc].indexOf("=")+1, arrcookie[gc].length)); }
    }
}