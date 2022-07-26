<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_ProductGroup.aspx.cs" Inherits="web_module_web_ProductGroup" %>

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
  <div class="wrap-breadcrumb">
        <div class="outer-breadcrumb">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <ol class="breadcrumb breadcrumb-arrow">
                            <li><a href="/" target="_self">Trang chủ</a></li>
                            <li class="active"><span><%=title%></span></li>
                            <div class="clr"></div>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-12 col-xs-12 main-content-margintop">
                <!-- Content-->
                <div class="main-content">
                    <!-- Sản phẩm trang chủ -->
                    <div class="product-list clearfix borderleft">
                        <!--Start : VẢI BỐ SỌC -->
                        <asp:Repeater ID="rpProductCate" runat="server" OnItemDataBound="rpProductCate_ItemDataBound">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="title-line">
                                            <h1><a href="<%#Eval("link_seo")%>" title="<%#Eval("link_seo")%>"<%-- style="display:none;--%>" ><%#Eval("productcate_title") %></a>

                                            </h1>
                                            <div class="clr"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12 show">
                                        <div class="row">

                                            <asp:Repeater ID="rpProduct" runat="server">
                                                <ItemTemplate>
                                                    <div class="col-md-4 col-sm-4 col-xs-4 pro-loop">
                                                        <!--sử dụng  -->
                                                        <div class="product-block product-resize fixheight" <%--style="height: 456px;--%>">
                                                            <div class="product-img image-resize view view-third"<%-- style="height: 337px;--%>">
                                                                <a href="<%#Eval("link_seo")%>" title="<%#Eval("link_seo")%>">
                                                                    <img alt="<%#Eval("product_title") %>" title="<%#Eval("product_title") %>" src="<%#Eval("product_image") %>">
                                                                </a>
                                                            </div>
                                                            <div class="product-detail clearfix">
                                                                <!-- sử dụng pull-left -->
                                                                <h3 class="pro-name"><a href="<%#Eval("link_seo")%>" title="<%#Eval("link_seo")%>"><%#Eval("product_title") %></a></h3>

                                                                <p class="pro-price">
                                                                    <%#Eval("price") %>
                                                                </p>
                                                            </div>
                                                            <div class=" mask">
                                                                <div id="add-item-form" class="cart clearfix">

                                                                    <div class="price" style="display: none">
                                                                        <ins>
                                                                            <span class="amount">1,996,000₫</span>
                                                                        </ins>
                                                                        <del>
                                                                            <span class="amount">2,495,000₫</span>
                                                                        </del>
                                                                    </div>
                                                                    <%--<div class="button-product quick-view">
                                                                        <a href="/chi-tiet-san-pham/<%#cls_ToAscii.ToAscii(Eval("product_title").ToString()) %>-<%#Eval("product_id")%>" title="<%#Eval("product_title") %>" class="quickview btn">Chi tiết						
                                                                        </a>
                                                                    </div>--%>
                                                                    <div class="button-product addcart">
                                                                        <button id="add-to-cart" data-id="252" class=" btn btn-combination   button-buy">
                                                                           Chi Tiết
                                                                        </button>
                                                                    </div>

                                                                    <div class="clr"></div>
                                                                </div>
                                                                <div class="clr"></div>
                                                            </div>
                                                            <div class="clr"></div>
                                                        </div>
                                                        <div class="clr"></div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                       
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12 marginbottom show">
                                        <div class="view-all">
                                            <a href="<%#Eval("link_seo")%>" title="<%#Eval("link_seo")%>" class="btn">Xem tất cả →</a>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                
                    </div>
                </div>
                <!-- Content-->
            </div>
               <aside class="col-md-3 col-sm-12 col-xs-12">
                    <div class="row">

                        <!-- Sidebar menu-->
                        <div class="list-group clearfix" id="list-group-l">
                            <div class="col-md-12 col-xs-8 fullscreen">
                                <div class="face-title list-group-item active clearfix">
                                    <span>Danh mục sản phẩm 
                                    </span>
                                </div>
                                <ul class="nav navs sidebar " id="cssmenu">
                                    <asp:Repeater ID="rpCategory" runat="server" OnItemDataBound="rpCategory_ItemDataBound">
                                        <ItemTemplate>
                                            <li class="item has-sub first active">
                                                <a href="<%#Eval("link_seo")%>">
                                                    <span class="lbl"><%#Eval("productcate_title") %></span>
                                                    <span data-toggle="collapse" data-parent="#cssmenu" href="#<%#Eval("productcate_id") %>" class="sign"><i class="<%#Eval("kt")%>" style="display: block;"></i></span>
                                                </a>
                                                <ul class="nav children collapse " id="<%#Eval("productcate_id") %>">
                                                    <asp:Repeater ID="rpGory" runat="server">
                                                        <ItemTemplate>
                                                            <li class="first">
                                                                <a href="<%#Eval("link_seo")%>" title="<%#Eval("link_seo")%>" class="child-item">
                                                                    <span><%#Eval("productcate_title") %></span>
                                                                </a>
                                                                <ul class="nav children grandchildren">
                                                                </ul>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <%--<li class="  ">
                                                        <a href="/san-pham/46/bo-soc-tron-nho" title="Bố sọc trơn nhỏ " class="child-item">
                                                            <span>Bố sọc trơn nhỏ </span>
                                                        </a>
                                                        <ul class="nav children grandchildren">
                                                        </ul>
                                                    </li>--%>
                                                    <div class="clr"></div>
                                                </ul>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                        <%--<div class="list-group clearfix">
                            <div class="col-md-12 col-xs-8 fullscreen">
                                <div class="panel panel-default filter_color ">
                                    <div class="face-title list-group-item active">
                                        <span>THƯƠNG HIỆU
                                        </span>

                                    </div>
                                    <ul class="nav navs sidebar menu" id="cssmenur">
                                        <li class="item has-sub first ">
                                            <a class="brandselect" data="15">Rèm Cửa 24h</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>--%>
                     
               
                        <!-- Sidebar menu-->
                        <!-- Support-->
                        <%--<div class="list-group clearfix">
                            <div class="col-md-12 col-xs-8 fullscreen">
                                <div class="face-title list-group-item active">
                                    <span>Hỗ trợ trực tuyến</span>
                                </div>
                                <div class="support">
                                    <p><strong>CÔNG TY...</strong></p>

                                    <p>&nbsp;</p>

                                    <p>&nbsp;</p>

                                </div>
                            </div>
                        </div>--%>
                        <!-- Support-->

                    </div>



                </aside>
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