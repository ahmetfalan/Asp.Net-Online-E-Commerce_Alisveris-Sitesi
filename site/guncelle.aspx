<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim.master" AutoEventWireup="true"
    CodeFile="guncelle.aspx.cs" Inherits="yonetim_guncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kaplayici">
        <h1>
            Güncelleme</h1>
        <div class="govde">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC"
                BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False"
                Width="1200px" Height="125px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                    <asp:TemplateField HeaderText="Show related">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkdetail" href="#myModal" data-toggle="modal" runat="server">Show Data</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#000" ForeColor="White" />
                <HeaderStyle BackColor="#41A0FF" ForeColor="White" />
                <PagerStyle BackColor="#000" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#41A0FF" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#41A0FF" />
                <SortedDescendingCellStyle BackColor="#41A0FF" />
                <SortedDescendingHeaderStyle BackColor="#41A0FF" />
            </asp:GridView>
            <br />
        </div>
        <br />
        <div>
            <div class="table">
                <div>
                    Ürün Adı:<br />
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox>
                </div>
                <div>
                    Ürün Fiyatı:<br />
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="textbox"></asp:TextBox>
                </div>
                <div>
                    Stokta Varmı:<br />
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="textbox">
                        <asp:ListItem>Var</asp:ListItem>
                        <asp:ListItem>Yok</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    İndirimi Varmı:<br />
                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="textbox">
                        <asp:ListItem>Var</asp:ListItem>
                        <asp:ListItem>Yok</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    Ürün Çeşiti:<br />
                    <asp:DropDownList ID="DropDownList6" runat="server" CssClass="textbox">
                        <asp:ListItem>Erkek Giyim</asp:ListItem>
                        <asp:ListItem>Kadın Giyim</asp:ListItem>
                        <asp:ListItem>Çocuk Giyim</asp:ListItem>
                        <asp:ListItem>Takı</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    Beden:<br />
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="textbox"></asp:TextBox>
                </div>
                <div>
                    Resim:
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
            </div>
            <br />
            <asp:Button ID="btnKayit" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click"
                CssClass="btn btn-primary" /></div>
    </div>
</asp:Content>
