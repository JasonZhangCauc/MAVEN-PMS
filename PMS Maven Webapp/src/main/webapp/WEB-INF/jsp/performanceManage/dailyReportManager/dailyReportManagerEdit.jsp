<!-- 角色新增/编辑界面 ZHOUMIN 20180305 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="portlet light portlet-fit ">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-directions font-green hide"></i>
            <span class="caption-subject bold font-dark uppercase "> 报告</span>
            <span class="caption-helper">Horizontal Timeline</span>
        </div>
        <div class="actions">
            <div class="btn-group">
                <a class="btn blue btn-outline btn-circle btn-sm" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> 报告类型
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <a href="javascript:;"> 日报</a>
                    </li>
                    <li class="divider"> </li>
                    <li>
                        <a href="javascript:;"> 月报</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="portlet-body">
        <div class="cd-horizontal-timeline mt-timeline-horizontal" data-spacing="60">
            <div class="timeline">
                <div class="events-wrapper">
                    <div class="events">
                        <ol>
                            <li>
                                <a href="#0" data-date="16/01/2014" class="border-after-red bg-after-red selected">16 Jan</a>
                            </li>
                            <li>
                                <a href="#0" data-date="28/02/2014" class="border-after-red bg-after-red">28 Feb</a>
                            </li>
                            <li>
                                <a href="#0" data-date="20/04/2014" class="border-after-red bg-after-red">20 Mar</a>
                            </li>
                            <li>
                                <a href="#0" data-date="20/05/2014" class="border-after-red bg-after-red">20 May</a>
                            </li>
                            <li>
                                <a href="#0" data-date="09/07/2014" class="border-after-red bg-after-red">09 Jul</a>
                            </li>
                            <li>
                                <a href="#0" data-date="30/08/2014" class="border-after-red bg-after-red">30 Aug</a>
                            </li>
                            <li>
                                <a href="#0" data-date="15/09/2014" class="border-after-red bg-after-red">15 Sep</a>
                            </li>
                            <li>
                                <a href="#0" data-date="01/11/2014" class="border-after-red bg-after-red">01 Nov</a>
                            </li>
                            <li>
                                <a href="#0" data-date="10/12/2014" class="border-after-red bg-after-red">10 Dec</a>
                            </li>
                            <li>
                                <a href="#0" data-date="19/01/2015" class="border-after-red bg-after-red">29 Jan</a>
                            </li>
                            <li>
                                <a href="#0" id="test_pest" data-date="03/03/2015" class="border-after-red bg-after-red">3 Mar - 1</a>
                            </li>
                        </ol>
                        <span class="filling-line bg-red" aria-hidden="true"></span>
                    </div>
                    <!-- .events -->
                </div>
                <!-- .events-wrapper -->
                <ul class="cd-timeline-navigation mt-ht-nav-icon">
                    <li>
                        <a href="#0" class="prev inactive btn btn-outline red md-skip">
                            <i class="fa fa-chevron-left"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#0" class="next btn btn-outline red md-skip">
                            <i class="fa fa-chevron-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- .cd-timeline-navigation -->
            </div>
            <!-- .timeline -->
            <div class="events-content">
                <ol>
                    <li class="selected" data-date="16/01/2014">
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_3.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Andres Iniesta</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">16 January 2014 : 7:45 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <div class="row">
                                <div class="portlet light bordered">
                                    <div class="portlet-body form">
                                        <!-- BEGIN FORM-->
                                        <form action="#" class="form-horizontal">
                                            <div class="form-body">
                                                <h3 class="form-section">Person Info</h3>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                         <textarea class="wysihtml5 form-control" rows="6"></textarea>
                                                    </div>
                                                </div>
                                                <h3 class="form-section">Address</h3>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                         <textarea class="wysihtml5 form-control" rows="6"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <!-- END FORM-->
                                    </div>
                                </div>
                            </div>
                            <a href="javascript:;" class="btn btn-circle red btn-outline">Read More</a>
                            <a href="javascript:;" class="btn btn-circle btn-icon-only blue">
                                <i class="fa fa-plus"></i>
                            </a>
                            <a href="javascript:;" class="btn btn-circle btn-icon-only green pull-right">
                                                                                        关
                            </a>
                        </div>
                    </li>
                    <li data-date="28/02/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Sending Shipment</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_3.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Hugh Grant</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">28 February 2014 : 10:15 AM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod eleifend ipsum, at posuere augue. Pellentesque mi felis, aliquam at iaculis eu, finibus eu ex. Integer efficitur leo eget dolor
                                tincidunt, et dignissim risus lacinia. Nam in egestas nunc. Suspendisse potenti. Cras ullamcorper tincidunt malesuada. Sed sit amet molestie elit, vel placerat ipsum. Ut consectetur odio non
                                est rhoncus volutpat. Nullam interdum, neque quis vehicula ornare, lacus elit dignissim purus, quis ultrices erat tortor eget felis. Cras commodo id massa at condimentum. Praesent dignissim luctus
                                risus sed sodales.</p>
                            <a href="javascript:;" class="btn btn-circle btn-outline green-jungle">Download Shipment List</a>
                            <div class="btn-group dropup pull-right">
                                <button class="btn btn-circle blue-steel dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="false"> Actions
                                    <i class="fa fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li>
                                        <a href="javascript:;">Action </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Another action </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Something else here </a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="javascript:;">Separated link </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li data-date="20/04/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Blue Chambray</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_1.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue">Rory Matthew</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">20 April 2014 : 10:45 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod eleifend ipsum, at posuere augue. Pellentesque mi felis, aliquam at iaculis eu, finibus eu ex. Integer efficitur leo eget dolor
                                tincidunt, et dignissim risus lacinia. Nam in egestas nunc. Suspendisse potenti. Cras ullamcorper tincidunt malesuada. Sed sit amet molestie elit, vel placerat ipsum. Ut consectetur odio non
                                est rhoncus volutpat. Nullam interdum, neque quis vehicula ornare, lacus elit dignissim purus, quis ultrices erat tortor eget felis. Cras commodo id massa at condimentum. Praesent dignissim luctus
                                risus sed sodales.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis
                                qui ut. laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis qui ut. </p>
                            <a href="javascript:;" class="btn btn-circle red">Read More</a>
                        </div>
                    </li>
                    <li data-date="20/05/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Timeline Received</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_2.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Andres Iniesta</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">20 May 2014 : 12:20 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod eleifend ipsum, at posuere augue. Pellentesque mi felis, aliquam at iaculis eu, finibus eu ex. Integer efficitur leo eget dolor
                                tincidunt, et dignissim risus lacinia. Nam in egestas nunc. Suspendisse potenti. Cras ullamcorper tincidunt malesuada. Sed sit amet molestie elit, vel placerat ipsum. Ut consectetur odio non
                                est rhoncus volutpat. Nullam interdum, neque quis vehicula ornare, lacus elit dignissim purus, quis ultrices erat tortor eget felis. Cras commodo id massa at condimentum. Praesent dignissim luctus
                                risus sed sodales.</p>
                            <a href="javascript:;" class="btn btn-circle green-turquoise">Read More</a>
                        </div>
                    </li>
                    <li data-date="09/07/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Event Success</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_1.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Matt Goldman</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">9 July 2014 : 8:15 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde.</p>
                            <a href="javascript:;" class="btn btn-circle btn-outline purple-medium">View Summary</a>
                            <div class="btn-group dropup pull-right">
                                <button class="btn btn-circle green dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="false"> Actions
                                    <i class="fa fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li>
                                        <a href="javascript:;">Action </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Another action </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Something else here </a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="javascript:;">Separated link </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li data-date="30/08/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Conference Call</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_1.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Rory Matthew</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">30 August 2014 : 5:45 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <img class="timeline-body-img pull-left" src="../assets/pages/media/blog/5.jpg" alt="">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis
                                qui ut. laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis qui ut. </p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis
                                qui ut. laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis qui ut. </p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis
                                qui ut. laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis qui ut. </p>
                            <a href="javascript:;" class="btn btn-circle red">Read More</a>
                        </div>
                    </li>
                    <li data-date="15/09/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Conference Decision</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_5.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Jessica Wolf</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">15 September 2014 : 8:30 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <img class="timeline-body-img pull-right" src="../assets/pages/media/blog/6.jpg" alt="">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde? Iste voluptatibus minus veritatis
                                qui ut.</p>
                            <a href="javascript:;" class="btn btn-circle green-sharp">Read More</a>
                        </div>
                    </li>
                    <li data-date="01/11/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Timeline Received</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_2.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Andres Iniesta</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">1 November 2014 : 12:20 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod eleifend ipsum, at posuere augue. Pellentesque mi felis, aliquam at iaculis eu, finibus eu ex. Integer efficitur leo eget dolor
                                tincidunt, et dignissim risus lacinia. Nam in egestas nunc. Suspendisse potenti. Cras ullamcorper tincidunt malesuada. Sed sit amet molestie elit, vel placerat ipsum. Ut consectetur odio non
                                est rhoncus volutpat. Nullam interdum, neque quis vehicula ornare, lacus elit dignissim purus, quis ultrices erat tortor eget felis. Cras commodo id massa at condimentum. Praesent dignissim luctus
                                risus sed sodales.</p>
                            <a href="javascript:;" class="btn btn-circle green-turquoise">Read More</a>
                        </div>
                    </li>
                    <li data-date="10/12/2014">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Timeline Received</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_2.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Andres Iniesta</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">10 December 2015 : 12:20 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod eleifend ipsum, at posuere augue. Pellentesque mi felis, aliquam at iaculis eu, finibus eu ex. Integer efficitur leo eget dolor
                                tincidunt, et dignissim risus lacinia. Nam in egestas nunc. Suspendisse potenti. Cras ullamcorper tincidunt malesuada. Sed sit amet molestie elit, vel placerat ipsum. Ut consectetur odio non
                                est rhoncus volutpat. Nullam interdum, neque quis vehicula ornare, lacus elit dignissim purus, quis ultrices erat tortor eget felis. Cras commodo id massa at condimentum. Praesent dignissim luctus
                                risus sed sodales.</p>
                            <a href="javascript:;" class="btn btn-circle green-turquoise">Read More</a>
                        </div>
                    </li>
                    <li data-date="19/01/2015">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Timeline Received</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_2.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Andres Iniesta</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">19 January 2015 : 12:20 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod eleifend ipsum, at posuere augue. Pellentesque mi felis, aliquam at iaculis eu, finibus eu ex. Integer efficitur leo eget dolor
                                tincidunt, et dignissim risus lacinia. Nam in egestas nunc. Suspendisse potenti. Cras ullamcorper tincidunt malesuada. Sed sit amet molestie elit, vel placerat ipsum. Ut consectetur odio non
                                est rhoncus volutpat. Nullam interdum, neque quis vehicula ornare, lacus elit dignissim purus, quis ultrices erat tortor eget felis. Cras commodo id massa at condimentum. Praesent dignissim luctus
                                risus sed sodales.</p>
                            <a href="javascript:;" class="btn btn-circle green-turquoise">Read More</a>
                        </div>
                    </li>
                    <li data-date="03/03/2015">
                        <div class="mt-title">
                            <h2 class="mt-content-title">Timeline Received</h2>
                        </div>
                        <div class="mt-author">
                            <div class="mt-avatar">
                                <img src="../assets/pages/media/users/avatar80_2.jpg" />
                            </div>
                            <div class="mt-author-name">
                                <a href="javascript:;" class="font-blue-madison">Andres Iniesta</a>
                            </div>
                            <div class="mt-author-datetime font-grey-mint">3 March 2015 : 12:20 PM</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mt-content border-grey-steel">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod eleifend ipsum, at posuere augue. Pellentesque mi felis, aliquam at iaculis eu, finibus eu ex. Integer efficitur leo eget dolor
                                tincidunt, et dignissim risus lacinia. Nam in egestas nunc. Suspendisse potenti. Cras ullamcorper tincidunt malesuada. Sed sit amet molestie elit, vel placerat ipsum. Ut consectetur odio non
                                est rhoncus volutpat. Nullam interdum, neque quis vehicula ornare, lacus elit dignissim purus, quis ultrices erat tortor eget felis. Cras commodo id massa at condimentum. Praesent dignissim luctus
                                risus sed sodales.</p>
                            <a href="javascript:;" class="btn btn-circle green-turquoise">Read More</a>
                        </div>
                    </li>
                </ol>
            </div>
            <!-- .events-content -->
        </div>
    </div>
</div>
<!-- 参数列表 -->
<script type="text/javascript">
	$("#dailyReportEditFormId #reportType").initDic('${dailyReportVo.reportType}',codeBasicInfo.reportType);
	$("#dailyReportEditFormId #proId").initProjectInfo('${dailyReportVo.proId}');
	
	var dailyReportVal=$("#dailyReportEditFormId").serializeFormJson();
    var dailyReportColumn = {
        proId:"<spring:message code='label.dailyReportManager.proNum' />",
		reportType:"<spring:message code='label.dailyReportManager.reportType' />",
		taskToday:"<spring:message code='label.dailyReportManager.taskToday' />",
		questionToday:"<spring:message code='label.dailyReportManager.questionToday' />",
		conclusionToday:"<spring:message code='label.dailyReportManager.conclusionToday' />",
		planTomorrow:"<spring:message code='label.dailyReportManager.planTomorrow' />"   
    };
</script>
<!-- 引用js -->
<script src="<%=request.getContextPath()%>/assets/pages/scripts/components-bootstrap-tagsinput.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/pages/scripts/components-editors.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/horizontal-timeline/horizontal-timeline.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/performanceManager/dailyReportManager/dailyReportManagerEdit.js"></script>