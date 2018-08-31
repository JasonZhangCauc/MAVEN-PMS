<%-- jsp头部引用文件-公共使用 --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--<![endif]-->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<%--<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />--%>
<link href="<%=request.getContextPath()%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-summernote/summernote.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/codemirror/lib/codemirror.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/codemirror/theme/neat.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/codemirror/theme/ambiance.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/codemirror/theme/material.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/codemirror/theme/neo.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/zTree_v3/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-addtabs/bootstrap-addtabs.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/niceValidator/jquery.validator.css" rel="stylesheet" type="text/css" />
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/ladda/ladda-themeless.min.css" rel="stylesheet" type="text/css" />
<!-- BEGIN THEME GLOBAL STYLES -->
<link href='<%=request.getContextPath()%>/assets/global/plugins/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href="<%=request.getContextPath()%>/assets/global/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/css/plugins.css" rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<link href="<%=request.getContextPath()%>/assets/apps/css/todo.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/apps/css/todo-2.min.css" rel="stylesheet" type="text/css" />
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="<%=request.getContextPath()%>/assets/layouts/layout2/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/layouts/layout2/css/themes/grey.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="<%=request.getContextPath()%>/assets/layouts/layout2/css/custom.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/webuploader/css/webuploader.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/webuploader/css/style.css" rel="stylesheet" type="text/css" />
<!-- END THEME LAYOUT STYLES -->
<link rel="shortcut icon" href="favicon.ico" /> 
<!-- END QUICK NAV -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=request.getContextPath()%>/assets/global/plugins/respond.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/excanvas.min.js"></script> 
<script src="<%=request.getContextPath()%>/assets/global/plugins/ie8.fix.min.js"></script> 
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-sweetalert/sweetalert.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/scripts/datatable.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/niceValidator/jquery.validator.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/niceValidator/local/zh-CN.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootbox/bootbox.min.js"></script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/ammap/maps/js/worldLow.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/horizontal-timeline/horizontal-timeline.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/codemirror/lib/codemirror.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/codemirror/mode/javascript/javascript.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/codemirror/mode/htmlmixed/htmlmixed.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/codemirror/mode/css/css.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-summernote/summernote.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-repeater/jquery.repeater.js" type="text/javascript"></script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/ladda/spin.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/ladda/ladda.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/pages/scripts/dashboard.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/layouts/layout2/scripts/layout.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/layouts/layout2/scripts/demo.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
<!-- END THEME LAYOUT SCRIPTS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/typeahead/handlebars.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/typeahead/typeahead.bundle.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/zTree_v3/js/jquery.ztree.core-3.5.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/zTree_v3/js/jquery.ztree.excheck-3.5.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/zTree_v3/js/jquery.ztree.exedit-3.5.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-addtabs/jquery.contextmenu.r2.js"></script> 
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-addtabs/bootstrap-addtabs.js" type="text/javascript"></script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-form/jQuery-form.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/common/menu.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/common/common.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/common/security.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/webuploader/js/webuploader.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/webuploader/js/editableGallery.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/webuploader/js/commonWebUploader.js" type="text/javascript" ></script>

<!-- zhoumin -->
<script src='<%=request.getContextPath()%>/assets/global/plugins/fullcalendar/lib/moment.min.js'></script>
<script src='<%=request.getContextPath()%>/assets/global/plugins/fullcalendar/fullcalendar.js'></script>
<script src='<%=request.getContextPath()%>/assets/global/plugins/fullcalendar/lang/zh-cn.js'></script>

<!-- 日期控件 -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>

<!-- 进度条 -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/ion.rangeslider/js/ion.rangeSlider.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/assets/global/plugins/ion.rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/plugins/ion.rangeslider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet" type="text/css" />
