<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage_Login.master" AutoEventWireup="true" CodeFile="web_Default.aspx.cs" Inherits="web_module_web_Default" %>
<%@ Register Src="~/web_usercontrol/Default/Block_Slide.ascx" TagPrefix="uc1" TagName="Block_Slide" %>
<%@ Register Src="~/web_usercontrol/Default/Block_Product.ascx" TagPrefix="uc1" TagName="Block_Product" %>
<%@ Register Src="~/web_usercontrol/Default/Block_News.ascx" TagPrefix="uc1" TagName="Block_News" %>
<%@ Register Src="~/web_usercontrol/Default/Block_ListProduct.ascx" TagPrefix="uc1" TagName="Block_ListProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="higlobal" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hislider" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibelowtop" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hibodyhead" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hibodywrapper" Runat="Server">
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
<asp:Content ID="Content9" ContentPlaceHolderID="hibodybottom" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="hibelowbottom" Runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="hifooter" Runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="hifootersite" Runat="Server">
</asp:Content>

