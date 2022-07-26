<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/web_usercontrol/Default/Block_Slide.ascx" TagPrefix="uc1" TagName="Block_Slide" %>
<%@ Register Src="~/web_usercontrol/Default/Block_Product.ascx" TagPrefix="uc1" TagName="Block_Product" %>
<%@ Register Src="~/web_usercontrol/Default/Block_News.ascx" TagPrefix="uc1" TagName="Block_News" %>
<%@ Register Src="~/web_usercontrol/Default/Block_ListProduct.ascx" TagPrefix="uc1" TagName="Block_ListProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="higlobal" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hislider" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibelowtop" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <div class="container">
        <div class="row">
            <uc1:Block_ListProduct runat="server" ID="Block_ListProduct" />
            <%-- Block Slide--%>
            <uc1:Block_Slide runat="server" ID="Block_Slide" />
        </div>
    </div>
    <%--  block product--%>
    <uc1:Block_Product runat="server" ID="Block_Product" />
    <%--Block News--%>

    <uc1:Block_News runat="server" ID="Block_News" />
    
    
    
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="hibelowbottom" runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

