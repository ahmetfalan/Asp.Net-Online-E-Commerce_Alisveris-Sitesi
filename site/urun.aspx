<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="urun.aspx.cs" Inherits="urun" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
    
    </script>
    <div class="urunkaplayici">
        
        <div class="yorumkaplayici">
            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="950px"
                CssClass="ajax__myTab">
                <asp:TabPanel  ID="taburun" runat="server" HeaderText="Ürün" CssClass="tabmenuposition"
                    Visible="true">
                    <HeaderTemplate>
                        Ürün</HeaderTemplate>
                    <ContentTemplate>
                        <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>
                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <asp:Image ID="Image1" runat="server" Height="100%" ImageUrl='<%# Eval("resim") %>'
                                                Width="100%" data-toggle="modal" data-target=".bs-example-modal-lg" />
                                        </div>
                                    </div>
                                </div>
                                <div class="resim" style="cursor: pointer;">
                                    <asp:Image ID="myImg" runat="server" Height="400px" ImageUrl='<%# Eval("resim") %>'
                                        Width="400px" data-toggle="modal" data-target=".bs-example-modal-lg" />
                                </div>
                                <div class="resimyan">
                                    <div class="urunisim">
                                        <%#(Eval("ad").ToString().Length > 30) ? Eval("ad").ToString().Substring(0, 35): Eval("ad").ToString()%></div>
                                    <div class="urunfiyat">
                                        Fiyat:
                                        <%# Eval("fiyat") %>
                                        TL</div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <div class="resimyan">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Label5" runat="server" NavigateUrl='<%# String.Format("~/satinal/{0}/{1}",KodOlustur(Eval("ad").ToString()),Eval("gid").ToString()) %>'
                                        CssClass="btn btn-primary btn-lg">Satın Al</asp:HyperLink>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:HyperLink ID="hypSatinal" CssClass="btn btn-primary btn-lg" runat="server" data-toggle="modal"
                                data-target=".giris">&nbsp;Satın Al</asp:HyperLink>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="yorumyaz" runat="server" HeaderText="TabPanel1" CssClass="tabmenuposition"
                    Visible="true">
                    <HeaderTemplate>
                        Yorum Yaz
                    </HeaderTemplate>
                    <ContentTemplate>
                        Yorumunuz:<asp:TextBox ID="txtYorum" runat="server" Style="resize: none; max-height: 100px;
                            min-height: 100px; max-width: 400px; min-width: 400px;" CssClass="form form-control"
                            Rows="5" TextMode="MultiLine"></asp:TextBox>
                        <asp:Label ID="lblYHata" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Button ID="btnYorum" runat="server" Text="Yorum Yaz" CssClass="btn btn-primary devam"
                            OnClick="btnYorum_Click" />
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="yorumlar" runat="server" HeaderText="TabPanel1" CssClass="tabmenuposition"
                    Visible="true">
                    <HeaderTemplate>
                        Yorumlar
                    </HeaderTemplate>
                    <ContentTemplate>
                        <asp:DataList ID="DataList2" runat="server">
                            <ItemTemplate>
                                <div class="yorum">
                                    <div style="">
                                        <div style="color: Gray; font-size: smaller;">
                                            <div style="float: left; color: Black; font-size: medium;">
                                                <%# Eval("kuladi") %>
                                                &nbsp;</div>
                                            tarafından
                                            <%# Eval("tarih") %>
                                            tarihinde yazıldı.</div>
                                    </div>
                                    <br />
                                    <div style="width: 500px;">
                                        <%# Eval("yorum") %>
                                    </div>
                                </div>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:DataList>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </div>
</asp:Content>
