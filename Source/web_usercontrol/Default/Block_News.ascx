<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Block_News.ascx.cs" Inherits="web_usercontrol_Default_Block_News" %>
  <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="linewhite">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 footer-facebook">
                <div class="title-line">
                    <h4>Tin tức</h4>
                    <div class="more-footer hidden-lg hidden-md"></div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div  class="owl-carousel owl-theme owl-demoo">
             <asp:Repeater ID="rpNews" runat="server">
            <ItemTemplate>
            <div class="item">
                <a href="../../<%#Eval("link_seo") %>">
                    <img class="img-responsivee" src="<%#Eval("news_image") %>" /></a>
                <div class="col-sm-12 text-justify">
                     <h4 class="news"><a href="../../<%#Eval("link_seo") %>"><%#Eval("news_title") %></a></h4>
                        <p><%#Eval("news_content") %></p>

                </div>
            </div>
                </ItemTemplate>
                </asp:Repeater>

<
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.owl-demoo').owlCarousel({
                navigation: false, // Show next and prev buttons
                slideSpeed: 2500,
                paginationSpeed: 1000,
                autoPlay: true,
                items: 3,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3],
                itemsTablet: [768, 2],
                itemsTabletSmall: false,
                itemsMobile: [479, 1],
                singleItem: false,
                itemsScaleUp: false,
            });

        });
    </script>