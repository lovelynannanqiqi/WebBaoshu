<%@ WebHandler Language="C#" Class="SubData" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
public class SubData : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        string select_date=context.Request.QueryString["date"];
        if (select_date != null)
        {
            BSServiceReference.BaoShuFunctionsSoapClient bsws = new BSServiceReference.BaoShuFunctionsSoapClient();
            JavaScriptSerializer jss = new JavaScriptSerializer();
            List<SubDatas> subDataList = new List<SubDatas>();
            int stationID = Convert.ToInt32(context.Session["stationID"]);
            //获得登录客运站指定日期的外环数据项
            BSServiceReference.SubItems[] list = bsws.GetSubItems(stationID, DateTime.Parse(select_date));

            //如果登录客运站外环数据项有数据就显示否则仅初始化其
            if (list.Length == 0)
            {
                //获得登录客运站的相应外环站列表
                string[] newlist = bsws.GetSubStations(stationID);

                for (int x = 0; x < newlist.Length; x++)
                {
                    //初始化登录客运站个外环站数据项
                    subDataList.Add(new SubDatas()
                    {
                        subStationName = newlist[x],
                        BC_baseNumber = 0,
                        BC_reportNumber = 0,
                        BC_addordecNumber = 0,
                        BC_sumMouth = 0,

                        BPRS_baseNumber = 0,
                        BPRS_reportNumber = 0,
                        BPRS_addordecNumber = 0,
                        BPRS_sumMouth = 0,

                        XZRS_baseNumber = 0,
                        XZRS_reportNumber = 0,
                        XZRS_addordecNumber = 0,
                        XZRS_sumMouth = 0,

                        TKSR_baseNumber = 0,
                        TKSR_reportNumber = 0,
                        TKSR_addordecNumber = 0,
                        TKSR_sumMouth = 0,

                    });
                }
            }
            else
            {
                foreach (BSServiceReference.SubItems si in list)
                {
                    //填充登录客运站所属各外环数据项

                    subDataList.Add(new SubDatas()
                    {
                        subStationName = si.SubStationName,
                        BC_baseNumber = si.SubItemBC.baseNumber,
                        BC_reportNumber = si.SubItemBC.reportNumber,
                        BC_addordecNumber = si.SubItemBC.addordecNumber,
                        BC_sumMouth = si.SubItemBC.sumMouth,

                        BPRS_baseNumber = si.SubItemBP.baseNumber,
                        BPRS_reportNumber = si.SubItemBP.reportNumber,
                        BPRS_addordecNumber = si.SubItemBP.addordecNumber,
                        BPRS_sumMouth = si.SubItemBP.sumMouth,

                        XZRS_baseNumber = si.SubItemXZ.baseNumber,
                        XZRS_reportNumber = si.SubItemXZ.reportNumber,
                        XZRS_addordecNumber = si.SubItemXZ.addordecNumber,
                        XZRS_sumMouth = si.SubItemXZ.sumMouth,

                        TKSR_baseNumber = si.SubItemTK.baseNumber,
                        TKSR_reportNumber = si.SubItemTK.reportNumber,
                        TKSR_addordecNumber = si.SubItemTK.addordecNumber,
                        TKSR_sumMouth = si.SubItemTK.sumMouth
                    });


                }
            }



            //数组类序列化
            string json = jss.Serialize(subDataList);
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