<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim.master" AutoEventWireup="true"
    CodeFile="kullanici.aspx.cs" Inherits="kullanici" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kaplayici">
    <h1>Kullanıcılar</h1>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="alert alert-danger">
                    Kayıt yok ! Siteye kayıt olunmasını bekleyin.
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
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
                <asp:BoundField DataField="kid" HeaderText="Kullanıcı Adı" />
                <asp:BoundField DataField="ad" HeaderText="Adı" />
                <asp:BoundField DataField="soyad" HeaderText="Soyadı" />
                <asp:BoundField DataField="kuladi" HeaderText="Kullanıcı Adı" />
                <asp:BoundField DataField="sifre" HeaderText="Şifre" />
                <asp:BoundField DataField="mail" HeaderText="E-Mail" />
                <asp:BoundField DataField="telno" HeaderText="Telefon Numarası" />
                <asp:BoundField DataField="adres" HeaderText="Adres" />
                <asp:BoundField DataField="cinsiyet" HeaderText="Cinsiyet" />
                <asp:BoundField DataField="unvani" HeaderText="Ünvanı" />
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
        <br />
        <div class="table" style="width: 250px;">
            <div>
                <asp:Label ID="lblUnvan" runat="server" Text="Ünvan:"></asp:Label>
                <asp:DropDownList ID="drpUnvan" runat="server" CssClass="form-control">
                    <asp:ListItem>Kullanıcı
                    </asp:ListItem>
                    <asp:ListItem>Admin
                    </asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click"
            CssClass="btn btn-primary" />
        <asp:Button ID="btnSil" runat="server" Text="Sil" OnClick="btnSil_Click" CssClass="btn btn-primary" />
    </div>
</asp:Content>
