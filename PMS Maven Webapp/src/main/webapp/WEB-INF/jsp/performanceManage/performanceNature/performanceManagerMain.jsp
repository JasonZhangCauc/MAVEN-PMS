<!-- 绩效档案主界面  005642 20180305-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp" %>
<div class="row">
	<div class="col-md-7">
	    <div class="portlet light bordered">
	        <div class="portlet-title">
	            <div class="caption">
	                <i class="icon-settings font-dark"></i>
	                <span class="caption-subject font-dark sbold uppercase">基本信息</span>
	            </div>
	            <div class="tools">
                    <a href="javascript:;" class="collapse" data-original-title="" title=""> </a>
                    <a href="javascript:;" class="reload" data-original-title="" title=""> </a>
                </div>
	        </div>
	        <div class="portlet-body form">
	            <form class="form-horizontal" role="form">
	                <div class="form-body">
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Block Help</label>
	                        <div class="col-md-7">
	                            <input type="text" class="form-control" placeholder="Enter text">
	                            <span class="help-block"> A block of help text. </span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Inline Help</label>
	                        <div class="col-md-7">
	                            <input type="text" class="form-control input-inline input-medium" placeholder="Enter text">
	                            <span class="help-inline"> Inline help. </span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Input Group</label>
	                        <div class="col-md-7">
	                            <div class="input-inline input-medium">
	                                <div class="input-group">
	                                    <span class="input-group-addon">
	                                        <i class="fa fa-user"></i>
	                                    </span>
	                                    <input type="email" class="form-control" placeholder="Email Address"> </div>
	                            </div>
	                            <span class="help-inline"> Inline help. </span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Email Address</label>
	                        <div class="col-md-7">
	                            <div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fa fa-envelope"></i>
	                                </span>
	                                <input type="email" class="form-control" placeholder="Email Address"> </div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Password</label>
	                        <div class="col-md-7">
	                            <div class="input-group">
	                                <input type="password" class="form-control" placeholder="Password">
	                                <span class="input-group-addon">
	                                    <i class="fa fa-user"></i>
	                                </span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Left Icon</label>
	                        <div class="col-md-7">
	                            <div class="input-icon">
	                                <i class="fa fa-bell-o"></i>
	                                <input type="text" class="form-control" placeholder="Left icon"> </div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Right Icon</label>
	                        <div class="col-md-7">
	                            <div class="input-icon right">
	                                <i class="fa fa-microphone"></i>
	                                <input type="text" class="form-control" placeholder="Right icon"> </div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Icon Input in Group Input</label>
	                        <div class="col-md-7">
	                            <div class="input-group">
	                                <div class="input-icon">
	                                    <i class="fa fa-lock fa-fw"></i>
	                                    <input id="newpassword" class="form-control" type="text" name="password" placeholder="password" /> </div>
	                                <span class="input-group-btn">
	                                    <button id="genpassword" class="btn btn-success" type="button">
	                                        <i class="fa fa-arrow-left fa-fw" /></i> Random</button>
	                                </span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Input With Spinner</label>
	                        <div class="col-md-7">
	                            <input type="password" class="form-control spinner" placeholder="Password"> </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Static Control</label>
	                        <div class="col-md-7">
	                            <p class="form-control-static"> email@example.com </p>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Disabled</label>
	                        <div class="col-md-7">
	                            <input type="password" class="form-control" placeholder="Disabled" disabled> </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-md-2 control-label">Readonly</label>
	                        <div class="col-md-7">
	                            <input type="password" class="form-control" placeholder="Readonly" readonly> </div>
	                    </div>
	                </div>
	                <div class="form-actions">
                         <div class="row">
                             <div class="col-md-offset-2 col-md-10">
                                 <button type="submit" class="btn green">Submit</button>
                                 <button type="button" class="btn default">Cancel</button>
                             </div>
                         </div>
                     </div>
	            </form>
	        </div>
	    </div>
	</div>
    <div class="col-md-5">
        <div class="portlet light portlet-fit bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-microphone font-green"></i>
                    <span class="caption-subject bold font-green uppercase"> 操作记录</span>
                    <span class="caption-helper">最后更新时间：2018-10-10</span>
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse" data-original-title="" title=""> </a>
                    <a href="javascript:;" class="reload" data-original-title="" title=""> </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="timeline">
                    <!-- TIMELINE ITEM -->
                    <div class="timeline-item">
                        <div class="timeline-badge">
                            <img class="timeline-badge-userpic" src="../assets/pages/media/users/avatar80_1.jpg"> </div>
                        <div class="timeline-body">
                            <div class="timeline-body-arrow"> </div>
                            <div class="timeline-body-head">
                                <div class="timeline-body-head-caption">
                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">周敏</a>
                                    <span class="timeline-body-time font-grey-cascade">14:30:25</span>
                                </div>
                            </div>
                            <div class="timeline-body-content">
                                <span class="font-grey-cascade"> 
                                    <p>新增一条档案信息. </p>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- END TIMELINE ITEM -->
                    <!-- TIMELINE ITEM -->
                    <div class="timeline-item">
                        <div class="timeline-badge">
                            <img class="timeline-badge-userpic" src="../assets/pages/media/users/avatar80_2.jpg"> </div>
                        <div class="timeline-body">
                            <div class="timeline-body-arrow"> </div>
                            <div class="timeline-body-head">
                                <div class="timeline-body-head-caption">
                                    <a href="javascript:;" class="timeline-body-title font-blue-madison">周敏</a>
                                    <span class="timeline-body-time font-grey-cascade">14:30:25</span>
                                </div>
                                <div class="timeline-body-head-actions"> </div>
                            </div>
                            <div class="timeline-body-content">
                                 <span class="font-grey-cascade"> 
                                    <p>将电话从 4008-202-126 更新为 4008-202-126. </p>
                                    <p>将电话从 4008-202-126 更新为 4008-202-126. </p>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- END TIMELINE ITEM -->
                </div>
            </div>
        </div>
    </div>
</div>