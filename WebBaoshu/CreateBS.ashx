<%@ WebHandler Language="C#" Class="CreateBS" %>

using System;
using System.Web;

public class CreateBS : IHttpHandler,System.Web.SessionState.IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        if (context.Session["bs_date"] != null)
        {
            int stationID = Convert.ToInt32(context.Session["stationID"]);
            DateTime bs_date = DateTime.Parse(context.Session["bs_date"].ToString());
            BSServiceReference.BaoShuFunctionsSoapClient bsws = new BSServiceReference.BaoShuFunctionsSoapClient();

            if (context.Request["ssdata"] != null)
            {
                //获取主数据与外环站数据并拆解
                string[] mainAndSub = context.Server.UrlDecode(context.Request["ssdata"].ToString()).Split(new char[] { '#' });

                //保存之前先删除已有的外环站数据
                bsws.DeleteSameSubData(stationID, bs_date);

                BSServiceReference.SubItems subData = new BSServiceReference.SubItems();
                subData.SubItemBC = new BSServiceReference.SubItemBase();
                subData.SubItemBP = new BSServiceReference.SubItemBase();
                subData.SubItemXZ = new BSServiceReference.SubItemBase();
                subData.SubItemTK = new BSServiceReference.SubItemBase();

                string[] ssdataList = mainAndSub[1].Split(new char[] { ';' });
                for (int n = 0; n < ssdataList.Length - 1; n++)
                {
                    string[] ssdataCellList = ssdataList[n].Split(new char[] { ',' });


                    subData.SubStationName = ssdataCellList[0];

                    subData.SubItemBC.baseNumber = Convert.ToDouble(ssdataCellList[1]);
                    subData.SubItemBC.reportNumber = Convert.ToDouble(ssdataCellList[2]);
                    subData.SubItemBC.addordecNumber = Convert.ToDouble(ssdataCellList[3]);
                    subData.SubItemBC.sumMouth = Convert.ToDouble(ssdataCellList[4]);

                    subData.SubItemBP.baseNumber = Convert.ToDouble(ssdataCellList[5]);
                    subData.SubItemBP.reportNumber = Convert.ToDouble(ssdataCellList[6]);
                    subData.SubItemBP.addordecNumber = Convert.ToDouble(ssdataCellList[7]);
                    subData.SubItemBP.sumMouth = Convert.ToDouble(ssdataCellList[8]);

                    subData.SubItemXZ.baseNumber = Convert.ToDouble(ssdataCellList[9]);
                    subData.SubItemXZ.reportNumber = Convert.ToDouble(ssdataCellList[10]);
                    subData.SubItemXZ.addordecNumber = Convert.ToDouble(ssdataCellList[11]);
                    subData.SubItemXZ.sumMouth = Convert.ToDouble(ssdataCellList[12]);

                    subData.SubItemTK.baseNumber = Convert.ToDouble(ssdataCellList[13]);
                    subData.SubItemTK.reportNumber = Convert.ToDouble(ssdataCellList[14]);
                    subData.SubItemTK.addordecNumber = Convert.ToDouble(ssdataCellList[15]);
                    subData.SubItemTK.sumMouth = Convert.ToDouble(ssdataCellList[16]);

                    //插入外环站数据
                    bsws.InsertSubItem(stationID, bs_date, subData);
                }







                ////插入或更新报数主要数据
                string[] mainDataCells = mainAndSub[0].Split(new char[] { ',' });
                BSServiceReference.MainItems mis = new BSServiceReference.MainItems();
                mis.MainBC = new BSServiceReference.MainItem();
                mis.MainRS = new BSServiceReference.MainItem();
                mis.MainSR = new BSServiceReference.MainItem();
                mis.MainWLSR = new BSServiceReference.MainItem();
                mis.MainDSDSR = new BSServiceReference.MainItem();
                mis.MainJCS = new BSServiceReference.MainItem();
                
                mis.MainBC.BaseNumber =Convert.ToDouble(mainDataCells[0]);
                mis.MainBC.ReportNumber = Convert.ToDouble(mainDataCells[1]);
                mis.MainBC.AddorDecNumber = Convert.ToDouble(mainDataCells[2]);
                mis.MainBC.Persent = Convert.ToDouble(mainDataCells[3]);
                mis.MainBC.SumMouth = Convert.ToDouble(mainDataCells[4]);

                mis.MainRS.BaseNumber = Convert.ToDouble(mainDataCells[5]);
                mis.MainRS.ReportNumber = Convert.ToDouble(mainDataCells[6]);
                mis.MainRS.AddorDecNumber = Convert.ToDouble(mainDataCells[7]);
                mis.MainRS.Persent = Convert.ToDouble(mainDataCells[8]);
                mis.MainRS.SumMouth = Convert.ToDouble(mainDataCells[9]);

                mis.MainSR.BaseNumber = Convert.ToDouble(mainDataCells[10]);
                mis.MainSR.ReportNumber = Convert.ToDouble(mainDataCells[11]);
                mis.MainSR.AddorDecNumber = Convert.ToDouble(mainDataCells[12]);
                mis.MainSR.Persent = Convert.ToDouble(mainDataCells[13]);
                mis.MainSR.SumMouth = Convert.ToDouble(mainDataCells[14]);

                
                
                mis.MainWLSR.BaseNumber = Convert.ToDouble(mainDataCells[15]);                
                mis.MainWLSR.ReportNumber = Convert.ToDouble(mainDataCells[16]);
                mis.MainWLSR.AddorDecNumber = Convert.ToDouble(mainDataCells[17]);
                mis.MainWLSR.Persent = Convert.ToDouble(mainDataCells[18]);
                mis.MainWLSR.SumMouth = Convert.ToDouble(mainDataCells[19]);

                mis.MainDSDSR.BaseNumber = Convert.ToDouble(mainDataCells[20]);
                mis.MainDSDSR.ReportNumber = Convert.ToDouble(mainDataCells[21]);
                mis.MainDSDSR.AddorDecNumber = Convert.ToDouble(mainDataCells[22]);
                mis.MainDSDSR.Persent = Convert.ToDouble(mainDataCells[23]);
                mis.MainDSDSR.SumMouth = Convert.ToDouble(mainDataCells[24]);

                
                mis.MainJCS.BaseNumber = Convert.ToDouble(mainDataCells[25]);
                mis.MainJCS.ReportNumber = Convert.ToDouble(mainDataCells[26]);
                mis.MainJCS.AddorDecNumber = Convert.ToDouble(mainDataCells[27]);
                mis.MainJCS.Persent = Convert.ToDouble(mainDataCells[28]);
                mis.MainJCS.SumMouth = Convert.ToDouble(mainDataCells[29]);


                //保存主要数据
                if (bsws.IsHaveMainItems(stationID, bs_date))
                {
                    bsws.UpdateMainItem(stationID, bs_date, mis);
                }
                else
                {
                    bsws.InsertMainItem(stationID, bs_date, mis);
                }

                context.Response.Write("ok");
            }
        }
        else
        {
            context.Response.Write("error");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}