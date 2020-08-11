<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true"
    CodeFile="iletisim.aspx.cs" Inherits="iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-top: 75px; width: 300px;">
        E-Mail:<br />
        <asp:TextBox ID="txtMail" runat="server" CssClass="form-control">
        </asp:TextBox>
        <br />
        Konu:<br />
        <asp:TextBox ID="txtKonu" runat="server" CssClass="form-control">
        </asp:TextBox>
        <br />
        Açıklama:<br />
        <asp:TextBox ID="txtAciklama" Style="resize: none; max-height: 100px; min-height: 100px;
            max-width: 400px; min-width: 400px;" runat="server" CssClass="form-control" TextMode="MultiLine">
        </asp:TextBox><br />
        <asp:Button ID="btnGonder" runat="server" Text="Gönder" 
            CssClass="btn btn-default btn-lg" onclick="btnGonder_Click"/><br />
        <asp:Label ID="lblHata" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
