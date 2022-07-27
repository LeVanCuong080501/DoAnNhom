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
    <style>
        a:hover {
            text-decoration: none
        }

        .dropdown-menu > li > a:hover {
            color: #262626;
            text-decoration: none;
            background-color: #00804d;
        }

        .input-group {
            width: 50%;
            margin-left: 26%;
        }

        .button_link {
            font-size: 19px;
        }

            .button_link:hover {
                text-decoration: none;
                color: red;
            }

        .button_Order {
            background: #00995c;
            padding: 7% 8%;
            width: 90%;
            color: white;
        }

            .button_Order:hover {
                text-decoration: none;
                background: #D73932;
                color: white;
            }
    </style>
    <script>
        $(document).ready(function () {
            $('.btn-number').click(function (e) {
                e.preventDefault();
                var fieldName = $(this).attr('data-field');
                var fieldID = $(this).attr('data-id');
                var type = $(this).attr('data-type');
                var input = $("input[id='txtSoLuong_" + fieldID + "']");
                console.log(input.value)
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
                //  var idgh = parseInt
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
        function functionDathang(id) {
            document.getElementById("<%=txtIDOrder.ClientID%>").value = id;
            document.getElementById("<%=txtthanhtien.ClientID%>").value = document.getElementById("txtthanhTien_" + id).value;
            document.getElementById("<%=txtSL.ClientID%>").value = document.getElementById("txtSoLuong_" + id).value;
            var dathang = document.getElementById('<%=btnDatHang.ClientID%>');
            dathang.click();
        }
        function tinhThanhTien(sl, dg, idOrder) {
            document.getElementById("txtthanhTien_" + idOrder).value = sl * dg;
        }
    </script>
    <div class="container">
        <asp:ScriptManager runat="server" ID="maneger1" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <table style="width: 100%" cellspacing="0">
                    <tr>
                        <th style="width: 20%">
                            <label>HÌNH ẢNH</label></th>
                        <th style="width: 20%">
                            <label>TÊN SẢN PHẨM</label></th>
                        <th style="width: 15%">
                            <label>LOẠI SẢN PHẨM</label></th>
                        <th style="width: 20%">
                            <label>SỐ LƯỢNG</label></th>
                        <th style="width: 13%">
                            <label>ĐƠN GIÁ</label></th>
                        <th>
                            <label>XÁC NHẬN</label></th>
                        <th style="width: 3%"></th>
                    </tr>
                    <asp:Repeater ID="rpGiohang" runat="server">
                        <ItemTemplate>
                            <tr style="box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%), 0 6px 20px 0 rgb(0 0 0 / 19%);">
                                <td>
                                    <asp:ImageButton Style="width: 60%" ID="imgSanPham" runat="server" OnClick="imgSanPham_Click" CommandArgument='<%# Eval("product_id") %>' src='<%# Eval("product_image") %>' />
                                </td>
                                <td>
                                    <asp:LinkButton CssClass="button_link" ID="btnSanPham" runat="server" OnClick="btnSanPham_Click" CommandArgument='<%# Eval("product_id") %>' Text='<%#Eval("product_title") %>'></asp:LinkButton>
                                </td>
                                <td>
                                    <label><%#Eval("productcate_title") %></label></td>
                                <td>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-danger btn-number" data-type="minus" style="width: 15%; margin-right: -5px"
                                                data-id="<%#Eval("order_id") %>" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-minus" style="margin-right: 100%"></span>
                                            </button>
                                        </span>
                                        <input name="quant[2]" id="txtSoLuong_<%#Eval("order_id") %>" style="pointer-events:none" class="form-control input-number" onchange="tinhThanhTien(this.value,<%#Eval("product_price") %>,<%#Eval("order_id") %>)" value="<%#Eval("order_amount") %>" min="1" max="10" type="number" />
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-success btn-number" style="margin-left: -35px" data-id="<%#Eval("order_id") %>" data-type="plus" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </td>
                                <td>
                                    <input id="txtthanhTien_<%#Eval("order_id") %>" value="<%#Eval("order_thanhtien") %>" style="border: none; width: 50%; background: none" readonly type="number" />đ
                                </td>
                                <td>
                                    <a style='<%#Eval("style") %>' class="button_Order" id="btnOrder" onclick="functionDathang(<%#Eval("order_id") %>)">
                                        <%#Eval("tinhtrang") %>
                                    </a>
                                </td>
                                <td>
                                    <a href="#" onclick="confirmDel(<%# Eval("order_id") %>)">
                                        <img style="width: 50%;" src="../images/icon/bin.png" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Đặt hàng :<%#Eval("order_date","{0:dd/MM/yyyy}") %> </label>
                                </td>
                                <td>
                                    <label>Dự kiến nhận hàng:<%#Eval("order_datereceive","{0:dd/MM/yyyy}") %> </label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <div hidden="hidden">
                    <asp:Button ID="btnXoa" runat="server" OnClick="btnXoa_Click" />
                    <input type="text" id="txtID" runat="server" />
                    <asp:Button ID="btnDatHang" runat="server" OnClick="btnDatHang_Click" />
                    <input type="text" id="txtIDOrder" runat="server" />
                    <input type="text" id="txtthanhtien" runat="server" />
                    <input type="text" id="txtSL" runat="server" />
                </div>
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


