<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim.master" AutoEventWireup="true"
    CodeFile="yonetim.aspx.cs" Inherits="yonetim_yonetim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kaplayici">
        <h1>
            Ekleme / Silme / Güncelleme</h1>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="alert alert-danger">
                    Ürün yok. Bir ürün eklemek için gerekli alanları doldurduktan sonra ekle butonuna tıklayınız.
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div class="alert alert-info">
                    Yeni kayıt eklendi.
                </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <div class="alert alert-danger">
                    Seçilen kayıt silindi.
                </div>
            </asp:View>
            <asp:View ID="View5" runat="server">
                <div class="alert alert-info">
                    Seçilen kayıt güncellendi.
                </div>
            </asp:View>
        </asp:MultiView>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC"
            BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False"
            Width="1200px" Height="125px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True">
            <Columns>
                <asp:CommandField SelectText="Seç" ShowSelectButton="True" />
                <asp:BoundField DataField="gid" HeaderText="İD" />
                <asp:BoundField DataField="ad" HeaderText="Ürün Adı" />
                <asp:BoundField DataField="fiyat" HeaderText="Fiyat" />
                <asp:BoundField DataField="stok" HeaderText="Stok" />
                <asp:BoundField DataField="indirim" HeaderText="İndirim" />
                <asp:BoundField DataField="cesit" HeaderText="Çeşit" />
                <asp:BoundField DataField="beden" HeaderText="Beden" />
                <asp:BoundField DataField="satma" HeaderText="Satma" />
                <asp:BoundField DataField="tarih" HeaderText="Eklenme Tarihi" />
                <asp:ImageField DataImageUrlField="resim" HeaderText="Resim">
                    <ControlStyle Width="60px" />
                    <FooterStyle Width="60px" />
                    <HeaderStyle Width="60px" />
                    <ItemStyle Width="60px" />
                </asp:ImageField>
            </Columns>
            <FooterStyle BackColor="#41A0FF" ForeColor="White" />
            <HeaderStyle BackColor="#41A0FF" ForeColor="White" />
            <PagerSettings PageButtonCount="6" Position="Top" />
            <PagerStyle HorizontalAlign="Left" CssClass="GridPager" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#41A0FF" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#41A0FF" />
            <SortedDescendingCellStyle BackColor="#41A0FF" />
            <SortedDescendingHeaderStyle BackColor="#41A0FF" />
            <SortedAscendingCellStyle BackColor="#EDF6F6"></SortedAscendingCellStyle>
            <SortedAscendingHeaderStyle BackColor="#41A0FF"></SortedAscendingHeaderStyle>
            <SortedDescendingCellStyle BackColor="#41A0FF"></SortedDescendingCellStyle>
            <SortedDescendingHeaderStyle BackColor="#41A0FF"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <br />
        <div class="table">
            <div>
                Ürün Adı:<br />
                <asp:TextBox ID="txtAd" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
            <div>
                Ürün Fiyatı:<br />
                <asp:TextBox ID="txtFiyat" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Fiyat alanına eksili bir değer girilemez !"
                    ValidationExpression="^\d+$" Display="None" ValidationGroup="kayit" ControlToValidate="txtFiyat"></asp:RegularExpressionValidator>
            </div>
            <br />
            <div>
                Stokta Varmı:<br />
                <asp:DropDownList ID="drpStok" runat="server" CssClass="form-control">
                    <asp:ListItem>Var</asp:ListItem>
                    <asp:ListItem>Yok</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <div>
            İndirim:<br />
                <asp:CheckBox ID="chİndirim" runat="server" Text="&nbsp;&nbsp;İndirimde"/>
            </div>
            <br />
            <div>
                Ürün Çeşiti:<br />
                <asp:DropDownList ID="drpCesit" runat="server" CssClass="form-control">
                    <asp:ListItem>Erkek Giyim</asp:ListItem>
                    <asp:ListItem>Kadın Giyim</asp:ListItem>
                    <asp:ListItem>Çocuk Giyim</asp:ListItem>
                    <asp:ListItem>Takı</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <div>
                Beden:<br />
                <asp:TextBox ID="txtBeden" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
            <div>
                Resim:
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Resim alanı boş geçilemez !"
                    ControlToValidate="FileUpload1" Display="None" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ürün Adı alanı boş geçilemez !"
                    ControlToValidate="txtAd" Display="None" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ürün Fiyatı alanı boş geçilemez !"
                    ControlToValidate="txtFiyat" Display="None" ValidationGroup="ekle"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Beden alanı boş geçilemez !"
                    ControlToValidate="txtBeden" Display="None" ValidationGroup="ekle"></asp:RequiredFieldValidator>
            </div>
        </div>
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label><br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="ekle" />
        <br />
        <asp:Button ID="btnKayit" runat="server" Text="Ekle" OnClick="btnKayit_Click" CssClass="btn btn-primary"
            ValidationGroup="ekle" />
        <asp:Button ID="btnSil" runat="server" Text="Sil" CssClass="btn btn-primary" OnClick="btnSil_Click"
            ValidationGroup="sil" />
        <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click"
            CssClass="btn btn-primary" ValidationGroup="guncelle" />
    </div>
</asp:Content>
