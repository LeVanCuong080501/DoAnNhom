<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Block_ListProduct.ascx.cs" Inherits="web_usercontrol_Default_Block_ListProduct" %>

   <div class="col-lg-3 col-md-3  hidden-sm hidden-xs">
                <div id="cssmenuu">
                    <ul>
                        <li class="active-head">
                            <img src="/images/icon/icon-bar.png" alt="" title=""><span>Danh Mục Sản Phẩm</span>
                        </li>

                        <li class="has-sub">
                           <asp:Repeater ID="DanhMucSpCate" runat="server" OnItemDataBound="DanhMucSpCate_ItemDataBound">
                <ItemTemplate>
                    <li class="has-sub">
                        
                      <a href="<%#Eval("link_seo") %>">  <img src="<%#Eval("produtcate_icon") %>" /><span style="padding-left:10px"><%#Eval("productcate_title") %></span>
                            <i class="<%#Eval("kt") %>"></i>
                        </a>
                        <ul class="submenu-child" <%#Eval("kt") %>  >
                            <asp:Repeater ID="rpDanhMucSp" runat="server">
                                <ItemTemplate>
                                    <li class="has-sub">
                                        <a href="<%# Eval("link_seo")%>"><span><%#Eval("productcate_title") %></span>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
                        </li>

                    </ul>
                </div>
            </div>
