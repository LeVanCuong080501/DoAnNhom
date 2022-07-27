<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_Language.aspx.cs" Inherits="admin_page_module_function_module_Language" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">

    <div class="card card-block">
        <%--START Button Giao dien the <a> --%>
        <div class="form-group row">
            <div class="col-sm-10 col-sm-offset-2">
                <asp:UpdatePanel ID="udButton" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                        <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" />
                        <input type="submit" class="btn btn-primary" value="Xóa" onclick="confirmDel()" />
                        <input type="button" class="btn btn-primary" value="Refresh" onclick="window.location.reload()" />
                        <asp:Button ID="btnXoa" runat="server" CssClass="invisible" OnClick="btnXoa_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <%-- END  Button Giao dien the <a> --%>

        <%--START Table gridview Giao dien Editor --%>
        <div class="form-group">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover table-sm" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                    <thead class="">
                        <tr>
                            <th style="width: 5px">#</th>
                            <%--<th style="width: 5px">STT</th>--%>
                            <td style="text-align: center; font-weight: bold">Ngôn ngữ</td>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rplanguage" runat="server">
                            <ItemTemplate>
                                <tr ondblclick="rowsclick(<%#Eval("language_id") %>)">
                                    <th>
                                        <input type="checkbox" id="<%#Eval("language_id") %>" name="location[]" value="<%#Eval("language_id") %>" onclick="check()" /></th>
                                    <%--<th scope="row" style="text-align: center;"><%#Eval("language_id") %></th>--%>
                                    <td><%#Eval("language_name") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <div style="overflow: hidden;">
                <asp:Repeater ID="rptPages" runat="server" OnItemCommand="rptPages_ItemCommand1">
                    <ItemTemplate>
                        <ul class="pagination pagination-sm">
                            <li>
                                <asp:LinkButton ID="btnPage" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server"><%# Container.DataItem %>
                                </asp:LinkButton>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <%-- END  ASPxHtmlEditor Giao dien Editor --%>

        <%-- BEGIN  Popup --%>
        <div>
            <!-- Trigger the modal with a button -->
            <button id="showPopup" type="button" class="btn btn-info btn-lg" style="display: none;" data-toggle="modal" data-target="#myModal">Language</button>
            <asp:TextBox ID="temp" runat="server" ClientIDMode="Static" CssClass="invisible"></asp:TextBox>
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Language</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group row">
                                <label class="col-sm-2 form-control-label text-xs-right">Language:</label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtLanguage" runat="server" CssClass="form-control boxed"> </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:UpdatePanel ID="udLuu" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="btn btn-default" OnClick="btnLuu_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
   <asp:UpdatePanel ID="txtlist" runat="server">
       <ContentTemplate>
            <asp:TextBox ID="txtlistcheck" runat="server" ClientIDMode="Static" CssClass="invisible"></asp:TextBox>
       </ContentTemplate>
   </asp:UpdatePanel>
    <%-- END  Popup --%>
    <script type="text/javascript">
        function popupShow() {
            var modal = document.getElementById('showPopup');
            modal.click();
        }
        function showData(language) {
            document.getElementById('<%=txtLanguage.ClientID%>').value = language;
            popupShow();
        }
        function rowsclick(input) {
            document.getElementById('<%=temp.ClientID%>').value = input;
            document.getElementById('<%=btnChiTiet.ClientID%>').click();


            <%Session["Test"] = "Welcome Mamu";%>
            var session_value = '<%=Session["Test"]%>';
            alert(session_value); 

            var list = <%=listcb%>;
            var temp = [];
            temp = list.split(",");
            for (a in temp) {

                document.getElementById('<%=txtlistcheck.ClientID%>').value = temp[a];
                var abc = temp[a];
                document.getElementById(abc).checked = true;
                
                alert(temp[a]);
            }
           
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
        function check() {

            var listCheck = [];
            console.log($("input[name='location[]']"));
            $("input[name='location[]']:checked").each(function () {
                console.log($(this).val());
                listCheck.push($(this).val());
            });
            console.log(listCheck);

            document.getElementById('<%=txtlistcheck.ClientID%>').value = listCheck;
        }
       
        
    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

