<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteMasterPage.master" AutoEventWireup="true" CodeFile="web_News.aspx.cs" Inherits="web_js_web_NewsCate" %>

<%--<%@ Register Src="~/web_usercontrol/uc_ProductMenuLeft.ascx" TagPrefix="uc1" TagName="uc_ProductMenuLeft" %>--%>
<%@ Register Src="~/web_usercontrol/global_pagging.ascx" TagPrefix="uc1" TagName="linqPaging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="https://cncstone.vn/tin-tuc" />
    <meta name="description" content="tin tức ĐÁ MỸ NGHỆ CNC" />
    <link rel="canonical" href="https://cncstone.vn/tin-tuc" />
    <meta property="og:locale" content="vi_VN" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="tin-tuc" />
    <meta property="og:description" content="tin-tuc" />
    <meta property="og:url" content="https://cncstone.vn/tin-tuc" />
    <meta property="og:site_name" content="CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU ĐÁ MỸ NGHỆ CNC" />
    <link rel="alternate" href="https://cncstone.vn/tin-tuc" hreflang="vi-vn" />
    <meta name="ROBOTS" content="index, follow" />
    <!-- /SEO google plus -->
    <meta itemprop="name" content="CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU ĐÁ MỸ NGHỆ CNC" />
    <meta itemprop="description" content="CÔNG TY CỔ PHẦN XUẤT NHẬP KHẨU ĐÁ MỸ NGHỆ CNC" />

    <!-- /SEO google plus -->
    <meta name="ROBOTS" content="index, follow" />
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
    <section class="bread-crumb">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ul class="breadcrumb">
                        <li class="home">
                            <a itemprop="url" href="/"><span itemprop="title">Trang chủ</span></a>
                            <span><i class="fa fa-angle-right"></i></span>
                        </li>


                        <li><strong itemprop="title">Tin tức</strong></li>


                    </ul>
                </div>
            </div>
        </div>
    </section>
    <div id="news" class="container">
        <div class="row">
            <section class="right-content col-md-9 col-md-push-3">
                <div class="box-heading">
                    <h1 class="title-head hidden">Tin tức</h1>
                </div>

                <section class="list-blogs blog-main">
                    <asp:Repeater ID="rpnewscate" runat="server">
                        <ItemTemplate>
                            <article class="blog-item">
                                <div class="row">
                                    <div class="blog-item-thumbnail height-auto col-49">
                                        <a href="/chi-tiet-tin-tuc/<%#cls_ToAscii.ToAscii(Eval("news_title").ToString()) %>-<%#Eval("news_id") %>">
                                            <img src="<%#Eval("news_image") %>" alt="<%#Eval("news_title") %>">
                                        </a>
                                    </div>
                                    <div class="blog-item-info col-59">
                                        <h3 class="blog-item-name"><a href="/chi-tiet-tin-tuc/<%#cls_ToAscii.ToAscii(Eval("news_title").ToString()) %>-<%#Eval("news_id") %>"><%#Eval("news_title") %></a></h3>
                                        <div class="post-time">
                                            Ngày<%#Eval("news_createdate", "{0:dd/MM/yyyy}") %>
                                        </div>
                                        <p class="blog-item-summary"><%#Eval("news_summary") %></p>
                                        <a class="btn btn-white" href="/chi-tiet-tin-tuc/<%#cls_ToAscii.ToAscii(Eval("news_title").ToString()) %>-<%#Eval("news_id") %>">Đọc thêm</a>
                                    </div>
                                </div>
                            </article>
                        </ItemTemplate>
                    </asp:Repeater>
                </section>
                <div class="row">
                    <div class="col-sm-12 col-xs-12">
                        <uc1:linqPaging runat="server" ID="linqPaging" />
                    </div>
                </div>
            </section>
            <aside class="left left-content col-md-3 col-md-pull-9">
                <aside class="aside-item sidebar-category blog-category">
                    <div class="aside-title">
                        <h2 class="title-head"><span>Danh mục tin tức</span></h2>
                    </div>
                    <div class="aside-content">
                        <nav class="nav-category navbar-toggleable-md">
                            <ul class="nav navbar-pills">
                                <asp:Repeater ID="rpmenucate" runat="server">
                                    <ItemTemplate>
                                        <li class="nav-item">
                                            <i class="fa fa-caret-right"></i>
                                            <a href="../../tin-tuc/<%#cls_ToAscii.ToAscii(Eval("newscate_title").ToString()) %>-<%#Eval("newscate_id") %>" class="nav-link"><%#Eval("newscate_title") %> (<%#Eval("SoLuong") %>)</a>
                                            <i class="fa fa-angle-down hidden "></i>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </nav>
                    </div>

                    <%--<uc1:uc_ProductMenuLeft runat="server" ID="uc_ProductMenuLeft" />--%>
                </aside>
                <div class="aside-item">
                    <div>
                        <div class="aside-title">
                            <h2 class="title-head"><a href="/tim-kiem">Bài viết liên quan</a></h2>
                        </div>
                        <div class="aside-content">
                            <div class="blog-list blog-image-list">
                                <asp:Repeater ID="rptintuclienqua" runat="server">
                                    <ItemTemplate>
                                        <div class="loop-blog">
                                            <div class="thumb-left">
                                                <a href="/chi-tiet-tin-tuc/<%#cls_ToAscii.ToAscii(Eval("news_title").ToString()) %>-<%#Eval("news_id") %>">

                                                    <img src="<%#Eval("news_image") %>" style="width: 100%;" alt="<%#Eval("news_title") %>" class="img-responsive">
                                                </a>
                                            </div>
                                            <div class="name-right">
                                                <h3><a href="/chi-tiet-tin-tuc/<%#cls_ToAscii.ToAscii(Eval("news_title").ToString()) %>-<%#Eval("news_id") %>"><%#Eval("news_title") %></a></h3>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                </div>

            </aside>


        </div>
    </div>
    <div class="ab-module-article-mostview"></div>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="hibelowbottom" runat="Server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

