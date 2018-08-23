/*********************************
 * Themes, rules, and i18n support
 * Locale: Chinese; 中文
 *********************************/
(function(factory) {
    'function' === typeof define && (define.amd || define.cmd) ? define(function(require, exports, module){
        var $ = require('jquery')||jQuery; $._VALIDATOR_URI = module.uri;
        require('../jquery.validator')($);
        factory($);
    }) : factory(jQuery);
}(function($) {

    /* Global configuration
     */
    $.validator.config({
        //stopOnError: true,
        //focusCleanup: true,
        //theme: 'yellow_right',
        //timely: 2,
        
        // Custom rules
        rules: {
            digits: [/^\d+$/, datorDigitsWarn]
            ,letters: [/^[a-z]+$/i, datorLettersWarn]
            ,date: [/^\d{4}-\d{2}-\d{2}$/, datorDateWarn]
            ,time: [/^([01]\d|2[0-3])(:[0-5]\d){1,2}$/, datorTimeWarn]
            ,email: [/^[\w\+\-]+(\.[\w\+\-]+)*@[a-z\d\-]+(\.[a-z\d\-]+)*\.([a-z]{2,4})$/i, datorEmailWarn]
            ,url: [/^(https?|s?ftp):\/\/\S+$/i, datorUrlWarn]
            ,qq: [/^[1-9]\d{4,}$/, datorQqWarn]
            ,IDcard: [/^\d{6}(19|2\d)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)?$/, datorIdentityCardWarn]
            ,tel: [/^(?:(?:0\d{2,3}[\- ]?[1-9]\d{6,7})|(?:[48]00[\- ]?[1-9]\d{6}))$/, datorTelWarn]
            ,mobile: [/^1[3-9]\d{9}$/, datorMobileWarn]
            ,contact: [/^((?:(?:0\d{2,3}[\-]?[1-9]\d{6,7})|(?:[48]00[\-]?[1-9]\d{6}))|1[3-9]\d{9})$/, datorContactWarn]
            ,zipcode: [/^\d{6}$/, datorZipcodeWarn]
            ,chinese: [/^[\u0391-\uFFE5]+$/, datorChineseWarn]
            ,username: [/^\w{3,12}$/, datorUsernameWarn]
            ,password: [/^[\S]{6,16}$/, datorPasswordWarn]
            ,money: [/^[0-9]+(.[0-9]{1,2})?$/, datorMoneyWarn]
            ,moneyfour: [/^[0-9]+(.[0-9]{1,4})?$/, datorMoneyfourWarn]
            ,ip: [/^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\,?\s*)*$/, datorIpWarn]
    		,positiveNum:[/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/,positiveNumWarn]
            ,ennum: [/^[A-Za-z0-9]+$/, datorEnnumWarn]
            ,addcut: [/^(\+|\-)[1-9]{1}\d?$/, datorAddcutWarn]
            ,illegalChar: [/^[\u0391-\uFFE5_a-zA-Z0-9]+$/, datorIllegalCharWarn]
            ,gradeFormat: [/^\d{4}$/, datorGradeWarn] //--/^\d{4}-(([1-9]{1})|(0[1-9]{1})|(1[1-2]{1}))$/--
            ,stature: [/^[1-2]{1}\d{2}?$/,datorStaureWarn]
            ,weight: [/^([4-9]{1}\d{1}|[1-2]{1}\d{2})?$/, datorWeightWarn]
    		,avschoolCode: [/^[a-zA-Z]+$/,"只能为英文字母"]
            ,warningRuleDays:[/^[1-9]{1}\d{0,3}$/, datorWarningRuleLimitDays]
    		,results:[/^([0-9]{1}|[0-9]{1}\.\d{1,2}|[1-9]{1}[0-9]{1,2}|[1-9]{1}[0-9]{1,2}\.\d{1,2})$/,"请输入有效成绩，可保留两位小数"]
    		,accept: function (element, params){
                if (!params) return true;
                var ext = params[0],
                    value = $(element).val();
                return (ext === '*') ||
                       (new RegExp(".(?:" + ext + ")$", "i")).test(value) ||
                       this.renderMsg("只接受{1}后缀的文件", ext.replace(/\|/g, ','));
            }
            ,toselect: function (element, params){
                    value = $(element).val();
                    code_type=$(element).attr("code_type");
                   
                    if(value!=null && value!=''){
                    	//校验输入值是否存在数据字典，不存在提示错误
                    	//存在则修改隐藏的hidden值
                    	 $.ajax({
      						url: basePath+"/common/toSelect",
      						type: 'POST',
      						dataType: 'json',
 							data: {dictName:value,code_type:code_type}
      					})
     					.done(function(data) {
     						$(element).prev().val(data);
     					})
     					.fail(function(data) {
     						showError(data.responseText);
     						
     					});
                    	 newvalue=$(element).prev().val();
                         
                         if(newvalue=='error'){
                         	return this.renderMsg("您输入的值不合法,请重新输入或者点选输入!");
                         }
                    }
   
            }
            ,filterSpecialChar: function (element, params) {
                var pattern = new RegExp("[`~!@#$%^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}\\\\\\\\【】‘；：' '”“\"\'。，、？\\r\\n\]");
                return !pattern.test($(element).val()) || datorFilterSpecialCharWarn;
            }
            
        },

        // Default error messages
        messages: {
            fallback: "{0}格式不正确",
            loading: "正在验证...",
            error: "网络异常",
            timeout: "请求超时",
            required: "{0}必填",
            remote: "{0}已被使用",
            integer: {
                '*': "请填写整数",
                '+': "请填写正整数",
                '+0': "请填写正整数或0",
                '-': "请填写负整数",
                '-0': "请填写负整数或0"
            },
            match: {
                eq: "{0}与{1}不一致",
                neq: "{0}与{1}不能相同",
                lt: "{0}必须小于{1}",
                gt: "{0}必须大于{1}",
                lte: "{0}不能大于{1}",
                gte: "{0}不能小于{1}"
            },
            range: {
                rg: "请填写{1}到{2}的数",
                gte: "请填写不小于{1}的数",
                lte: "请填写最大{1}的数"
            },
            checked: {
                eq: "请选择{1}项",
                rg: "请选择{1}到{2}项",
                gte: "请至少选择{1}项",
                lte: "请最多选择{1}项"
            },
            length: {
                eq: "请填写{1}个字符",
                rg: "请填写{1}到{2}个字符",
                gte: "请至少填写{1}个字符",
                lte: "请最多填写{1}个字符",
                eq_2: "",
                rg_2: "",
                gte_2: "",
                lte_2: ""
            }
        }
    });

    /* Themes
     */
    var TPL_ARROW = '<span class="n-arrow"><b>◆</b><i>◆</i></span>';
    $.validator.setTheme({
        'simple_right': {
            formClass: 'n-simple',
            msgClass: 'n-right'
        },
        'simple_bottom': {
            formClass: 'n-simple',
            msgClass: 'n-bottom'
        },
        'yellow_top': {
            formClass: 'n-yellow',
            msgClass: 'n-top',
            msgArrow: TPL_ARROW
        },
        'yellow_right': {
            formClass: 'n-yellow',
            msgClass: 'n-right',
            msgArrow: TPL_ARROW
        },
        'yellow_right_effect': {
            formClass: 'n-yellow',
            msgClass: 'n-right',
            msgArrow: TPL_ARROW,
            msgShow: function($msgbox, type){
                var $el = $msgbox.children();
                if ($el.is(':animated')) return;
                if (type === 'error') {
                    $el.css({left: '20px', opacity: 0})
                        .delay(100).show().stop()
                        .animate({left: '-4px', opacity: 1}, 150)
                        .animate({left: '3px'}, 80)
                        .animate({left: 0}, 80);
                } else {
                    $el.css({left: 0, opacity: 1}).fadeIn(200);
                }
            },
            msgHide: function($msgbox, type){
                var $el = $msgbox.children();
                $el.stop().delay(100).show()
                    .animate({left: '20px', opacity: 0}, 300, function(){
                        $msgbox.hide();
                    });
            }
        }
    });
}));
