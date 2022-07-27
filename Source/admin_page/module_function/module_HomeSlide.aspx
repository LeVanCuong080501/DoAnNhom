<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_HomeSlide.aspx.cs" Inherits="admin_page_module_function_module_HomeSlide" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <script src="/admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <script type="text/javascript">
        function func() {
            grvList.Refresh();
            popupControl.Hide();
        }
        function btnChiTiet() {
            document.getElementById('<%=btnChiTiet.ClientID%>').click();
        }
        function checkNULL() {
            var CityName = document.getElementById('<%= txttensanpham.ClientID%>');

            if (CityName.value.trim() == "") {
                swal('Tên form không được để trống!', '', 'warning').then(function () { CityName.focus(); });
                return false;
            }
            return true;
        }
        function confirmDel() {
            swal("Bạn có thực sự muốn xóa?",
                "Nếu xóa, dữ liệu sẽ không thể khôi phục.",
                "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        var xoa = document.getElementById('<%=btnXoa.ClientID%>');
                        xoa.click();
                    }
                });
            }
            function showPreview(input) {
                if (input.files && input.files[0]) {
                    var filerdr = new FileReader();
                    filerdr.onload = function (e) {
                        $('#imgPreview').attr('src', e.target.result);
                    }
                    filerdr.readAsDataURL(input.files[0]);
                }
            }
            function showImg(img) {
                $('#imgPreview').attr('src', img);
            }
    </script>
    <div class="card card-block">
        <div class="form-group row">
            <div class="col-sm-10">
                <asp:UpdatePanel ID="udButton" runat="server">
                    <ContentTemplate>
                        <div id="btnThem1" style="display: none">
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                        </div>
                        <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" />
                        <div id="btnXoa1" style="display: none">
                            <input type="submit" class="btn btn-primary" value="Xóa" onclick="confirmDel()" />
                            <asp:Button ID="btnXoa" runat="server" CssClass="invisible" OnClick="btnXoa_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="form-group table-responsive">
            <dx:ASPxGridView ID="grvList" runat="server" ClientInstanceName="grvList" KeyFieldName="slide_id" Width="100%">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="2%">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataColumn Caption="Link" FieldName="slide_link" HeaderStyle-HorizontalAlign="Center" Width="50%"></dx:GridViewDataColumn>

                    <dx:GridViewDataColumn FieldName="slide_image" Width="60%" Caption="Hình ảnh" HeaderStyle-HorizontalAlign="Center" CellStyle-VerticalAlign="Middle">
                        <DataItemTemplate>
                            <img src="<%#Eval("slide_image") %>" height="100" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                </Columns>
                <ClientSideEvents RowDblClick="btnChiTiet" />
                <SettingsSearchPanel Visible="true" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Gỏ từ cần tìm kiếm và enter..." />
                <SettingsLoadingPanel Text="Đang tải..." />
                <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
    </div>
    <dx:ASPxPopupControl ID="popupControl" runat="server" Width="1000px" Height="600px" CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupControl" ShowFooter="true"
        HeaderText="Hình ảnh slide" AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true" ClientSideEvents-CloseUp="function(s,e){grvList.Refresh();}">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:UpdatePanel ID="udPopup" runat="server">
                    <ContentTemplate>
                        <div class="popup-main">
                            <div class="div_content col-12">
                                <div class="col-12">
                                    <div class="col-8">
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">Active:</label>
                                            <div class="col-10">
                                                <asp:TextBox ID="txttensanpham" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="90%"> </asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">Hình ảnh:</label>
                                            <div class="col-10">
                                                <p>Kích thước ảnh tiêu chuẩn 1100x550</p>
                                                <asp:FileUpload ID="upLogo" runat="server" onchange="showPreview(this)" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="col-12 form-group">
                                            <img id="imgPreview" src="/" width="100%" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterContentTemplate>
            <div class="mar_but button">
                <asp:Button ID="btnLuu" runat="server" ClientIDMode="Static" Text="Lưu" CssClass="btn btn-primary" OnClientClick="return checkNULL()" OnClick="btnLuu_Click" />
            </div>
        </FooterContentTemplate>
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

