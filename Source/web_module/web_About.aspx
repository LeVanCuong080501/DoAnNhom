<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_About.aspx.cs" Inherits="web_module_web_About" %>

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

        <div class="wrap-breadcrumb">
            <div class="outer-breadcrumb">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 ">
                            <ol class="breadcrumb breadcrumb-arrow">
                                <li><a href="/" target="_self">Trang chủ</a></li>
                                <li class="active"><span>Giới thiệu </span></li>
                                <div class="clr"></div>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rpAbout" runat="server"><ItemTemplate>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <!-- Content-->
                    <div class="main-content">
                        <p><%#Eval("introduce_content") %></p>
                    </div>
                </div>
                    </ItemTemplate></asp:Repeater>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
    </section>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="hibelowbottom" runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

