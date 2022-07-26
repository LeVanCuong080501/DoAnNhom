<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_ProductDetail.aspx.cs" Inherits="web_module_web_ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <script src="../admin_js/sweetalert.min.js"></script>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section id="content" class="clearfix">
        <script src="//hstatic.net/453/1000055453/1000083452/jcarousellite_1.0.1c4.js?v=1313" type="text/javascript"></script>
        <script type="text/javascript">
          function mySoLuong(id) {
            document.getElementById("<%=txt_SoLuong_Popup.ClientID%>").value = id;
            //alert(document.getElementById("<%=txt_SoLuong_Popup.ClientID%>").value)
        }
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false; return true;
            }
        </script>
        <div class="wrap-breadcrumb">
            <div class="outer-breadcrumb">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 ">
                            <ol class="breadcrumb breadcrumb-arrow">
                                <li><a href="/" target="_self">Trang chủ</a></li>
                                <li><a href="../../<%=link%>" target="_self"><%=titleCate%></a></li>
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
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 main-content-margintop">
                    <div class="row">
                        <div id="wrapper-detail clearfix">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12  product-image">
                                <div id="surround clearfix">

                                    <div class="product-sale">
                                        <span class="icon-sale">
                                            <label class="sale-lb">Sale</label>
                                        </span>
                                    </div>
                                    <!-- link to magiczoom.css file -->
                                    <link href="/css/magiczoomplus.css" rel="stylesheet" type="text/css" media="screen" />
                                    <!-- link to magiczoom.js file -->
                                    <script src="/js/magiczoomplus.js" type="text/javascript"></script>
                                    <%--<div class="big-image">
                                        <a id="Zoomer" href="<%=image %>" class="MagicZoomPlus" rel="show-title: bottom; selectors-class: Active;" title="" style="position: relative; display: inline-block; text-decoration: none; outline: 0px; overflow: hidden; width: auto; height: auto;">
                                            <img src="<%=image %>" style="opacity: 1;">
                                            <div class="MagicZoomPup" style="z-index: 10; position: absolute; overflow: hidden; display: none; visibility: hidden; width: 294px; height: 273px; opacity: 0.5; left: 0px; top: 289px;"></div>
                                            <div class="MagicZoomPlusHint" style="display: block; overflow: hidden; position: absolute; visibility: visible; z-index: 1; left: 2px; right: auto; top: 2px; bottom: auto; opacity: 0.75; max-width: 425px;">Zoom</div>
                                        </a>
                                        <br />
                                    </div>--%>
                                    <div class="big-image">
                                        <a id="Zoomer" href="<%=image %>" class="MagicZoomPlus" rel="show-title: bottom; selectors-class: Active;" title="" style="position: relative; display: inline-block; text-decoration: none; outline: 0px; overflow: hidden; width: auto; height: auto;">
                                            <img src="<%=image %>" style="opacity: 1;"/>
                                            <div class="MagicZoomPup" style="z-index: 10; position: absolute; overflow: hidden; display: none; visibility: hidden; width: 294px; height: 273px; opacity: 0.5; left: 129px; top: 284px;"></div>
                                            <div class="MagicZoomPlusHint" style="display: block; overflow: hidden; position: absolute; visibility: visible; z-index: 1; left: 2px; right: auto; top: 2px; bottom: auto; opacity: 0.75; max-width: 425px;">Zoom</div>
                                        </a>
                                        <br />
                                    </div>

                                    <%--   <a href="/images/23.png" class="Selector left-control Active MagicThumb-swap" rel="zoom-id:Zoomer" rev="/images/23.png" style="outline: none; display: inline-block;">
                                        <img src="/images/23.png"/></a>
                                    <a href="" class="Selector left-control MagicThumb-swap" rel="zoom-id:Zoomer" rev="" id="mt-980384231550" style="outline: none; display: inline-block;">
                                        <img src="#"/></a>
                                    --%>
                                </div>

                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 detail-product clearfix">
                                <div class="product-title">
                                    <h1><%=title %></h1>
                                    <p>
                                        <span id="pro_sku">Mã sản phẩm: <span class="thuonghieu"></span></span>
                                        <br />
                                    </p>
                                </div>
                                <div class="product-price" id="price-preview">
                                    <span>Giá: <%=price %></span>
                                </div>
                                 
                                <div id="add-item-form-2" class="variants clearfix">
                                    <div class="select-wrapper ">
                                        <input id="txt_SoLuong" type="number" name="txt_SoLuong" value="1" min="1" onchange="mySoLuong(txt_SoLuong.value)" class="tc item-quantity " />
                                        <%--<input id="slproduct" name="slproduct"/>--%>
                                    </div>
                                    <div class="clr"></div>
                                    <div class="row">

                                        <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6 fullscreen">
                                            <button type="button" data-toggle="modal" data-target="#myModal" class="btn-detail btn-color-add btn-min-width btn-mgt button-buy">Xem chi tiết </button>
                                        </div>
                                     
                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                        <h4 class="modal-title" id="myModalLabel">Chi Tiết</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-popup">
                                                            <div class="form-group">
                                                                <input class="form-control" type="text" runat="server" id="txtnameProduct" />
                                                            </div>
                                                            <div class="form-group">
                                                                <input class="form-control" type="number" value="1" runat="server" id="txt_SoLuong_Popup" onkeypress="return isNumberKey(event)" />
                                                                <%--<p id="slproduct"></p>--%>
                                                            </div>
                                                           <%-- <div class="form-group">
                                                                <input class="form-control" type="text" runat="server" id="txt_Name" placeholder="Họ Và Tên" />
                                                            </div>--%>
                                                            <div class="form-group">
                                                                <input class="form-control" type="text" runat="server" id="txt_Address"    placeholder="Địa chỉ" />
                                                            </div>
                                                            <%--<div class="form-group">
                                                                <input class="form-control" type="email" runat="server" id="txt_Email" placeholder="Địa Chỉ" />
                                                            </div>--%>
                                                            <textarea class="form-control" rows="3" runat="server" id="txt_Content" placeholder="Nội Dung Yêu Cầu"></textarea>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <asp:UpdatePanel ID="uporder" runat="server">
                                                            <ContentTemplate>
                                                                <button type="button" id="btn_send" class="btn btn-lienhe" data-dismiss="modal" runat="server" onserverclick="btn_send_ServerClick">Thêm vào giỏ hàng</button>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                 

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!--[if !IE]-->
                                        <div class="col-sm-12 share">
                                            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-526b16ce15374888"></script>
                                            <%--<div class="addthis_native_toolbox" data-url="http://www.phukienmancualocha.com/chi-tiet-san-pham/247-6021-23" data-title="Màn rèm cửa Đà Nẵng - Màn rèm cửa giá rẻ" data-description="Lộc Hà Màn rèm cửa Đà Nẵng - Màn rèm cửa giá rẻ"><div id="atstbx" class="at-share-tbx-element at-share-tbx-native addthis_default_style addthis_20x20_style addthis-smartlayers addthis-animated at4-show"><a class="addthis_button_facebook_like at_native_button at300b" fb:like:layout="button_count"><div class="fb-like fb_iframe_widget" data-layout="button_count" data-show_faces="false" data-share="false" data-action="like" data-width="90" data-height="25" data-font="arial" data-href="http://www.phukienmancualocha.com/chi-tiet-san-pham/247-6021-23" data-send="false" style="height: 25px;" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=263266547210244&amp;container_width=0&amp;font=arial&amp;height=25&amp;href=http%3A%2F%2Fwww.phukienmancualocha.com%2Fchi-tiet-san-pham%2F247-6021-23&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;share=false&amp;show_faces=false&amp;width=90"><span style="vertical-align: bottom; width: 69px; height: 20px;"><iframe name="f10d11df83c74f4" width="90px" height="25px" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v2.0/plugins/like.php?action=like&amp;app_id=263266547210244&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D44%23cb%3Df45bbaea49dd34%26domain%3Dwww.phukienmancualocha.com%26origin%3Dhttp%253A%252F%252Fwww.phukienmancualocha.com%252Ff2b761ecc0cd06%26relation%3Dparent.parent&amp;container_width=0&amp;font=arial&amp;height=25&amp;href=http%3A%2F%2Fwww.phukienmancualocha.com%2Fchi-tiet-san-pham%2F247-6021-23&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;send=false&amp;share=false&amp;show_faces=false&amp;width=90" style="border: none; visibility: visible; width: 69px; height: 20px;" class=""></iframe></span></div></a><a class="addthis_button_tweet at_native_button at300b"><div class="tweet_iframe_widget" style="width: 62px; height: 25px;"><span><iframe id="twitter-widget-0" scrolling="no" frameborder="0" allowtransparency="true" class="twitter-share-button twitter-share-button-rendered twitter-tweet-button" style="position: static; visibility: visible; width: 60px; height: 20px;" title="Twitter Tweet Button" src="https://platform.twitter.com/widgets/tweet_button.2d991e3dfc9abb2549972ce8b64c5d85.en.html#dnt=false&amp;id=twitter-widget-0&amp;lang=en&amp;original_referer=http%3A%2F%2Fwww.phukienmancualocha.com%2Fchi-tiet-san-pham%2F247-6021-23&amp;size=m&amp;text=M%C3%A0n%20r%C3%A8m%20c%E1%BB%ADa%20%C4%90%C3%A0%20N%E1%BA%B5ng%20-%20M%C3%A0n%20r%C3%A8m%20c%E1%BB%ADa%20gi%C3%A1%20r%E1%BA%BB%3A&amp;time=1572793562297&amp;type=share&amp;url=http%3A%2F%2Fwww.phukienmancualocha.com%2Fchi-tiet-san-pham%2F247-6021-23%23.Xb7s18IXOyA.twitter" data-url="http://www.phukienmancualocha.com/chi-tiet-san-pham/247-6021-23#.Xb7s18IXOyA.twitter"></iframe></span></div></a><a class="addthis_button_pinterest_pinit at300b" pi:pinit:layout="horizontal" pi:pinit:url="http://www.phukienmancualocha.com/chi-tiet-san-pham/247-6021-23"><div class="pin_it_iframe_widget" style="height: 25px;"><span><span class="PIN_1572793562132_button_pin PIN_1572793562132_save" data-pin-log="button_pinit_bookmarklet" data-pin-href="https://www.pinterest.com/pin/create/button/">Lưu</span></span></div></a><a class="addthis_button_google_plusone at_native_button"></a><a class="addthis_counter addthis_pill_style at_native_button" href="#" style="display: inline-block;"><a class="atc_s addthis_button_compact">Share<span></span></a><a class="addthis_button_expanded" target="_blank" title="More" href="#"></a></a><div class="atclear"></div></div></div>--%>
                                        </div>
                                        <!--[endif]-->
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="line000"></div>
                                        </div>
                                    </div>
                                </div>
                                 
                                <div class="clearfix p10">
                                    <!-- Begin social icons -->

                                    <!-- End social icons -->
                                </div>

                            </div>
                            <div class="clr"></div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  clearfix" style="margin-top: 20px;">
                                <div role="tabpanel" class="product-comment">
                                    <!-- Nav tabs -->
                                    <ul class="nav visible-lg visible-md" role="tablist">
                                        <li role="presentation" class="active"><a data-spy="scroll" data-target="#mota" href="#mota" aria-controls="mota" role="tab">Mô tả sản phẩm</a></li>
                                        <div class="clr"></div>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div id="mota" class="clearfix">
                                        <div class="title-bl visible-xs visible-sm">
                                            <h4>Mô tả</h4>
                                        </div>
                                        <div class="clearfix product-description-wrapper">
                                            <div class="mota-brand">
                                                <div class="adidasbrand">
                                                    <h2><%=content %></h2>

                                                    <p>&nbsp;</p>

                                                    <p>&nbsp;</p>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div id="binhluan">
                                        <div class="title-bl">
                                            <h4>Bình luận</h4>
                                        </div>
                                        <div class="clearfix">
                                            <div class="fb-comments" data-href="http://www.phukienmancualocha.com/chi-tiet-san-pham/247-6021-23" data-numposts="5"></div>
                                        </div>
                                    </div>--%>
                                    <div class="clr"></div>
                                </div>
                                <div class="clr"></div>
                            </div>
                        </div>
                        <div class="col-md-12 list-like clearfix">
                            <div id="like" class=" clearfix">
                                <div class="container">
                                    <div class="row">
                                        <div class="title-like">
                                            <h4>Sản phẩm khác</h4>
                                        </div>
                                        <%--<div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="title-line">
                                <h1>San Pham</h1>
                                <div class="clr"></div>
                            </div>
                        </div>--%>
                                        <div id="sanpham" class="owl-carousel owl-theme">
                                            <asp:Repeater ID="rpProduct" runat="server">
                                                <ItemTemplate>
                                                    <div class="item">
                                                        <div class="pro-loop">
                                                            <div class="product-block product-resize">
                                                                <div class="product-img image-resize view view-third">
                                                                    <a href="../../<%#Eval("link_seo") %>" title="<%#Eval("link_seo") %>">
                                                                        <img alt="<%#cls_ToAscii.ToAscii(Eval("product_title").ToString()) %>" title="<%#Eval("link_seo") %>" src="<%#Eval("product_image") %>">
                                                                    </a>
                                                                </div>
                                                                <div class="product-detail clearfix">
                                                                    <h3 class="pro-name"><a href="../..<%#Eval("link_seo") %>" title="<%#Eval("link_seo") %>"><%#Eval("product_title") %></a></h3>

                                                                    <p class="pro-price">
                                                                        <%#Eval("price") %>
                                                                    </p>
                                                                </div>
                                                                <div class=" mask">
                                                                    <div id="add-item-form" class="cart clearfix">
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
                        </div>
                    </div>
                </div>
                <input id="curcolor" type="hidden" value="0" />
                <input id="cursize" type="hidden" value="0" />
                <script>

                    $('.selectcolor').click(function () {
                        $('.selectcolor').removeClass('active');
                        $(this).addClass('active');
                        var color = $(this).attr('data');
                        $('#curcolor').val(color);
                    })
                    $('.selectsize').click(function () {
                        $('.selectsize').removeClass('active');
                        $(this).addClass('active');
                        var color = $(this).attr('data');
                        $('#cursize').val(color);
                    })

                    //$('.button-buy').click(function () {
                    //    var sp = 247;
                    //    var sl = $('#quantity').val();
                    //    var color = parseInt($('#curcolor').val());
                    //    var size = parseInt($('#cursize').val());
                    //    //alert(sp);
                    //    //if(color==0){
                    //    //alert('Vui lòng chọn màu sắc cho sản phẩm');
                    //    //}
                    //    //else{
                    //    //if(size==0){
                    //    //alert('Vui lòng chọn size cho sản phẩm');
                    //    //} 
                    //    // else{
                    //    $.ajax({
                    //        url: "http://www.phukienmancualocha.com/addCart",
                    //        type: "get",
                    //        data: { id: sp, qty: sl, color: color, size: size },
                    //        dataType: 'json',
                    //        success: function (response) {
                    //            alert('Thêm sản phẩm này vào giỏ hàng thành công!');
                    //            loadSmartCart();
                    //            //setTimeout(singlecheckout(),1000);
                    //            //$('#xpopup').modal('show');
                    //            window.location.href = "/gio-hang.html";
                    //        }
                    //    });
                    //    // }
                    //    //}
                    //});
                </script>


            </div>
        </div>


        <hr />
        <script>
            $(document).ready(function () {
                $('#sanpham').owlCarousel({
                    navigation: false, // Show next and prev buttons
                    slideSpeed: 3000,
                    paginationSpeed: 1000,
                    autoPlay: true,
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

