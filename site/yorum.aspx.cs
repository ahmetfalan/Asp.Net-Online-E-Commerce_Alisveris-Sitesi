using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class yorum : System.Web.UI.Page
{
    void cek() {
        DataSet ds = c.GetDataSet("select * from yorum");
        GridView1.DataSource = ds;
        GridView1.DataBind(); 
    }
    void temizle() {
        GridView1.SelectedIndex = -1;
        txtYorum.Text = "";
    }
    Class1 c = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        cek();
        if (GridView1.Rows.Count == 0)
        {
            txtYorum.Visible = false;
            btnGuncelle.Visible = false;
            btnSil.Visible = false;
            chOnay.Visible = false;
            lblYorum.Visible = false;
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            txtYorum.Visible = true;
            btnGuncelle.Visible = true;
            btnSil.Visible = true;
            chOnay.Visible = true;
            lblYorum.Visible = true;
            MultiView1.ActiveViewIndex = 0;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataRow dr = c.GetDataRow("select * from yorum where yid=" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        txtYorum.Text = dr["yorum"].ToString();
        OleDbCommand cmd = new OleDbCommand("select count(*) from yorum where onay='Hayır' and yid=" + GridView1.SelectedRow.Cells[1].Text + "", c.baglanti());
        if (cmd.ExecuteScalar().ToString() == "0")
        {
            chOnay.Checked = true;
        }
        else
        {
            chOnay.Checked = false;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DataSet ds = c.GetDataSet("select * from yorum");
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        if (chOnay.Checked == true)
        {
            c.cmd("update yorum set onay='Evet', yorum='" + txtYorum.Text + "' where yid=" + GridView1.SelectedRow.Cells[1].Text + "");
        }
        else if (chOnay.Checked == false)
        {
            c.cmd("update yorum set onay='Hayır', yorum='" + txtYorum.Text + "' where yid=" + GridView1.SelectedRow.Cells[1].Text + "");
        }
        cek();
        temizle();
        MultiView1.ActiveViewIndex = 4;
    }
    protected void btnSil_Click(object sender, EventArgs e)
    {
        c.cmd("delete from yorum where yid=" + GridView1.SelectedRow.Cells[1].Text + "");
        cek();
        temizle();
        MultiView1.ActiveViewIndex = 3;
    }
}