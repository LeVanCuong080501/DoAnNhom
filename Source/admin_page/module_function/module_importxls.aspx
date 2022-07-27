<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_importxls.aspx.cs" Inherits="admin_page_module_function_module_importxls" %>

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

                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                <br />
              <%--   <asp:Label ID="Label1" runat="server" Text="Has Header ?"></asp:Label>
               <asp:RadioButtonList ID="rbHDR" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>--%>

            </div>
        </div>

        <div class="form-group">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </div>
        </div>
        <%-- END  ASPxHtmlEditor Giao dien Editor --%>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

