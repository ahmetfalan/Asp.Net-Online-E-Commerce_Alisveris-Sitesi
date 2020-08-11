<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim.master" AutoEventWireup="true"
    CodeFile="yorum.aspx.cs" Inherits="yorum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="kaplayici">
    <h1>Yorumlar</h1>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="alert alert-danger">
                    Yorum yok ! Bir yorum yazılmasını bekleyin.
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
                <asp:BoundField DataField="yid" HeaderText="Yorum İD" />
                <asp:BoundField DataField="gid" HeaderText="Ürün İD" />
                <asp:BoundField DataField="kuladi" HeaderText="Kullanıcı Adı" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        Yorum</HeaderTemplate>
                    <ItemTemplate>
                        <%#(Eval("yorum").ToString().Length > 30) ? Eval("yorum").ToString().Substring(0, 35) : Eval("yorum").ToString()%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="onay" HeaderText="Onaylanmış mı?" />
                <asp:BoundField DataField="tarih" HeaderText="Yazılma Tarihi" />
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
        <div class="table" style="width: 450px;">
            <div>
                <asp:Label ID="lblYorum" runat="server" Text="Yorum:"></asp:Label><asp:TextBox runat="server" TextMode="MultiLine" CssClass="form form-control"
                    ID="txtYorum" Style="resize: none; max-height: 200px; min-height: 200px; max-width: 600px;
                    min-width: 600px;"></asp:TextBox>
            </div>
            <div>
                <br />
                <label class="checkbox-inline">
                    <asp:CheckBox ID="chOnay" runat="server" Text="Onaylıyormusunuz ?" /></label>
            </div>
        </div>
        <br />
        <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click"
            CssClass="btn btn-primary" />
        <asp:Button ID="btnSil" runat="server" Text="Sil" OnClick="btnSil_Click" CssClass="btn btn-primary" />
    </div>
</asp:Content>
