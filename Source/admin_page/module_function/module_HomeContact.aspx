<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_HomeContact.aspx.cs" Inherits="admin_page_module_function_module_HomeContact" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
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
    </script>
    <div class="card card-block">
        <div class="form-group row">
            <div class="col-sm-10">
                <asp:UpdatePanel ID="udButton" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" />
                        <input type="submit" class="btn btn-primary" value="Xóa" onclick="confirmDel()" />
                        <asp:Button ID="btnXoa" runat="server" CssClass="invisible" OnClick="btnXoa_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="form-group table-responsive">
            <dx:ASPxGridView ID="grvList" runat="server" ClientInstanceName="grvList" KeyFieldName="contact_id" Width="100%">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataColumn Caption="Tiêu đề" FieldName="contact_hotline" HeaderStyle-HorizontalAlign="Center" Width="30%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Số hostline" FieldName="contact_phone" HeaderStyle-HorizontalAlign="Center" Width="30%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Địa chỉ" FieldName="contact_address" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Email" FieldName="contact_email" HeaderStyle-HorizontalAlign="Center" Width="30%"></dx:GridViewDataColumn>
                </Columns>
                <ClientSideEvents RowDblClick="btnChiTiet" />
                <SettingsSearchPanel Visible="true" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Trống" SearchPanelEditorNullText="Gỏ từ cần tìm kiếm và enter..." />
                <SettingsLoadingPanel Text="Đang tải..." />
                <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
    </div>
    <dx:ASPxPopupControl ID="popupControl" runat="server" Width="700" Height="400" CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupControl" ShowFooter="true"
        HeaderText="Loại sản phẩm" AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true" ClientSideEvents-CloseUp="function(s,e){grvList.Refresh();}">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:UpdatePanel ID="udPopup" runat="server">
                    <ContentTemplate>
                        <div class="popup-main">
                            <div class="div_content col-12">
                                <div class="col-12 form-group">
                                    <label class="col-2 form-control-label">Tên công ty:</label>
                                    <div class="col-10">
                                        <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="95%"> </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="div_content col-12">
                                <div class="col-12 form-group">
                                    <label class="col-2 form-control-label">Địa chỉ:</label>
                                    <div class="col-10">
                                        <asp:TextBox ID="txtDiaChi" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="95%"> </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="div_content col-12">
                                <div class="col-12 form-group">
                                    <label class="col-2 form-control-label">Số điện thoại:</label>
                                    <div class="col-10">
                                        <asp:TextBox ID="txtPhone" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="95%"> </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="div_content col-12">
                                <div class="col-12 form-group">
                                    <label class="col-2 form-control-label">Email:</label>
                                    <div class="col-10">
                                        <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="95%"> </asp:TextBox>
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
                <asp:UpdatePanel ID="udSave" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnLuu" runat="server" ClientIDMode="Static" Text="Lưu" CssClass="btn btn-primary" OnClientClick="return checkNULL()" OnClick="btnLuu_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
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

