using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request["ssdata"] != null)
        {

            string[] MainAndSub = Request["ssdata"].ToString().Split(new char[] { '#' });
            Response.Write(MainAndSub[0]+"</br>");
            Response.Write(MainAndSub[1] + "</br>");


        }
       
    }

    
}