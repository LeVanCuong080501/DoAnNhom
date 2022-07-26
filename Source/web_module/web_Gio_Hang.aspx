<%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="web_Gio_Hang.aspx.cs" Inherits="web_module_Gio_Hang" %>

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
    <script src="../admin_js/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.btn-number').click(function (e) {
                e.preventDefault();
                var fieldName = $(this).attr('data-field');
                var type = $(this).attr('data-type');
                var input = $("input[name='" + fieldName + "']");
                var currentVal = parseInt(input.val());
                if (!isNaN(currentVal)) {
                    if (type == 'minus') {
                        var minValue = parseInt(input.attr('min'));
                        if (!minValue) minValue = 1;
                        if (currentVal > minValue) {
                            input.val(currentVal - 1).change();
                        }
                        if (parseInt(input.val()) == minValue) {
                            $(this).attr('disabled', true);
                        }
                    }
                    else if (type == 'plus') {
                        var maxValue = parseInt(input.attr('max'));
                        if (!maxValue) maxValue = 10;
                        if (currentVal < maxValue) {
                            input.val(currentVal + 1).change();
                        }
                        if (parseInt(input.val()) == maxValue) {
                            $(this).attr('disabled', true);
                        }
                    }
                }
                else {
                    input.val(0);
                }
            });
            $('.input-number').focusin(function () {
                $(this).data('oldValue', $(this).val());
            });
            $('.input-number').change(function () {
                var minValue = parseInt($(this).attr('min'));
                var maxValue = parseInt($(this).attr('max'));
                if (!minValue) minValue = 1;
                if (!maxValue) maxValue = 10;
                var valueCurrent = parseInt($(this).val());
                var name = $(this).attr('name');
                if (valueCurrent >= minValue) {
                    $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
                }
                else {
                    alert('Sorry, the minimum value was reached');
                    $(this).val($(this).data('oldValue'));
                }
                if (valueCurrent < maxValue) {
                    $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    alert('Sorry, the maximum value was reached');
                    $(this).val($(this).data('oldValue'));
                }
            });
            $(".input-number").keydown(function (e) {
                // Allow: backspace, delete, tab, escape, enter and .            
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                    // Allow: Ctrl+A                
                    (e.keyCode == 65 && e.ctrlKey === true) ||
                    // Allow: home, end, left, right                
                    (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything                     
                    return;
                }
                // Ensure that it is a number and stop the keypress            
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });
        });
    </script>
    <script>
        function confirmDel(id) {
            swal("Bạn có thực sự muốn xóa sản phẩm khỏi giỏ hàng?",
                "Xoá",
                "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        document.getElementById("<%=txtID.ClientID%>").value = id;
                        var xoa = document.getElementById('<%=btnXoa.ClientID%>');
                        xoa.click();
                    }
                });
        }
        function tinhThanhTien() {

        }
    </script>

    <style>
        .input-group {
            width: 50%;
            margin-left: 26%;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        tr:hover {
            background-color: #ddd;
            cursor: pointer;
        }
    </style>
    <div class="container">
        <asp:ScriptManager runat="server" ID="maneger1" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <table style="width: 100%" cellspacing="0">
                    <tr>
                        <th>
                            <label>HÌNH ẢNH</label></th>
                        <th>
                            <label>TÊN SẢN PHẨM</label></th>
                        <th>
                            <label>LOẠI SẢN PHẨM</label></th>
                        <th>
                            <label>SỐ LƯỢNG</label></th>
                        <th>
                            <label>ĐƠN GIÁ</label></th>
                        <th>
                            <label>XÁC NHẬN</label></th>
                        <th style="width: 8%">
                            <label>HỦY</label></th>
                    </tr>
                    <asp:Repeater ID="rpGiohang" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="imgSanPham" runat="server" OnClick="imgSanPham_Click" CommandArgument='<%# Eval("product_id") %>' src='<%# Eval("product_image") %>' />
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnSanPham" runat="server" OnClick="btnSanPham_Click" CommandArgument='<%# Eval("product_id") %>' Text='<%#Eval("product_title") %>'></asp:LinkButton>
                                </td>
                                <td>
                                    <label><%#Eval("productcate_title") %></label></td>
                                <td>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-danger btn-number" data-type="minus" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-minus" style="margin-right: 100%"></span>
                                            </button>
                                        </span>
                                        <input name="quant[2]" class="form-control input-number" onchange="tinhThanhTien()" value="<%#Eval("order_amount") %>" min="1" max="10" type="text" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-success btn-number" style="margin-left: -22px" data-type="plus" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    <label><%#Eval("product_price") %>đ </label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnDathang" runat="server" Text='<%#Eval("tinhtrang") %>' OnClick="btnDathang_Click" CommandArgument='<%#Eval("order_id") %>'> </asp:LinkButton>
                                </td>
                                <td>
                                    <a href="#" onclick="confirmDel(<%# Eval("order_id") %>)">
                                        <img style="width: 30%;" src="../images/icon/bin.png" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Đặt hàng vào ngày :<%#Eval("order_date","{0:dd/MM/yyyy}") %> </label>
                                </td>
                                <td>
                                    <label>Dự kiến nhận hàng vào ngày :<%#Eval("order_datereceive","{0:dd/MM/yyyy}") %> </label>
                                </td>
                                <td>
                                    <label>Thành tiền :<%#Eval("thanhtien", "{0:N0}") %>đ </label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <asp:Button ID="btnXoa" runat="server" OnClick="btnXoa_Click" CommandArgument='<%# Eval("order_id") %>' />
                <input type="text" id="txtID" runat="server" hidden="hidden" />
            </ContentTemplate>
        </asp:UpdatePanel>
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

