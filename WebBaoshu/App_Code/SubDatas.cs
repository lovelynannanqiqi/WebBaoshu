using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// SubDatas 的摘要说明
/// </summary>
public class SubDatas
{
    
  		public string subStationName;
        public double BC_baseNumber;
        public double BC_reportNumber;
        public double BC_addordecNumber;
        public double BC_sumMouth;

        public double BPRS_baseNumber;
        public double BPRS_reportNumber;
        public double BPRS_addordecNumber;
        public double BPRS_sumMouth;

        public double XZRS_baseNumber;
        public double XZRS_reportNumber;
        public double XZRS_addordecNumber;
        public double XZRS_sumMouth;

        public double TKSR_baseNumber;
        public double TKSR_reportNumber;
        public double TKSR_addordecNumber;
        public double TKSR_sumMouth;

    public SubDatas()
    {

    }
    public SubDatas(string subStationName, double BC_baseNumber, double BC_reportNumber, double BC_addordecNumber, double BC_sumMouth,
        double BPRS_baseNumber, double BPRS_reportNumber, double BPRS_addordecNumber, double BPRS_sumMouth,
        double XZRS_baseNumber, double XZRS_reportNumber, double XZRS_addordecNumber, double XZRS_sumMouth,
        double TKSR_baseNumber, double TKSR_reportNumber, double TKSR_addordecNumber, double TKSR_sumMouth)
        
    {
            this.subStationName = subStationName;
            this.BC_baseNumber = BC_baseNumber;
            this.BC_reportNumber = BC_reportNumber;
            this.BC_addordecNumber = BC_addordecNumber;
            this.BC_sumMouth = BC_sumMouth;

            this.BPRS_baseNumber = BPRS_baseNumber;
            this.BPRS_reportNumber = BPRS_reportNumber;
            this.BPRS_addordecNumber = BPRS_addordecNumber;
            this.BPRS_sumMouth = BPRS_sumMouth;

            this.XZRS_baseNumber = XZRS_baseNumber;
            this.XZRS_reportNumber = XZRS_reportNumber;
            this.XZRS_addordecNumber = XZRS_addordecNumber;
            this.XZRS_sumMouth = XZRS_sumMouth;

            this.TKSR_baseNumber = TKSR_baseNumber;
            this.TKSR_reportNumber = TKSR_reportNumber;
            this.TKSR_addordecNumber = TKSR_addordecNumber;
            this.TKSR_sumMouth = TKSR_sumMouth;
        }
}
        

        