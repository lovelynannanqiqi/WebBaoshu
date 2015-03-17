using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignIn : System.Web.UI.Page
{
    BSServiceReference.BaoShuFunctionsSoapClient bsws = new BSServiceReference.BaoShuFunctionsSoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_Signin_Click(object sender, EventArgs e)
    {
     
        int StationID;

        if (bsws.CheckUser(out StationID, txt_userid.Text.Trim(), txt_pass.Text.Trim()))
        {
            Session["stationID"] = StationID;
            if (Request.QueryString["ReturnUrl"] != null)
            {
                FormsAuthentication.RedirectFromLoginPage(txt_userid.Text, false);
            }

            else
            {
                FormsAuthentication.SetAuthCookie(txt_userid.Text, false);
                Response.Redirect("default.aspx", false);
            }
        }
        else
        {
            lab_info.Text = "用户编码或登录密码错误，请重新输入。";
            txt_pass.Text = "";
            txt_userid.Text = "";
        }

    }
}