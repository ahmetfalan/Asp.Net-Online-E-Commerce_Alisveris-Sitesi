using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class kullanici : System.Web.UI.Page
{
    Class1 c = new Class1();
    void cek()
    {
        DataSet ds = c.GetDataSet("select * from kayit");
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    void temizle()
    {
        GridView1.SelectedIndex = -1;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        cek();
        if (GridView1.Rows.Count == 0)
        {
            drpUnvan.Visible = false;
            btnGuncelle.Visible = false;
            btnSil.Visible = false;
            lblUnvan.Visible = false;
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            btnGuncelle.Visible = true;
            btnSil.Visible = true;
            drpUnvan.Visible = true;
            lblUnvan.Visible = true;
            MultiView1.ActiveViewIndex = 0;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataRow dr = c.GetDataRow("select * from kayit where kid =" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        drpUnvan.Text = dr["unvani"].ToString();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        c.cmd("update kayit set unvani='" + drpUnvan.Text + "' where kid=" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        temizle();
        cek();
        MultiView1.ActiveViewIndex = 4;
    }
    protected void btnSil_Click(object sender, EventArgs e)
    {
        c.cmd("delete from kayit where kid=" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        temizle();
        cek();
        MultiView1.ActiveViewIndex = 3;
    }
}