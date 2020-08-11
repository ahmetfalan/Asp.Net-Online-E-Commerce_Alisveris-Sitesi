<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="satinal.aspx.cs" Inherits="satinal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function CheckNumeric(e) {
            if (window.event) // IE 
            {
                if ((e.keyCode < 48 || e.keyCode > 57) & e.keyCode != 8) {
                    event.returnValue = false;
                    return false;
                }
            }
            else { // Fire Fox
                if ((e.which < 48 || e.which > 57) & e.which != 8) {
                    e.preventDefault();
                    return false;
                }
            }
        }
    </script>
    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" Width="850px"
        CssClass="ajax__myTab">
        <asp:TabPanel ID="urun" runat="server" HeaderText="" CssClass="tabmenuposition">
            <HeaderTemplate>
                Ürün Bilgileri <span class="glyphicon glyphicon-menu-right"></span>
            </HeaderTemplate>
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
                            Ürün Adı:<%#(Eval("ad").ToString().Length > 30) ? Eval("ad").ToString().Substring(0, 35): Eval("ad").ToString()%><br />
                            Fiyat:<%# Eval("fiyat") %>
                            TL<br />
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="devam1" runat="server" Text="Devam" CssClass="btn btn-success btn-lg devam"
                                OnClick="devam1_Click" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="kullanici" runat="server" HeaderText="" CssClass="tabmenuposition"
            Visible="false">
            <HeaderTemplate>
                Kullanıcı Bilgileri <span class="glyphicon glyphicon-menu-right"></span>
            </HeaderTemplate>
            <ContentTemplate>
                <asp:DataList ID="DataList2" runat="server">
                    <ItemTemplate>
                        <div style="line-height: 35px; padding: 35px; font-size: larger;">
                            <asp:Label ID="Label2" runat="server" Text="Ad: "><%# Eval("ad") %></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text="Soyad: "><%# Eval("soyad") %></asp:Label><br />
                            <asp:Label ID="Label4" runat="server" Text="E-Mail: "><%# Eval("mail") %></asp:Label><br />
                            <asp:Label ID="Label5" runat="server" Text="Telefon Numarası: "><%# Eval("telno") %></asp:Label><br />
                            <asp:Label ID="Label1" runat="server" Text="Adres: "><%# Eval("adres") %></asp:Label>
                            <asp:Button ID="devam1" runat="server" Text="Devam" CssClass="btn btn-success btn-lg devam"
                                OnClick="devam2_Click" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="hesap" runat="server" HeaderText="" CssClass="tabmenuposition"
            Visible="false">
            <HeaderTemplate>
                Hesap Bilgileri <span class="glyphicon glyphicon-menu-right"></span>
            </HeaderTemplate>
            <ContentTemplate>
                <div style="line-height: 25px; padding: 35px; font-size: larger; width: 350px;">
                    Kart Üzerindeki Ad:<asp:TextBox ID="txtKredAd" runat="server" CssClass="form form-control"></asp:TextBox><br />
                    Kart Üzerindeki Soyad:<asp:TextBox ID="txtKredSoy" runat="server" CssClass="form form-control"></asp:TextBox><br />
                    Kart Numarası:<asp:TextBox ID="txtKredNumara" runat="server" CssClass="form form-control"
                        onkeypress="CheckNumeric(event); return this.value.length<=15"></asp:TextBox><br />
                    <asp:MaskedEditExtender ID="MaskedEditExtender2" runat="server" TargetControlID="txtKredNumara"
                        Mask="9999-9999-9999-9999" MessageValidatorTip="true" ErrorTooltipEnabled="True">
                    </asp:MaskedEditExtender>
                    Son Kullanma Tarihi:<asp:TextBox ID="txtKredSon" runat="server" CssClass="form form-control"
                        onkeypress="CheckNumeric(event); return this.value.length<=5"></asp:TextBox>
                    <asp:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtKredSon"
                        Mask="99-99" MessageValidatorTip="true" ErrorTooltipEnabled="True">
                    </asp:MaskedEditExtender>
                    <br />
                    CVC2/CVV:<asp:TextBox ID="txtKredCW" runat="server" CssClass="form form-control"
                        onkeypress="CheckNumeric(event); return this.value.length<=2"></asp:TextBox><br />
                    <asp:Button ID="devam3" runat="server" Text="Devam" CssClass="btn btn-success btn-lg devam"
                        OnClick="devam3_Click" /><br />
                    <asp:Label ID="lblHata" runat="server" Visible="True" ForeColor="Red"></asp:Label>
                </div>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="dogrulama" runat="server" HeaderText="" CssClass="tabmenuposition"
            Visible="false">
            <HeaderTemplate>
                Doğrulama <span class="glyphicon glyphicon-check"></span>
            </HeaderTemplate>
            <ContentTemplate>
                <asp:DataList ID="DataList4" runat="server">
                    <ItemTemplate>
                        <div style="line-height: 25px; padding: 35px; font-size: larger;">
                            <div class="resim" style="cursor: pointer;">
                                <asp:Image ID="myImg" runat="server" Height="400px" ImageUrl='<%# Eval("resim") %>'
                                    Width="400px"/>
                            </div>
                            <div class="resimyan">
                                Ürün Adı:<%#(Eval("ad").ToString().Length > 30) ? Eval("ad").ToString().Substring(0, 35): Eval("ad").ToString()%><br />
                                Fiyat:<%# Eval("fiyat") %>
                                TL<br />
                                <br />
                                <br />
                                <br />
                                <asp:Button ID="devam1" runat="server" Text="Devam" CssClass="btn btn-success btn-lg devam"
                                    OnClick="devam1_Click" /></div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList ID="DataList3" runat="server">
                    <ItemTemplate>
                        <div style="line-height: 35px; padding: 35px; font-size: larger;">
                            <asp:Label ID="Label2" runat="server" Text="Ad: "><%# Eval("ad") %></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text="Soyad: "><%# Eval("soyad") %></asp:Label><br />
                            <asp:Label ID="Label4" runat="server" Text="E-Mail: "><%# Eval("mail") %></asp:Label><br />
                            <asp:Label ID="Label5" runat="server" Text="Telefon Numarası: "><%# Eval("telno") %></asp:Label><br />
                            <asp:Label ID="Label1" runat="server" Text="Adres: "><%# Eval("adres") %></asp:Label>
                            <asp:Button ID="devam1" runat="server" Text="Devam" CssClass="btn btn-success btn-lg devam"
                                OnClick="devam2_Click" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <div style="line-height: 35px; padding: 35px; font-size: larger;">
                    Kart Üzerindeki Ad:<asp:Label ID="lblKartAd" runat="server" Visible="True" Font-Bold="true"></asp:Label><br />
                    Kart Üzerindeki Soyad:<asp:Label ID="lblKartSoyad" runat="server" Visible="True"
                        Font-Bold="true"></asp:Label><br />
                    Kart Numarası:<asp:Label ID="lblKartNumara" runat="server" Visible="True" Font-Bold="true"></asp:Label><br />
                    Son Kullanma Tarihi:<asp:Label ID="lblKartSon" runat="server" Visible="True" Font-Bold="true"></asp:Label><br />
                    CVC2/CVV:<asp:Label ID="lblKartCw" runat="server" Visible="True" Font-Bold="true"></asp:Label><br />
                </div>
                <asp:Button ID="devam4" runat="server" Text="İşlemi Onayla" CssClass="btn btn-success btn-lg devam"
                    OnClick="devam4_Click" /><br />
                </div>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="bitis" runat="server" HeaderText="" CssClass="tabmenuposition"
            Visible="false">
            <HeaderTemplate>
                İşlem Başarılı <span class="glyphicon glyphicon-check"></span>
            </HeaderTemplate>
            <ContentTemplate>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div class="alert alert-info">
                            İşleminiz tamamlandı.
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>
</asp:Content>
