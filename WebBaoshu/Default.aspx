<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>长春公路客运总站分布式报数系统</title>

    
    <script src="jquery-1.11.1.min.js"></script>
    <script src="jquery-migrate-1.2.1.min.js"></script>    
    <script src="jquery-ui.min.js"></script>
    <link href="jquery-ui.css" rel="stylesheet" type="text/css"/> 
    
    <link rel="shortcut icon" href="Resources.ico" />
    <style type="text/css">
        table{
            margin:10px 10px 10px 10px;
             box-shadow: 1px 1px 4px #000000;
            border-radius: 5px;
        }
     .input_number{
         width:70px;
         font-size:12px;
     }
     .headerDiv{
         height:100px;
         background:#196cc6;
         color:#ffffff;
         padding-top:25px;
     }
     .commandDiv{
         
         height:30px;
         background:#1461b4;
         color:#ffffff;
         padding-top:5px;
         padding-left:25px;
     }
     .commandButton{
         width:100px;

     }
     .td_TK
     {
         width:74px;
     }
     .baseNumberTDBackgroud{
         background:#1461b4;
         color:#ffffff;
     }
     .subStationTDBackgroud
     {
         background:#a5270a;
         color:#ffffff;
     }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        
    <div>
    
        <header>
            <div class="headerDiv"><h1>长春公路客运总站分布式报数系统 （网络版 2.0）</h1></div>
            <div class="commandDiv"><input type="text" id="datepicker" placeholder="报数日期选择" readonly="true" /> <input type="button" value="创建" class="commandButton" id="btn_create" /> <input type="button" value="保存" class="commandButton" id="btn_save"/></div>
            
            
        </header>
    
        <table>
            <tr>
                <td>
                   
                    <table id="msBC"  border="1">  
                        <tr><td colspan="2" class="baseNumberTDBackgroud">始发下行班次</td><td colspan="3">对比情况</td></tr>           
                        <tr><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">百分比%</th><th scope="col">本月累计</th></tr>
                        <tr><td><input class='input_number' type='text' id="msBC_JQS" value="0"/></td><td><input class='input_number' type='text' id="msBC_BGQS" value="0"/></td><td><div class="td_TK" id="msBC_ZJS">0</div></td><td><div class="td_TK" id="msBC_BFB">0</div></td><td><input class='input_number' type='text' id="msBC_BYLJ" value="0"/></td></tr>
                    </table> 
                </td>
                <td>
                    
                    <table id="msRS"  border="1"> 
                        <tr><td colspan="2" class="baseNumberTDBackgroud">始发下行人数</td><td colspan="3">对比情况</td></tr>
                        <tr><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">百分比%</th><th scope="col">本月累计</th></tr>
                        <tr><td><input class='input_number' type='text' id="msRS_JQS" value="0" /></td><td><input class='input_number' type='text' id="msRS_BGQS" value="0"/></td><td><div class="td_TK" id="msRS_ZJS">0</div></td><td><div class="td_TK" id="msRS_BFB">0</div></td><td><input class='input_number' type='text' id="msRS_BYLJ" value="0"/></td></tr>
                    </table> 
                </td>

                <td>
               
                    <table id="msSR"  border="1"> 
                        <tr><td colspan="2" class="baseNumberTDBackgroud">收入</td><td colspan="3">对比情况</td></tr>
                        <tr><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">百分比%</th><th scope="col">本月累计</th></tr>
                        <tr><td><input class='input_number' type='text' id="msSR_JQS" value="0"/></td><td><input class='input_number' type='text' id="msSR_BGQS" value="0"/></td><td><div class="td_TK" id="msSR_ZJS">0</div></td><td><div class="td_TK" id="msSR_BFB">0</div></td><td><input class='input_number' type='text' id="msSR_BYLJ" value="0"/></td></tr>
                    </table> 
                </td>
            </tr>

            <tr>
                <td>
               
                    <table id="msWLSR"  border="1"> 
                        <tr><td colspan="2" class="baseNumberTDBackgroud">网络售票收入</td><td colspan="3">对比情况</td></tr>
                        <tr><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">百分比%</th><th scope="col">本月累计</th></tr>
                        <tr><td><input class='input_number' type='text' id="msWLSR_JQS" value="0"/></td><td><input class='input_number' type='text' id="msWLSR_BGQS" value="0"/></td><td><div class="td_TK" id="msWLSR_ZJS">0</div></td><td><div class="td_TK" id="msWLSR_BFB">0</div></td><td><input class='input_number' type='text' id="msWLSR_BYLJ" value="0"/></td></tr>
                    </table> 
                </td>

                <td>
               
                    <table id="msDSDSR"  border="1"> 
                        <tr><td colspan="2" class="baseNumberTDBackgroud">邮政及其它代售收入</td><td colspan="3">对比情况</td></tr>
                        <tr><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">百分比%</th><th scope="col">本月累计</th></tr>
                        <tr><td><input class='input_number' type='text' id="msDSDSR_JQS" value="0"/></td><td><input class='input_number' type='text' id="msDSDSR_BGQS" value="0"/></td><td><div class="td_TK" id="msDSDSR_ZJS">0</div></td><td><div class="td_TK" id="msDSDSR_BFB">0</div></td><td><input class='input_number' type='text' id="msDSDSR_BYLJ" value="0"/></td></tr>
                    </table> 
                </td>

                <td>
               
                    <table id="msJCS"  border="1"> 
                        <tr><td colspan="2" class="baseNumberTDBackgroud">加车数</td><td colspan="3">对比情况</td></tr>
                        <tr><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">百分比%</th><th scope="col">本月累计</th></tr>
                        <tr><td><input class='input_number' type='text' id="msJCS_JQS" value="0"/></td><td><input class='input_number' type='text' id="msJCS_BGQS" value="0"/></td><td><div class="td_TK" id="msJCS_ZJS">0</div></td><td><div class="td_TK" id="msJCS_BFB">0</div></td><td><input class='input_number' type='text' id="msJCS_BYLJ" value="0"/></td></tr>
                    </table> 
                </td>
            </tr>
           
        </table>
        

        
        <table>
            <tr>
                <td>
                    <table id="subStationBC"  border="1">             
                        <tbody> 
                            <tr><td colspan="5" class="subStationTDBackgroud">班次</td></tr>
                            <tr><th scope="col">停靠站</th><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">本月累计</th></tr>
                        </tbody> 
                    </table> 
                </td> 
                <td>
                    <table id="subStationBPRS"  border="1"> 
                        <tbody> 
                            <tr><td colspan="5" class="subStationTDBackgroud">补票人数</td></tr>
                            <tr><th scope="col">停靠站</th><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">本月累计</th></tr>
                        </tbody> 
                    </table> 
                </td>

                <td>
                    <table id="subStationXZRS"  border="1"> 
                        <tbody> 
                            <tr><td colspan="5" class="subStationTDBackgroud">卸载人数</td></tr>
                            <tr><th scope="col">停靠站</th><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">本月累计</th></tr>
                        </tbody> 
                    </table> 
                </td> 
            </tr>

            <tr>
                
                <td>
                    <table id="subStationTKSR"  border="1"> 
                        <tbody> 
                            <tr><td colspan="5" class="subStationTDBackgroud">停靠收入</td></tr>
                            <tr><th scope="col">停靠站</th><th scope="col">基期数</th><th scope="col">报告期数</th><th scope="col">增减数</th><th scope="col">本月累计</th></tr>
                        </tbody> 
                    </table> 
                </td>
            </tr>
        </table>


        


    </div>
    </form>
 
    &nbsp;&nbsp;
    <script>
        $('document').ready(function () {
            
            var isCreate = false;

            $.datepicker.regional['zh-CN'] = {   
                clearText: '清除',   
                clearStatus: '清除已选日期',   
                closeText: '关闭',   
                closeStatus: '不改变当前选择',   
                prevText: '<上月',   
                prevStatus: '显示上月',   
                prevBigText: '<<',   
                prevBigStatus: '显示上一年',   
                nextText: '下月>',   
                nextStatus: '显示下月',   
                nextBigText: '>>',   
                nextBigStatus: '显示下一年',   
                currentText: '今天',   
                currentStatus: '显示本月',   
                monthNames: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'],   
                monthNamesShort: ['一','二','三','四','五','六', '七','八','九','十','十一','十二'],   
                monthStatus: '选择月份',   
                yearStatus: '选择年份',   
                weekHeader: '周',   
                weekStatus: '年内周次',   
                dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],   
                dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],   
                dayNamesMin: ['日','一','二','三','四','五','六'],   
                dayStatus: '设置 DD 为一周起始',   
                dateStatus: '选择 m月 d日, DD',   
                dateFormat: 'yy-mm-dd',   
                firstDay: 1,   
                initStatus: '请选择日期',   
                isRTL: false};   
            $.datepicker.setDefaults($.datepicker.regional['zh-CN']);   



            $("#datepicker").datepicker();

           
            //浮点数字输入验证
            function numberformat(domInput) {

                $(domInput).css("ime-mode", "disabled");
                $(domInput).bind("keypress", function (e) {
                    var code = (e.keyCode ? e.keyCode : e.which);  //兼容火狐 IE   
                    if (!$.browser.msie && (e.keyCode == 0x8))  //火狐下 不能使用退格键  
                    {
                        return;
                    }
                    return code >= 48 && code <= 57 || code == 46 || code==45
                });
                
                $(domInput).bind("blur", function () {

                    if (this.value.lastIndexOf(".") == (this.value.length - 1)) {
                        this.value = this.value.substr(0, this.value.length - 1);
                    } else if (isNaN(this.value)) {
                        this.value = "0";
                    }
                    if(this.value=="")
                    {
                        this.value = "0";
                    }
                });
                $(domInput).bind("paste", function () {
                    var s = clipboardData.getData('text');
                    if (!/\D/.test(s));
                    value = s.replace(/^0*/, '');
                    return false;
                });
                $(domInput).bind("dragenter", function () {
                    return false;
                });
                $(domInput).bind("keyup", function () {
                    this.value = this.value.replace(/[^\-\d.]/g, "");
                    //必须保证第一个为数字而不是.
                    this.value = this.value.replace(/^\./g, "");
                    //保证只有出现一个.而没有多个.
                    this.value = this.value.replace(/\.{2,}/g, ".");
                    //保证.只出现一次，而不能出现两次以上
                    this.value = this.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
                    //保证-减号只出现一次
                    this.value = this.value.replace("-", "$#$").replace(/\-/g, "").replace("$#$", "-");
                });
                
            }

          
            //初始化日报数据
            function clearAllInfo()
            {
                //班次基础数据
                $('#msBC_JQS').val(0);
                $('#msBC_BGQS').val(0);
                $('#msBC_ZJS').text(0);
                $('#msBC_BFB').text(0);
                $('#msBC_BYLJ').val(0);
                //收入基础数据
                $('#msSR_JQS').val(0);
                $('#msSR_BGQS').val(0);
                $('#msSR_ZJS').text(0);
                $('#msSR_BFB').text(0);
                $('#msSR_BYLJ').val(0);
                //人数基础数据
                $('#msRS_JQS').val(0);
                $('#msRS_BGQS').val(0);
                $('#msRS_ZJS').text(0);
                $('#msRS_BFB').text(0);
                $('#msRS_BYLJ').val(0);


                //网络收入
                $('#msWLRS_JQS').val(0);
                $('#msWLRS_BGQS').val(0);
                $('#msWLRS_ZJS').text(0);
                $('#msWLRS_BFB').text(0);
                $('#msWLRS_BYLJ').val(0);

                //代售点收入
                $('#msDSDRS_JQS').val(0);
                $('#msDSDRS_BGQS').val(0);
                $('#msDSDRS_ZJS').text(0);
                $('#msDSDRS_BFB').text(0);
                $('#msDSDRS_BYLJ').val(0);

                //加车数
                $('#msJCS_JQS').val(0);
                $('#msJCS_BGQS').val(0);
                $('#msJCS_ZJS').text(0);
                $('#msJCS_BFB').text(0);
                $('#msJCS_BYLJ').val(0);

                clearSubInfo("subStationBC");
                clearSubInfo("subStationBPRS");
                clearSubInfo("subStationXZRS");
                clearSubInfo("subStationTKSR");
            }
            //初始化外环站数据
            function clearSubInfo(subTitle) {
                $("#" + subTitle + " tr:eq(1)").nextAll().remove();
            }




            //创建日报////////////////////////////////////////////////////////////////////
            $('#btn_create').click(function () {

                var select_date = $('#datepicker').val();
                if (select_date != "") {
                    if (confirm('您确认要创建'+select_date+'日的报数吗?')) {
                        //首先初始化所有报数输入数据
                        clearAllInfo();
                        isCreate = true;
                        //初始化各项主要数据显示
                        $.ajax({
                            type: "get",
                            cache: false,
                            async: false,
                            url: "MainDatas.ashx?date=" + select_date,
                            success: function (res) {
                                var strJSON = res;
                                var obj = eval("(" + strJSON + ")");//转换后的JSON对象

                                //班次基础数据
                                $('#msBC_JQS').val(obj.BC_BaseNumber);
                                $('#msBC_BGQS').val(obj.BC_ReportNumber);
                                $('#msBC_ZJS').text(obj.BC_AddorDecNumber);
                                $('#msBC_BFB').text(obj.BC_Persent);
                                $('#msBC_BYLJ').val(obj.BC_SumMouth);

                                ////人数基础数据
                                $('#msRS_JQS').val(obj.RS_BaseNumber);
                                $('#msRS_BGQS').val(obj.RS_ReportNumber);
                                $('#msRS_ZJS').text(obj.RS_AddorDecNumber);
                                $('#msRS_BFB').text(obj.RS_Persent);
                                $('#msRS_BYLJ').val(obj.RS_SumMouth);

                                ////收入基础数据
                                $('#msSR_JQS').val(obj.SR_BaseNumber);
                                $('#msSR_BGQS').val(obj.SR_ReportNumber);
                                $('#msSR_ZJS').text(obj.SR_AddorDecNumber);
                                $('#msSR_BFB').text(obj.SR_Persent);
                                $('#msSR_BYLJ').val(obj.SR_SumMouth);


                                //网络收入
                                $('#msWLSR_JQS').val(obj.WLSR_BaseNumber);
                                $('#msWLSR_BGQS').val(obj.WLSR_ReportNumber);
                                $('#msWLSR_ZJS').text(obj.WLSR_AddorDecNumber);
                                $('#msWLSR_BFB').text(obj.WLSR_Persent);
                                $('#msWLSR_BYLJ').val(obj.WLSR_SumMouth);

                                //代售点收入
                                $('#msDSDSR_JQS').val(obj.DSDSR_BaseNumber);
                                $('#msDSDSR_BGQS').val(obj.DSDSR_ReportNumber);
                                $('#msDSDSR_ZJS').text(obj.DSDSR_AddorDecNumber);
                                $('#msDSDSR_BFB').text(obj.DSDSR_Persent);
                                $('#msDSDSR_BYLJ').val(obj.DSDSR_SumMouth);

                                //加车数
                                $('#msJCS_JQS').val(obj.JCS_BaseNumber);
                                $('#msJCS_BGQS').val(obj.JCS_ReportNumber);
                                $('#msJCS_ZJS').text(obj.JCS_AddorDecNumber);
                                $('#msJCS_BFB').text(obj.JCS_Persent);
                                $('#msJCS_BYLJ').val(obj.JCS_SumMouth);

                            },
                            error: function () {
                                alert("参数出错，请与管理员联系!");
                            }
                        });



                        //初始化外环站各项数据显示
                        $.ajax({
                            type: "get",
                            cache: false,
                            async: false,
                            url: "SubData.ashx?date=" + select_date,
                            success: function (res) {

                                var strJSON = res;
                                var obj = eval("(" + strJSON + ")");//转换后的JSON对象
                                for (var i = 0; i < obj.length; i++) {
                                    $('#subStationBC tr:last').after("<tr><td class='td_TK'>" + obj[i].subStationName + "</td><td><input name='sub_jqs' class='input_number' type='text' value='" + obj[i].BC_baseNumber + "' /></td><td><input name='sub_bgqs' class='input_number' type='text' value='" + obj[i].BC_reportNumber + "' /></td><td><input name='sub_zjs' class='input_number' type='text' value='" + obj[i].BC_addordecNumber + "'/></td><td><input name='sub_sum' class='input_number' type='text' value='" + obj[i].BC_sumMouth + "' /></td></tr>");
                                    $('#subStationBPRS tr:last').after("<tr><td class='td_TK'>" + obj[i].subStationName + "</td><td><input name='sub_jqs' class='input_number' type='text' value='" + obj[i].BPRS_baseNumber + "' /></td><td><input name='sub_bgqs' class='input_number' type='text' value='" + obj[i].BPRS_reportNumber + "' /></td><td><input name='sub_zjs' class='input_number' type='text' value='" + obj[i].BPRS_addordecNumber + "'/></td><td><input name='sub_sum' class='input_number' type='text' value='" + obj[i].BPRS_sumMouth + "' /></td></tr>");
                                    $('#subStationXZRS tr:last').after("<tr><td class='td_TK'>" + obj[i].subStationName + "</td><td><input name='sub_jqs' class='input_number' type='text' value='" + obj[i].XZRS_baseNumber + "' /></td><td><input name='sub_bgqs' class='input_number' type='text' value='" + obj[i].XZRS_reportNumber + "' /></td><td><input name='sub_zjs' class='input_number' type='text' value='" + obj[i].XZRS_addordecNumber + "'/></td><td><input  name='sub_sum' class='input_number' type='text' value='" + obj[i].XZRS_sumMouth + "' /></td></tr>");
                                    $('#subStationTKSR tr:last').after("<tr><td class='td_TK'>" + obj[i].subStationName + "</td><td><input name='sub_jqs' class='input_number' type='text' value='" + obj[i].TKSR_baseNumber + "' /></td><td><input name='sub_bgqs' class='input_number' type='text' value='" + obj[i].TKSR_reportNumber + "' /></td><td><input name='sub_zjs' class='input_number' type='text' value='" + obj[i].TKSR_addordecNumber + "'/></td><td><input  name='sub_sum' class='input_number' type='text' value='" + obj[i].TKSR_sumMouth + "' /></td></tr>");

                                    
                                }
                            },
                            error: function () {
                                alert("参数出错，请与管理员联系!");
                            }
                        });
                    } else {
                        //放弃创建当日报数
                    }
                }
                else
                {
                    alert("创建报数前请先选择报数日期。");
                }

                //所有textbox只能输入浮点或数字
                $(".input_number").keydown(function (e) {
                    numberformat(this);
                });
            });

            //所有textbox只能输入浮点或数字
            $(".input_number").keydown(function (e) {
                numberformat(this);
            });




            

            //删除字符串最后一个字符
            function deleteLastChar(str, c) {
                var reg = new RegExp(c + "([^" + c + "]*?)$");
                return str.replace(reg, function (w) { if (w.length > 1) { return w.substring(1); } else { return ""; } });
            }

            function subStationSubItems() {
                var subItem = "";
                var subItems = "";

                var subStationTitle = "subStationBC";

                for (var n = 2; n < $("#" + subStationTitle + " tr").length; n++) {
                    var subJQS = 0;
                    var subBGQS = 0;
                    
                    subItem = $("#" + subStationTitle + " tr:eq(" + n + ") td:nth-child(1)").html() + ",";
                    $("#subStationBC tr:eq(" + n + ")").each(function (tdindex, tditem) {
                        $(this).find("input[type='text']").each(function () {
                            if (this.name == "sub_jqs") {
                                subJQS = parseInt($(this).val());
                            }
                            if (this.name == "sub_bgqs") {
                                subBGQS = parseInt($(this).val());
                            }
                            if (this.name == "sub_zjs") {
                                $(this).val(subBGQS-subJQS);
                            }
                            subItem += $(this).val() + ",";
                        });
                    });

                    $("#subStationBPRS tr:eq(" + n + ")").each(function (tdindex, tditem) {
                        $(this).find("input[type='text']").each(function () {
                            if (this.name == "sub_jqs") {
                                subJQS = parseInt($(this).val());
                            }
                            if (this.name == "sub_bgqs") {
                                subBGQS = parseInt($(this).val());
                            }
                            if (this.name == "sub_zjs") {
                                $(this).val(subBGQS - subJQS);
                            }
                            subItem += $(this).val() + ",";
                        });
                    });

                    $("#subStationXZRS tr:eq(" + n + ")").each(function (tdindex, tditem) {
                        $(this).find("input[type='text']").each(function () {
                            if (this.name == "sub_jqs") {
                                subJQS = parseInt($(this).val());
                            }
                            if (this.name == "sub_bgqs") {
                                subBGQS = parseInt($(this).val());
                            }
                            if (this.name == "sub_zjs") {
                                $(this).val(subBGQS - subJQS);
                            }
                            subItem += $(this).val() + ",";
                        });
                    });

                    $("#subStationTKSR tr:eq(" + n + ")").each(function (tdindex, tditem) {
                        $(this).find("input[type='text']").each(function () {
                            if (this.name == "sub_jqs") {
                                subJQS = parseFloat($(this).val());
                            }
                            if (this.name == "sub_bgqs") {
                                subBGQS = parseFloat($(this).val());
                            }
                            if (this.name == "sub_zjs") {
                                $(this).val((subBGQS - subJQS).toFixed(1));
                            }
                            subItem += $(this).val() + ",";
                        });
                    });

                    subItems += deleteLastChar(subItem, ",") + ";";
                    
                }
                return subItems;

            }

            

            //保存报数
            $('#btn_save').click(function () {
         
                if (isCreate) {
                    //主数据容器
                    var mainData;

                    //班次基础数据
                    var bc_jqs = parseFloat($('#msBC_JQS').val());
                    var bc_bgqs = parseFloat($('#msBC_BGQS').val());
                    var bc_zjs = 0;
                    var bc_bfb = 0;
                    var bc_bylj = parseFloat($('#msBC_BYLJ').val());
                    //收入基础数据
                    var sr_jqs = parseFloat($('#msSR_JQS').val());
                    var sr_bgqs = parseFloat($('#msSR_BGQS').val());
                    var sr_zjs = 0;
                    var sr_bfb = 0;
                    var sr_bylj = parseFloat($('#msSR_BYLJ').val());
                    //人数基础数据
                    var rs_jqs = parseFloat($('#msRS_JQS').val());
                    var rs_bgqs = parseFloat($('#msRS_BGQS').val());
                    var rs_zjs = 0;
                    var rs_bfb = 0;
                    var rs_bylj = parseFloat($('#msRS_BYLJ').val());


                    //网络收入基础数据
                    var wlsr_jqs = parseFloat($('#msWLSR_JQS').val());
                    var wlsr_bgqs = parseFloat($('#msWLSR_BGQS').val());
                    var wlsr_zjs = 0;
                    var wlsr_bfb = 0;
                    var wlsr_bylj = parseFloat($('#msWLSR_BYLJ').val());


                    //代售点收入基础数据
                    var dsdsr_jqs = parseFloat($('#msDSDSR_JQS').val());
                    var dsdsr_bgqs = parseFloat($('#msDSDSR_BGQS').val());
                    var dsdsr_zjs = 0;
                    var dsdsr_bfb = 0;
                    var dsdsr_bylj = parseFloat($('#msDSDSR_BYLJ').val());


                    //加车数基础数据
                    var jcs_jqs = parseFloat($('#msJCS_JQS').val());
                    var jcs_bgqs = parseFloat($('#msJCS_BGQS').val());
                    var jcs_zjs = 0;
                    var jcs_bfb = 0;
                    var jcs_bylj = parseFloat($('#msJCS_BYLJ').val());

                    //----------------------------------------------------------------------------------------------------///
                    //2015年3月更改
                    //以下计算式把IF bc_jqs>=0 && bc_bgqs>=0处注解掉，是因为2015-3-13日站里要求jqs与bgqs处可以输入负数。
                    //----------------------------------------------------------------------------------------------------///
                    //班次
                    //if (bc_jqs >= 0 && bc_bgqs >= 0) {
                        bc_zjs = (bc_bgqs - bc_jqs).toFixed(0);
                        $('#msBC_ZJS').text(bc_zjs);
                        bc_bfb = (bc_zjs / bc_jqs * 100).toFixed(1);
                        
                        if(bc_bfb=="NaN" || bc_bfb=="Infinity")
                        {
                            $('#msBC_BFB').text(0);
                            bc_bfb = 0;
                        }
                        else
                        {
                            $('#msBC_BFB').text(bc_bfb);
                        }

                    //}
                    //else { $('#msBC_JQS').val(0); $('#msBC_BGQS').val(0); }

                    //人数
                    //if (rs_jqs >= 0 && rs_bgqs >= 0) {
                        rs_zjs = (rs_bgqs - rs_jqs).toFixed(0)
                        $('#msRS_ZJS').text(rs_zjs);
                        rs_bfb = (rs_zjs / rs_jqs * 100).toFixed(1);
                        if (rs_bfb == "NaN" || rs_bfb == "Infinity") {
                            $('#msRS_BFB').text(0);
                            rs_bfb = 0;
                        }
                        else {
                            $('#msRS_BFB').text(rs_bfb);
                        }
                        
                    //}
                    //else { $('#msSR_JQS').val(0); $('#msSR_BGQS').val(0); }

                    //收入
                    //if (sr_jqs >= 0 && sr_bgqs >= 0) {
                        sr_zjs = (sr_bgqs - sr_jqs).toFixed(1)
                        $('#msSR_ZJS').text(sr_zjs);
                        sr_bfb = (sr_zjs / sr_jqs * 100).toFixed(1);
                        if (sr_bfb == "NaN" || sr_bfb == "Infinity") {
                            $('#msSR_BFB').text(0);
                            sr_bfb = 0;
                        }
                        else {
                            $('#msSR_BFB').text(sr_bfb);
                        }
                    //}
                    //else { $('#msRS_JQS').val(0); $('#msRS_BGQS').val(0); }





                    //网络收入
                    //if (wlsr_jqs >= 0 && wlsr_bgqs >= 0) {
                        wlsr_zjs = (wlsr_bgqs - wlsr_jqs).toFixed(1)
                        $('#msWLSR_ZJS').text(wlsr_zjs);
                        wlsr_bfb = (wlsr_zjs / wlsr_jqs * 100).toFixed(1);
                        if (wlsr_bfb == "NaN" || wlsr_bfb == "Infinity") {
                            $('#msWLSR_BFB').text(0);
                            wlsr_bfb = 0;
                        }
                        else {
                            $('#msWLSR_BFB').text(wlsr_bfb);
                        }
                    //}
                    //else { $('#msWLRS_JQS').val(0); $('#msWLRS_BGQS').val(0); }


                    //代售点收入
                    //if (dsdsr_jqs >= 0 && dsdsr_bgqs >= 0) {
                        dsdsr_zjs = (dsdsr_bgqs - dsdsr_jqs).toFixed(1)
                        $('#msDSDSR_ZJS').text(dsdsr_zjs);
                        dsdsr_bfb = (dsdsr_zjs / dsdsr_jqs * 100).toFixed(1);
                        if (dsdsr_bfb == "NaN" || dsdsr_bfb == "Infinity") {
                            $('#msDSDSR_BFB').text(0);
                            dsdsr_bfb = 0;
                        }
                        else {
                            $('#msDSDSR_BFB').text(dsdsr_bfb);
                        }
                    //}
                    //else { $('#msDSDRS_JQS').val(0); $('#msDSDRS_BGQS').val(0); }





                    //加车数
                    //if (jcs_jqs >= 0 && jcs_bgqs >= 0) {
                        jcs_zjs = (jcs_bgqs - jcs_jqs).toFixed(0)
                        $('#msJCS_ZJS').text(jcs_zjs);
                        jcs_bfb = (jcs_zjs / jcs_jqs * 100).toFixed(1);
                        if (jcs_bfb == "NaN" || jcs_bfb == "Infinity") {
                            $('#msJCS_BFB').text(0);
                            jcs_bfb = 0;
                        }
                        else {
                            $('#msJCS_BFB').text(jcs_bfb);
                        }
                    //}
                    //else { $('#msJCS_JQS').val(0); $('#msJCS_BGQS').val(0); }








                    //主数据写入
                    mainData = bc_jqs + ","
                        + bc_bgqs + ","
                        + bc_zjs + ","
                        + bc_bfb + ","
                        + bc_bylj + ","

                        + rs_jqs + ","
                        + rs_bgqs + ","
                        + rs_zjs + ","
                        + rs_bfb + ","
                        + rs_bylj + ","

                        + sr_jqs + ","
                        + sr_bgqs + ","
                        + sr_zjs + ","
                        + sr_bfb + ","
                        + sr_bylj + ","

                        + wlsr_jqs + ","
                        + wlsr_bgqs + ","
                        + wlsr_zjs + ","
                        + wlsr_bfb + ","
                        + wlsr_bylj + ","

                        + dsdsr_jqs + ","
                        + dsdsr_bgqs + ","
                        + dsdsr_zjs + ","
                        + dsdsr_bfb + ","
                        + dsdsr_bylj + ","

                        + jcs_jqs + ","
                        + jcs_bgqs + ","
                        + jcs_zjs + ","
                        + jcs_bfb + ","
                        + jcs_bylj;


                    
                    //初始化外环站各项数据显示
                    $.ajax({
                        type: "get",
                        cache: false,
                        async: false,
                        url: "CreateBS.ashx?ssdata=" + escape(mainData + "#" + subStationSubItems()),
                        success: function (res) {
                            alert("报数成功！");
                        },
                        error: function () {
                            alert("报数失败！请检查网络连接是否有问题或联系管理员。");
                        }
                    });

                }
                else
                {
                    alert("保存之前请先创建报数。");
                }

            });


            //////////////////////////////////////////////////////////////////////////////





        });


        

        

        

    </script>
</body>
</html>
