using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class yonetim_guncelle : System.Web.UI.Page
{
    Class1 c = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        cek();
    }
    void cek()
    {
        DataSet ds = c.GetDataSet("select * from giyim");
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataRow dr = c.GetDataRow("select * from giyim where gid=" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        TextBox4.Text = dr["ad"].ToString();
        TextBox5.Text = dr["fiyat"].ToString();
        DropDownList4.Text = dr["stok"].ToString();
        DropDownList5.Text = dr["indirim"].ToString();
        DropDownList6.Text = dr["cesit"].ToString();
        TextBox6.Text = dr["beden"].ToString();
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        c.cmd("update giyim set ad='" + TextBox4.Text + "',fiyat='" + TextBox5.Text + "',stok='" + DropDownList4.Text + "',indirim='" + DropDownList5.Text + "',cesit='" + DropDownList6.Text + "',beden='" + TextBox6.Text + "' where gid=" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        cek();
    }
}