<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_Search.aspx.cs" Inherits="web_module_web_Search" %>

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
                                <li class="active"><span>Kết quả tìm kiếm:</span></li>
                                <div class="clr"></div>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="hidden-sm hidden-xs">
                        <div id="cssmenuu">
                            <ul>
                                <li class="active-head">
                                    <img src="/images/icon/icon-bar.png" alt="" title="" /><span>Danh Mục Sản Phẩm</span>
                                </li>

                                <li class="has-sub"></li>
                                <asp:Repeater ID="DanhMucSpCate" runat="server" OnItemDataBound="DanhMucSpCate_ItemDataBound">
                                    <ItemTemplate>
                                        <li class="has-sub">
                                            <a href="<%#Eval("link_seo") %>">
                                                <img src="<%#Eval("produtcate_icon") %>" /><span style="padding-left: 10px"><%#Eval("productcate_title") %></span>
                                                <i class="<%#Eval("kt") %>"></i></a>
                                            <ul class="submenu-child" <%#Eval("kt") %>>
                                                <asp:Repeater ID="rpDanhMucSp" runat="server">
                                                    <ItemTemplate>
                                                        <li class="has-sub">
                                                            <a href="<%# Eval("link_seo")%>"><span><%#Eval("productcate_title") %></span>
                                                            </a>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                    <div class="search-left">
                        <h3 class="title-search">Tìm Kiếm Nâng Cao : 
                        </h3>
                        <div class="range-price">
                            <h4 class="title-color">Giá Tiền:
                            </h4>
                            <div class="price-slider">
                                <span>from
                                    <input type="number" id="txtMinPrice" runat="server" value="0" />
                                         to
                                     <input type="number" id="txtMaxPrice" runat="server" value="5000000"  /></span>
                                <input value="0" min="0" max="5000000" step="500" type="range" oninput="txtPriceMin.value=txtSetPriceMin.value" onclick="myPriceMin();" id="txtSetPriceMin" />
                                <input value="5000000" min="0" max="5000000" step="500" type="range" oninput="txtPriceMax.value=txtSetPriceMax.value" onclick="myPriceMax()" id="txtSetPriceMax" />
                                    <div style="display: none">
                                        <input class=" form-control" type="text" id="txtPriceMin" onchange="myPriceMin()" value="0" />
                                        <input class="form-control " type="text" id="txtPriceMax" onchange="myPriceMax()" value="5000000" />
                                    </div>
                                    <script type="text/javascript">
                                        //var getvalue1 = 
                                        var getvalue1 = document.getElementById('txtPriceMin');
                                        var getvalue2 = document.getElementById('txtPriceMax');
                                        var setvalue1 = document.getElementById('txtSetPriceMin');
                                        var setvalue2 = document.getElementById('txtSetPriceMax');
                                        function showSliderValue1() {
                                            setvalue1.value = getvalue1;
                                        }
                                        function showSliderValue2() {
                                            setvalue2.value = getvalue2;
                                        }
                                        function myPriceMin() {
                                            document.getElementById("<%=txtMinPrice.ClientID%>").value = getvalue1.value
                                        }
                                        function myPriceMax() {
                                            document.getElementById("<%=txtMaxPrice.ClientID%>").value = getvalue2.value
                                        };
                                    </script>
                                <svg width="100%" height="24">
                                    <line x1="4" y1="0" x2="300" y2="0" stroke="#212121" stroke-width="12" stroke-dasharray="1 28"></line>
                                </svg>
                            </div>
                        </div>
                        <div class="search-color">
                            <h4 class="title-color">Màu Sắc :
                            </h4>
                            <!-- Material checked -->
                            <asp:Repeater ID="rpColor" runat="server">
                                <ItemTemplate>
                                    <div class="form-check">
                                        <input type="checkbox"id="<%#Eval("color_id") %>" <%#Eval("check123") %> onclick="checkid(<%#Eval("color_id")%>)" class="form-check-input" />
                                        <label class="form-check-label"><%#Eval("color_name") %></label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div style="display: block">
                                    <input id="txtDanhSachChecked" runat="server" type="text" />
                                    <input id="txtCountChecked" runat="server" type="text" />
                                </div>
                                <script type="text/javascript">
                                    function checkid(id) {
                                        var arrayvalue = document.getElementById("<%= txtDanhSachChecked.ClientID %>").value;
                                        var array = JSON.parse("[" + arrayvalue + "]");
                                        var index = array.indexOf(id);
                                        if (index > -1) {
                                            array.splice(index, 1);
                                            document.getElementById("<%= txtDanhSachChecked.ClientID %>").value = array;
                                            document.getElementById("<%= txtCountChecked.ClientID %>").value = document.getElementById("<%= txtCountChecked.ClientID %>").value - 1;
                                        }
                                        else {
                                            document.getElementById("<%= txtCountChecked.ClientID %>").value = array.push(id);
                                            document.getElementById("<%= txtDanhSachChecked.ClientID %>").value = array;
                                        }
                                    }
                                    function loadcheck() {
                                        var arrayvalue = document.getElementById("<%= txtDanhSachChecked.ClientID %>").value;
                                        if (arrayvalue != null) {
                                            document.getElementsByClassName(".checkmark").style = 'display:none';
                                        }
                                    }
                                </script>
                        </div>
                        <button class="btn btn-primary" id="btnApply_All" runat="server" onserverclick="btnApply_All_ServerClick">Áp dụng</button>
                        <a id="hibodywrapper_btnClear" class="btn btn-danger" onclick="myXoa()" href="javascript:__doPostBack('ctl00$hibodywrapper$btnClear','')">Bỏ lọc</a>

                    </div>
                </div>
                <div class=" col-lg-9 col-md-9 col-sm-12 col-xs-12 show">
                    <div class="row">
                        <asp:Repeater ID="rpProduct" runat="server">
                            <ItemTemplate>
                                <div class="col-md-3 col-sm-4 col-xs-4 pro-loop">
                                    <!--sử dụng  -->
                                    <div class="product-block product-resize fixheight" <%--style="height: 456px;"--%>>
                                        <div class="product-img image-resize view view-third" <%--style="height: 337px;"--%>>
                                            <a href="../../<%#Eval("link_seo") %>" title="6021-28">
                                                <img alt="<%#Eval("link_seo") %>" title="6021-28" src="<%#Eval("product_image") %>">
                                            </a>
                                        </div>
                                        <div class="product-detail clearfix">
                                            <!-- sử dụng pull-left -->
                                            <h3 class="pro-name"><a href="../../<%#Eval("link_seo") %>" title="<%#Eval("link_seo") %>"><%#Eval("product_title") %></a></h3>

                                            <p class="pro-price">
                                                <%#Eval("product_price") %>
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
                                                <div class="price" style="display: none">
                                                    <ins>
                                                        <span class="amount">1,996,000₫</span>
                                                    </ins>
                                                    <del>
                                                        <span class="amount">2,495,000₫</span>
                                                    </del>
                                                </div>
                                                <%--<div class="button-product quick-view">
                                                                    <a href="/chi-tiet-san-pham/<%#cls_ToAscii.ToAscii(Eval("product_title").ToString()) %>-<%#Eval("product_id") %>" title="6021-28" class="quickview btn">Chi tiết                  
                                                                    </a>
                                                                </div>--%>
                                                <div class="button-product addcart">
                                                    <div class="button-product addcart">
                                                        <a href="../../<%#Eval("link_seo") %>" class="btn btn-combination   button-buy">Chi tiết
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </div>

        <script>
            // Code By Webdevtrick ( https://webdevtrick.com )
            (function () {

                var parent = document.querySelector(".price-slider");
                if (!parent) return;

                var
                    rangeS = parent.querySelectorAll("input[type=range]"),
                    numberS = parent.querySelectorAll("input[type=number]");

                rangeS.forEach(function (el) {
                    el.oninput = function () {
                        var slide1 = parseFloat(rangeS[0].value),
                            slide2 = parseFloat(rangeS[1].value);

                        if (slide1 > slide2) {
                            [slide1, slide2] = [slide2, slide1];
                        }

                        numberS[0].value = slide1;
                        numberS[1].value = slide2;
                    }
                });

                numberS.forEach(function (el) {
                    el.oninput = function () {
                        var number1 = parseFloat(numberS[0].value),
                            number2 = parseFloat(numberS[1].value);

                        if (number1 > number2) {
                            var tmp = number1;
                            numberS[0].value = number2;
                            numberS[1].value = tmp;
                        }

                        rangeS[0].value = number1;
                        rangeS[1].value = number2;

                    }
                });

            })();
        </script>
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

