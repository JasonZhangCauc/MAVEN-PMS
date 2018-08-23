/**
 * Created by joe on 15-11-13.
 */
$(function () {
    $('body').on('click', '[addtabs]', function () {
        addTabs({
            id: $(this).attr("addtabs"),
            title: $(this).attr('title')?$(this).attr('title'):$(this).html(),
            content: $(this).attr('content'),
            url: $(this).attr('url'),
            close: true
        });
    });
    
    $(window).resize(function () {
    	$('body').find('iframe').attr('height', "100%");
        tabsdrop($('.nav-tabs-add'));
    });

    $(".nav-tabs-add").on("click", "a", function (e) {
        var id=$(e.target).attr("aria-controls");
        $.CurrentNavtab=$("#"+id);
    });
    
    $(".nav-tabs-add").on("click", ".close-tab", function () {
        id = $(this).prev("a").attr("aria-controls");
        closeTab(id);
    });
    var ide= "";
    $("ul.nav-tabs-add").mouseover(function (e) {
        ide=$(e.target).attr("aria-controls");
        if(ide == "home"){
        	ide = "";
        }
    });
});

var addTabs = function (obj) {
    id = "tab_" + obj.id;

    $(".active").removeClass("active");

    //如果TAB不存在，创建一个新的TAB
    if (!$("#" + id)[0]) {
        //固定TAB中IFRAME高度,根据需要自己修改
        mainHeight = $(document).height() - 105;
        //创建新TAB的title
        title = $('<li role="' + id + '" id="tab_' + id + '"><a href="#' + id + '" aria-controls="' + id + '" role="tab" data-toggle="tab">' + obj.title + '</a></li>');
        //是否允许关闭
        if (obj.close) {
            title.append(' <i class="close-tab"><i class="fa fa-times-circle"></i></i>');
        }
        //创建新TAB的内容
        content = $('<div role="' + id + '" class="tab-pane" id="' + id + '"></div>');
        //是否指定TAB内容
        if (obj.content) {
            content.append(obj.content);
        }
        //加入TABS
        $(".nav-tabs-add").append(title);
        $("#tab-content-div").append(content);
        loadDiv(id, obj.url, null);
    }else{
    	$("#tab_"+id).html('<a href="#' + id + '" aria-controls="' + id + '" role="tab" data-toggle="tab">' + obj.title + '</a><i class="close-tab"><i class="fa fa-times-circle"></i></i>');
    	loadDiv(id, obj.url, null);
    }
    //激活TAB
    $("#tab_" + id).addClass('active');
    $("#" + id).addClass("active");
    tabsdrop($('.nav-tabs-add'));
    $.CurrentNavtab=$("#" + id);
    
    $("ul.nav-tabs-add>li").contextMenu("rightMenu",{
		bindings:   
	    {  
	      'closeOwnMenu': function(e) {
	    	  var ide=$(e).attr("role");
    		  closeTab(ide);
	      },  
	      'closeOtherMenu': function(e) {  
	    	 var ide=$(e).attr("role");
	    	 $('#contextLoadDiv .nav-tabs li').each(function(i,n){
	 	   			var t = $(n).attr("role");
	 	   			if(t!="presentation" && t!=ide){
	 	   			    closeTab(t);
	 	   			}
	 	   	 });
	      },  
	      'closeAllMenu': function(e) {  
	    	 $('#contextLoadDiv .nav-tabs li').each(function(i,n){
	 	   			var t = $(n).attr("role");
	 	   			if(t!="presentation"){
	 	   			    closeTab(t);
	 	   			}
	 	   	 });
	      }  
	    }  
	});
};

var tabsdrop = function (element) {
    //创建下拉标签
    var dropdown = $('<li class="dropdown pull-right hide tabdrop"><a class="dropdown-toggle" data-toggle="dropdown" href="#">' +
        '<i class="glyphicon glyphicon-align-justify"></i>' +
        ' <b class="caret"></b></a><ul class="dropdown-menu"></ul></li>');
    //检测是否已增加
    if (!$('.tabdrop').html()) {
        dropdown.prependTo(element);
    } else {
        dropdown = element.find('.tabdrop');
    }
    //检测是否有下拉样式
    if (element.parent().is('.tabs-below')) {
        dropdown.addClass('dropup');
    }
    var collection = 0;

    //检查超过一行的标签页
    element.append(dropdown.find('li'))
        .find('>li')
        .not('.tabdrop')
        .each(function () {
            if (this.offsetTop > 30) {
                dropdown.find('ul').append($(this));
                collection++;
            }
        });

    //如果有超出的，显示下拉标签
    if (collection > 0) {
        dropdown.removeClass('hide');
        if (dropdown.find('.active').length == 1) {
            dropdown.addClass('active');
        } else {
            dropdown.removeClass('active');
        }
    } else {
        dropdown.addClass('hide');
    }
};

var closeTab = function (id) {
    //如果关闭的是当前激活的TAB，激活他的前一个TAB
    if ($("li.active").attr('id') == "tab_" + id) {
        $("#tab_" + id).prev().addClass('active');
        $("#" + id).prev().addClass('active');
        $.CurrentNavtab=$("#" + id).prev();
    }
    //关闭TAB
    $("#tab_" + id).remove();
    $("#" + id).remove();
    tabsdrop($('.nav-tabs-add'));
};

