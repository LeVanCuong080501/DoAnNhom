<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_New.aspx.cs" Inherits="web_module_web_New" %>

<%@ Register Src="~/web_usercontrol/global_pagging.ascx" TagPrefix="uc1" TagName="global_pagging" %>


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
    <section id="content" class="clearfix">
        <script src="//hstatic.net/453/1000055453/1000083452/jcarousellite_1.0.1c4.js?v=1313" type="text/javascript"></script>
        <div class="container">
            <hr>
            <h2>Tin tức</h2>
            <hr>
            <asp:Repeater ID="rpNew" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm-2">
                            <a href="/tin-tuc">
                                <img src="<%#Eval("news_image") %>" class="img-responsive"></a>
                        </div>
                        <div class="col-sm-10">
                            <h3 class="article-titile"><a href="/tin-tuc/<%#cls_ToAscii.ToAscii(Eval("news_title").ToString()) %>-<%#Eval("news_id") %>"><%#Eval("news_title") %></a></h3>
                            <p><%#Eval("news_content") %></p>
                        </div>
                    </div>
                    <hr>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
    <div class="row">
        <div class="col-sm-12 col-xs-12">
            <uc1:global_pagging runat="server" ID="global_pagging" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="hibelowbottom" runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

