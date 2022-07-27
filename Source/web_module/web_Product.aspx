<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_Product.aspx.cs" Inherits="web_module_web_Product" %>

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
                                <li id="li_cate" runat="server"><a href="../../<%=link_seo %>"><%=titlecate %></a></li>
                                <li class="active"><span><%=title %></span></li>
                                <div class="clr"></div>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container clearfix">
            <div class="row">
                <div id="collection">
                    <!-- Begin collection info -->
                    <!-- Content-->
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="main-content">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-6 fullscreen">
                                            <h1><%=title %>
                                            </h1>
                                        </div>
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 fullscreen">
                                            <div class="browse-tags">
                                                <span class="custom-dropdown custom-dropdown--white">
                                                    <select class="sort-by custom-dropdown__select custom-dropdown__select--white">
                                                        <option value="moi-nhat">Mới nhất</option>
                                                        <option value="cu-nhat">Cũ nhất</option>
                                                        <option value="gia-tang">Giá: Tăng dần</option>
                                                        <option value="gia-giam">Giá: Giảm dần</option>


                                                    </select>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="line000"></div>
                                </div>
                                <div class="col-md-12 product-list">
                                    <div class="row content-product-list">
                                        <asp:Repeater ID="rpProduct" runat="server">
                                            <ItemTemplate>
                                                <div class="col-md-3 col-sm-4 col-xs-4 pro-loop">
                                                    <!--sử dụng  -->
                                                    <div class="product-block product-resize fixheight" <%--style="height: 456px;"--%>>
                                                        <div class="product-img image-resize view view-third" <%--style="height: 337px;"--%>>
                                                            <a href="../../<%#Eval("link") %>" title="6021-28">
                                                                <img alt="<%#Eval("link") %>" title="6021-28" src="<%#Eval("product_image") %>">
                                                            </a>
                                                        </div>
                                                        <div class="product-detail clearfix">
                                                            <!-- sử dụng pull-left -->
                                                            <h3 class="pro-name"><a href="../../<%#Eval("link") %>" title="<%#Eval("link") %>"><%#Eval("product_title") %></a></h3>

                                                            <p class="pro-price">
                                                                <%#Eval("price") %>
                                                            </p>
                                                        </div>
                                                        <div class=" mask">
                                                            <div id="add-item-form" class="cart clearfix">
                                                                <div class="select clearfix">
                                                                    <select id="product-select" name="id" style="display: none">
                                                                        <option value="1008462711">Grey / 42 - 1,996,000₫</option>
                                                                        <option value="1008462715">Grey / 42.67 - 1,996,000₫</option>
                                                                        <option value="1008462716">Grey / 43.33 - 1,996,000₫</option>
                                                                        <option value="1008462717">Grey / 44 - 1,996,000₫</option>
                                                                    </select>
                                                                </div>
                                                                <div hidden="">
                                                                    <input type="number" step="1" name="quantity" value="1" title="Qty" class="input-text qty text" size="4">
                                                                </div>
                                                                <%--<div class="price" style="display: none">
                                                                    <ins>
                                                                        <span class="amount">1,996,000₫</span>
                                                                    </ins>
                                                                    <del>
                                                                        <span class="amount">2,495,000₫</span>
                                                                    </del>
                                                                </div>--%>
                                                                <%--<div class="button-product quick-view">
                                                                    <a href="/chi-tiet-san-pham/<%#cls_ToAscii.ToAscii(Eval("product_title").ToString()) %>-<%#Eval("product_id") %>" title="6021-28" class="quickview btn">Chi tiết                  
                                                                    </a>
                                                                </div>--%>
                                                                <div class="button-product addcart">
                                                                    <div class="button-product addcart">
                                                                    <a href="../../<%#Eval("link") %>" class="btn btn-combination   button-buy">Chi tiết
                                                                    </a>
                                                                </div>
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
                                <div class="col-md-12 ">
                                    <div id="pagination" class="">
                                        <ul class="pagination">
                                            <li class="disabled"><span>«</span></li>
                                            <li class="active"><span>1</span></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#" rel="next">»</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End collection info -->
                    <!-- Begin no products -->
                    <!-- End no products -->
                </div>


          
            </div>
        </div>
       
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

