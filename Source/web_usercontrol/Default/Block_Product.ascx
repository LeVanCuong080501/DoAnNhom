<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Block_Product.ascx.cs" Inherits="web_usercontrol_Default_Block_Product" %>

<section id="content" class="clearfix">
    <script src="/js/jcarousellite_1.0.1c4.js" type="text/javascript"></script>
    <%--  <div class="container">
    </div>--%>
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <!-- Content-->
                <div class="main-content">
                    <!-- Sản phẩm trang chủ -->
                    <div class="product-list clearfix borderleft">
                        <!--Start : VẢI BỐ SỌC -->
                        <asp:Repeater ID="rpProductCate" runat="server" OnItemDataBound="rpProductCate_ItemDataBound">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <section class="banner-big clearfix">
                                            <a href="#">
                                                <img src="<%#Eval("meta_image") %>" alt="<%#Eval("productcate_title") %>">
                                            </a>
                                        </section>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="title-line">
                                            <h1><a href="<%#Eval("link_seo")%>" title="<%#Eval("link_seo") %>"><%#Eval("productcate_title") %></a></h1>
                                            <div class="clr"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="owl-carousel owl-theme owl-demo">
                                    <asp:Repeater ID="rpProduct" runat="server">
                                        <ItemTemplate>
                                            <div class="item">
                                                <div class="pro-loop">
                                                    <!--sử dụng  -->
                                                    <div class="product-block product-resize">
                                                        <div class="product-img image-resize view view-third">
                                                            <a href="/<%#Eval("link_seo") %>" title="<%#Eval("product_title")%>">
                                                                <img alt="<%#Eval("product_title")%>" title="<%#Eval("product_title")%>" src="<%#Eval("product_image")%>" />
                                                            </a>
                                                        </div>
                                                        <div class="product-detail clearfix">
                                                            <!-- sử dụng pull-left -->
                                                            <h3 class="pro-name"><a href="/<%#Eval("link_seo") %>" title="<%#Eval("product_title") %>"><%#Eval("product_title") %></a></h3>

                                                            <p class="pro-price">
                                                                <%#Eval("price" ) %>
                                                            </p>
                                                        </div>
                                                        <div class=" mask">
                                                            <div id="add-item-form" class="cart clearfix">

                                                                <div class="price" style="display: none">
                                                                    <ins>
                                                                        <span class="amount"><%#Eval("price")%></span>
                                                                    </ins>
                                                                    <del>
                                                                        <span class="amount"><%#Eval("product_price_new","{0:0,00}") %>₫</span>
                                                                    </del>
                                                                </div>
                                                                <div class="button-product addcart">
                                                                    <a href="/<%#Eval("link_seo") %>" class="btn btn-combination   button-buy">Chi tiết
                                                                    </a>
                                                                </div>

                                                            </div>
                                                            <div class="clr"></div>
                                                        </div>
                                                        <div class="clr"></div>
                                                    </div>
                                                    <div class="clr"></div>
                                                </div>
                                            </div>

                                            <%--<div class="clr"></div>--%>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <script>
                                    $(document).ready(function () {
                                        $('.owl-demo').owlCarousel({
                                            navigation: true, // Show next and prev buttons
                                            slideSpeed: 3000,
                                            paginationSpeed: 1000,
                                            autoPlay: false,
                                            items: 4,
                                            itemsDesktop: [1199, 4],
                                            itemsDesktopSmall: [979, 3],
                                            itemsTablet: [768, 2],
                                            itemsTabletSmall: false,
                                            itemsMobile: [479, 1],
                                            singleItem: false,
                                            itemsScaleUp: false,
                                        });

                                    });
                                </script>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12 marginbottom show">
                                        <div class="view-all">
                                            <a href="<%#Eval("link_seo")%>" title="<%#Eval("productcate_title") %>" class="btn">Xem tất cả →</a>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!--end : VẢI BỐ SỌC -->

                    </div>

                    <!-- Content-->
                </div>
            </div>
        </div>
    </div>
    <!-- End sản phẩm trang chủ -->
  
</section>
