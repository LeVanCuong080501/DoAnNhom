<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_Contact.aspx.cs" Inherits="web_module_web_Contact" %>

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
        <script src="../admin_js/sweetalert.min.js"></script>
        <script src="//hstatic.net/453/1000055453/1000083452/jcarousellite_1.0.1c4.js?v=1313" type="text/javascript"></script>
        <div class="container">
            <hr />
            <div id="product-list">
                <div class="product-box">
                    <h2>LIÊN&nbsp;HỆ</h2>
                    <hr />
                    <div class="row">
                        <asp:Repeater ID="rpContact" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6">
                                    <h1>&nbsp;</h1>

                                    <h1><span style="color: #0099ff"><strong><%#Eval("contact_name") %></strong></span></h1>

                                    <h3>Địa chỉ :<%#Eval("contact_address") %></h3>

                                    <h3>Email :&nbsp;<a href="mailto:<%#Eval("contact_email") %>"><span style="color: #000000"><%#Eval("contact_email") %></span></a></h3>

                                    <h3>Website :&nbsp;<a href="http://<%#Eval("contact_link") %>/"><span style="color: #000000"><%#Eval("contact_link") %></span></a></h3>

                                    <h3><span style="color: #B22222"><strong>Hotline</strong>:&nbsp;<strong><%#Eval("contact_hotline") %></strong></span></h3>

                                    <p>&nbsp;</p>

                                    <p>&nbsp;</p>

                                    <p>
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.5297595852426!2d108.21593391416943!3d16.037976344536265!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219ebbbc697bb%3A0x4059a71f0c585970!2zMTk3IEzDqiBUaGFuaCBOZ2jhu4ssIEhvw6AgQ8aw4budbmcgQuG6r2MsIEjhuqNpIENow6J1LCDEkMOgIE7hurVuZywgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1572670874252!5m2!1svi!2s" width="1170" height="450" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
                                    </p>

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div method="post" id="checkout-container" class="col-sm-6">
                            <input type="hidden" name="_token" value="eNvWLZicVvOapULGvQ8XMNk6m2MhaDZizPDxuFob" />
                            <table style="width: 100%" class="table">
                                <tbody>
                                    <tr>
                                        <td>Họ và tên</td>
                                        <td>
                                            <input style="width: 100%; margin-bottom: 5px" name="name" runat="server" id="txtname" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>
                                            <input style="width: 100%; margin-bottom: 5px" name="email" runat="server" id="txtemail" /></td>
                                    </tr>
                                    <tr>
                                        <td>Số điện thoại</td>
                                        <td>
                                            <input style="width: 100%; margin-bottom: 5px" name="phone" runat="server" id="txtphone" /></td>
                                    </tr>
                                    <tr>
                                        <td>Nội dung</td>
                                        <td>
                                            <textarea style="width: 100%; margin-bottom: 5px" name="content" runat="server" rows="4" id="txtcontent"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="upContact" runat="server">
                                                <ContentTemplate>
                                                    <button id="btnSave" runat="server" type="submit" onserverclick="btnSave_ServerClick" class="btn btn-primary">Gửi liên hệ</button></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div id="thongbao" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Phản hồi từ hệ thống</h4>
                    </div>
                    <div class="modal-body" id="formalert-content">
                        <p>Hệ thống đang xử lý...</p>
                    </div>

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <script>
            $('#checkout-container').submit(function () {
                var formdata = $(this).serialize();
                $('#thongbao').modal('show');
                $.ajax({
                    url: "/lien-he",
                    type: "post",
                    data: formdata,
                    success: function (response) {
                        $('#formalert-content').html(response);

                        //setTimeout(function(){window.location.href= "http://suachuadienlanhdanang.com";},1000);
                    }
                });
                event.preventDefault();
            })

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

