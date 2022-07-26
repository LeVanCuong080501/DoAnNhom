<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Block_Slide.ascx.cs" Inherits="web_usercontrol_Default_Block_Slide" %>
<div class="col-lg-9 col-md-9 hidden-xs hidden-xs">
    <div class="banner-container">
        <div class="bannerindex">
            <div class="flexslider-container">
                <div id="slider_img">
                    <asp:Repeater ID="rpSlide" runat="server">
                        <ItemTemplate>
                            <div class="content-sliders">
                                <img src="<%#Eval("slide_image") %>" alt="2323123" />
                                <div class="description-slider">
                                    <div class="description-inner">
                                        <h2><%#Eval("slide_title") %></h2>
                                        <p><%#Eval("slide_title1") %></p>
                                        <a href="<%#Eval("slide_link") %>" style="color: #ffa700 !important;">XEM THÊM</a>
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
 <script>
        $(document).ready(function () {

            $('#slider_img').owlCarousel({
                navigation: false, // Show next and prev buttons
                slideSpeed: 3000,
                paginationSpeed: 1000,
                singleItem: true,
                autoPlay: 3000,
                stopOnHover: true,
                autoplayTimeout: 1000,
                scrollPerPage: true,
            });
        });
    </script>

