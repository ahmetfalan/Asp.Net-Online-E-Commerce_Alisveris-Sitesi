<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="giyingiydirin.aspx.cs" Inherits="anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </div>
    <div>
        <div class="ortaresim">
            <div style="font-size:xx-large; font-weight: bold; color: White; padding-left: 250px;
                padding-top: 120px;">
                <a href="<%= Page.ResolveUrl("~")%>giyingiydirin.aspx">Giyin Giydirin</a></div>
            <div style="font-size:x-large; font-weight:lighter; color: White; padding-left: 150px;
                padding-top: 40px; width:650px; text-indent:20px;">
                Türkiye'nin en güvenilir E-Ticaret sitesi <a href="<%= Page.ResolveUrl("~")%>giyingiydirin.aspx">Giyin Giydirin</a> sizlere en kolay alışverişi
                en hızlı şekilde sağlamaktadır. Bizi tercih ettiğiniz için teşekkürler.</div>
        </div>
        <br />
        <br />
        <div class="cizgi">
            İndirimde Olanlar
        </div>
        <div class="container demo-1">
            <div class="main">
                <ul id="s2" class="elastislide-list">
                    <asp:Repeater ID="indirimdeolanlar" runat="server">
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="Label5" runat="server" NavigateUrl='<%# String.Format("~/urun/{0}/{1}",KodOlustur(Eval("ad").ToString()),Eval("gid").ToString()) %>'>
                                    <div class="kutu">
                                        <div class="img" style="cursor: pointer;">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("resim") %>' ImageAlign="Top"
                                                Width="120px" Height="120px" />
                                        </div>
                                        <div class="isim">
                                            <%#(Eval("ad").ToString().Length > 30) ? Eval("ad").ToString().Substring(0, 15) + "..." : Eval("ad").ToString()%>
                                        </div>
                                        <div class="fiyat">
                                            <%# Eval("fiyat") %>
                                            TL
                                        </div>
                                        <div class="indrm">
                                            <%# Eval("indirim") %>&nbsp;
                                        </div>
                                    </div>
                                </asp:HyperLink>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <script type="text/javascript">
                $('#s2').elastislide();
            </script>
        </div>
        <script type="text/javascript">
            $('#s3').elastislide();
        </script>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div class="cizgi">
        Yeni Eklenenler
    </div>
    <div class="container demo-1">
        <div class="main">
            <ul id="s" class="elastislide-list">
                <asp:Repeater ID="yenieklenenler" runat="server">
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink ID="Label5" runat="server" NavigateUrl='<%# String.Format("~/urun/{0}/{1}",KodOlustur(Eval("ad").ToString()),Eval("gid").ToString()) %>'>
                                <div class="kutu">
                                    <div class="img" style="cursor: pointer;">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("resim") %>' ImageAlign="Top"
                                            Width="120px" Height="120px" />
                                    </div>
                                    <div class="isim">
                                        <%#(Eval("ad").ToString().Length > 30) ? Eval("ad").ToString().Substring(0, 15) + "..." : Eval("ad").ToString()%>
                                    </div>
                                    <div class="fiyat">
                                        <%# Eval("fiyat") %>
                                        TL
                                    </div>
                                    <div class="indrm">
                                        <%# Eval("indirim") %>&nbsp;
                                    </div>
                                </div>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <script type="text/javascript">
            $('#s').elastislide();
        </script>
    </div>
</asp:Content>
