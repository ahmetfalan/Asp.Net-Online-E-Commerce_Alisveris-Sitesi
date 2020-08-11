<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="taki.aspx.cs" Inherits="taki" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
        <ItemTemplate>
            <asp:HyperLink ID="Label5" runat="server" NavigateUrl='<%# String.Format("~/urun/{0}/{1}",KodOlustur(Eval("ad").ToString()),Eval("gid").ToString()) %>'>
                <div class="kutu" style="margin: 30px;">
                    <div class="img" style="cursor: pointer;">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("resim") %>' ImageAlign="Top"
                            Width="120px" Height="120px" />
                    </div>
                    <div class="isim">
                        <%#(Eval("ad").ToString().Length > 30) ? Eval("ad").ToString().Substring(0, 15) + "..." : Eval("ad").ToString()%>
                    </div>
                    <div class="fiyat">
                        <%# Eval("fiyat") %>
                    </div>
                    <div class="indrm">
                        <%# Eval("indirim") %>&nbsp;
                    </div>
                </div>
            </asp:HyperLink>
        </ItemTemplate>
    </asp:DataList>
    <div style="margin-left: 370px;">
        <br />
        <br />
        <br />
        <cc1:CollectionPager ID="sayfalama1" runat="server" BackNextDisplay="Buttons" BackNextLinkSeparator=""
            BackNextLocation="None" BackNextStyle="" BackText="Geri" FirstText=" İlk Sayfa "
            HideOnSinglePage="True" IgnoreQueryString="True" LabelStyle="" LabelText="" LastText=" Son Sayfa "
            MaxPages="100" NextText=" İleri " PageNumbersDisplay="Numbers" PageNumbersSeparator="-&amp;nbsp;"
            PageNumbersStyle="" PageNumberStyle="" PageSize="15" PagingMode="PostBack" QueryStringKey="Sayfa"
            ResultsLocation="None" ResultsStyle="" SectionPadding="1" ShowFirstLast="True"
            ShowLabel="True" ShowPageNumbers="True" SliderSize="5" UseSlider="True" ControlCssClass="Sayfalama"
            ControlStyle="">
        </cc1:CollectionPager>
    </div>
</asp:Content>
