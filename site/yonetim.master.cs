using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_yonetim : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect((HttpContext.Current.Handler as Page).ResolveUrl("giyingiydirin.aspx"));
        }
        else
        {
            string curlink = Request.RawUrl;
            if (curlink.Contains("/yonetim.aspx"))
            {
                anasayfa.Attributes["class"] = "selected";
            }
            else if (curlink.Contains("/reklam.aspx"))
            {
                reklam.Attributes["class"] = "selected";
            }
            else if (curlink.Contains("/ayarlar.aspx"))
            {
                ayarlar.Attributes["class"] = "selected";
            }
            else if (curlink.Contains("/yorum.aspx"))
            {
                yorum.Attributes["class"] = "selected";
            }
            else if (curlink.Contains("/kullanici.aspx"))
            {
                kullanici.Attributes["class"] = "selected";
            }
        }
    }
}
