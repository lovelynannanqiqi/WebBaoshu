<%@ WebHandler Language="C#" Class="MainDatas" %>

using System;
using System.Web;
using System.Web.Script.Serialization;

public class MainDatas : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        
        string select_date=context.Request.QueryString["date"];
        if (select_date != null)
        {
            int stationID = Convert.ToInt32(context.Session["stationID"]);
            //保存当前报数日期
            context.Session["bs_date"] = select_date;
            //int kyzid = Convert.ToInt32(context.Session["kyzid"]);
            BSServiceReference.BaoShuFunctionsSoapClient bsws = new BSServiceReference.BaoShuFunctionsSoapClient();
            JavaScriptSerializer jss = new JavaScriptSerializer();


            //获取登录客运站指定日期的主数据项并填充其
            BSServiceReference.MainItems mis = bsws.GetMainItem(stationID, DateTime.Parse(select_date));
            MainData md = new MainData()
            {
                BC_BaseNumber = mis.MainBC.BaseNumber,
                BC_ReportNumber = mis.MainBC.ReportNumber,
                BC_AddorDecNumber = mis.MainBC.AddorDecNumber,
                BC_Persent = mis.MainBC.Persent,
                BC_SumMouth = mis.MainBC.SumMouth,

                RS_BaseNumber = mis.MainRS.BaseNumber,
                RS_ReportNumber = mis.MainRS.ReportNumber,
                RS_AddorDecNumber = mis.MainRS.AddorDecNumber,
                RS_Persent = mis.MainRS.Persent,
                RS_SumMouth = mis.MainRS.SumMouth,

                SR_BaseNumber = mis.MainSR.BaseNumber,
                SR_ReportNumber = mis.MainSR.ReportNumber,
                SR_AddorDecNumber = mis.MainSR.AddorDecNumber,
                SR_Persent = mis.MainSR.Persent,
                SR_SumMouth = mis.MainSR.SumMouth,
                
                WLSR_BaseNumber=mis.MainWLSR.BaseNumber,
                WLSR_ReportNumber=mis.MainWLSR.ReportNumber,
                WLSR_AddorDecNumber=mis.MainWLSR.AddorDecNumber,
                WLSR_Persent=mis.MainWLSR.Persent,
                WLSR_SumMouth=mis.MainWLSR.SumMouth,


                DSDSR_BaseNumber=mis.MainDSDSR.BaseNumber,
                DSDSR_ReportNumber=mis.MainDSDSR.ReportNumber,
                DSDSR_AddorDecNumber=mis.MainDSDSR.AddorDecNumber,
                DSDSR_Persent=mis.MainDSDSR.Persent,
                DSDSR_SumMouth=mis.MainDSDSR.SumMouth,


                JCS_BaseNumber=mis.MainJCS.BaseNumber,
                JCS_ReportNumber=mis.MainJCS.ReportNumber,
                JCS_AddorDecNumber=mis.MainJCS.AddorDecNumber,
                JCS_Persent=mis.MainJCS.Persent,
                JCS_SumMouth=mis.MainJCS.SumMouth
            };


            //单独类json序列化string json = jss.Serialize(SMS_Submit("cf_lovely","197548",mobile,smscode));
            string json = jss.Serialize(md);
            context.Response.ContentType = "text/plain";
            context.Response.Write(json);
        }
       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}