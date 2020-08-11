<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim.master" AutoEventWireup="true"
    CodeFile="reklam.aspx.cs" Inherits="yonetim_reklam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kaplayici">
        <h1>
            Reklam</h1>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="alert alert-danger">
                    Reklam yok ! Reklam eklemek içn gerekli alanları doldurduktan sonra ekle butonuna tıklayın !
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
        </asp:MultiView>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC"
            BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False"
            Width="1200px" Height="125px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True">
            <Columns>
                <asp:CommandField SelectText="Detayı Göster" ShowSelectButton="True" />
                <asp:BoundField DataField="rid" HeaderText="İD" />
                <asp:ImageField DataImageUrlField="reklam" HeaderText="Reklam">
                    <ControlStyle Width="60px" />
                    <FooterStyle Width="60px" />
                    <HeaderStyle Width="60px" />
                    <ItemStyle Width="60px" />
                </asp:ImageField>
                <asp:BoundField DataField="tarih" HeaderText="Tarih" />
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
                Resim:
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Resim alanı boş geçilemez !"
                    Display="None" ValidationGroup="kayit" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                <br />
                <asp:Image ID="Image1" runat="server" Height="510px" Width="510px" />
            </div>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="kayit" />
            <br />
            <asp:Button ID="btnKayit" runat="server" Text="Ekle" OnClick="btnKayit_Click" CssClass="btn btn-primary" />&nbsp;
            <asp:Button ID="btmSil" runat="server" Text="Sil" OnClick="btmSil_Click" CssClass="btn btn-primary" /></div>
    </div>
</asp:Content>
