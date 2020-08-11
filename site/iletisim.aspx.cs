using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


public partial class iletisim : System.Web.UI.Page
{
    Class1 c = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void temizle()
    {
        txtAciklama.Text = "";
        txtKonu.Text = "";
        txtMail.Text = "";
        lblHata.Text = "";
    }
    protected void btnGonder_Click(object sender, EventArgs e)
    {
        if (txtAciklama.Text == "" || txtKonu.Text == "" || txtMail.Text == "")
        {
            lblHata.Text = "Boş alan bırkamayız !";
        }
        else
        {
            string mail = txtMail.Text;
            if (mail.IndexOf("@") < 0 || mail.IndexOf(".com") < 0)
            {
                lblHata.Text = "E-Mail hatalı !";
                txtMail.Focus();
            }
            else
            {
                c.cmd("insert into iletisim (smail,skonu,saciklama,starih) values ('" + txtMail.Text + "','" + txtKonu.Text + "','" + txtAciklama.Text + "','" + DateTime.Now + "')");
                temizle();
            }
        }
    }
}