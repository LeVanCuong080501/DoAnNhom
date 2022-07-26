 <%@ Page Title="" Language="C#" MasterPageFile="~/WebMasterPage.master" AutoEventWireup="true" CodeFile="Login_Custormer.aspx.cs" Inherits="admin_page_module_function_Login_Custormer" %>

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

    <style>
        .button_login {
            border-radius: 5px
        }

        h3 {
            font-size: 35px;
            color: #127C2F;
            font-weight: 800;
            border-bottom: 1px solid #127C2F;
            padding: 5%;
        }

        h4 {
            font-size: 15px
        }

        .title {
            margin: 0px
        }

        .block_Login {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 10px
        }

        .akk {
            margin: 15px 15px
        }

        #birthday_wrapper {
            color: #606770;
            font-family: SFProText-Medium, Helvetica, Arial, sans-serif;
            font-size: 12px;
            font-weight: normal;
            line-height: 20px;
            margin-left: -235px;
            margin: 0 0 0 -235px;
        }

        .calDoB {
            width: 81px;
            padding: 0 8px;
            border-radius: 5px;
            color: #1c1e21;
            font-family: SFProText-Medium, Helvetica, Arial, sans-serif;
            font-size: 15px;
            font-weight: normal;
            height: 36px;
            line-height: 20px;
        }

        .box-DoB {
            height: 75px;
        }

        .btn-lienhe {
            border-radius: 5px
        }

        .block_Login {
            max-width: 100%;
            width: 70%;
            text-align: center;
            background: #F9F9F9;
        }

        .input_login {
            width: 250px;
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            background: #EBEDED;
            height: 40px;
        }

        .button_login {
            background: #127C2F;
            color: white;
            padding: 3% 25%;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                abc
            </div>
            <div class="col-lg-6">
                <div class="block_Login">
                    <div class="row title">
                        <h3>RÈM CỬA 24H</h3>
                        <h4>LOGIN TO CONTINUE</h4>
                    </div>
                    <div class="row">
                        <input placeholder="Your phone number"
                            class="input_login" id="txtUsername" runat="server" />
                    </div>
                    <div class="row" style="padding: 5% 0">
                        <input placeholder="Password" class="input_login" id="txtPassword" runat="server" />
                    </div>
                    <div class="row">
                        <div class="col-lg-10">
                            <checkbox class="checkbox_remember" id="ckb_remember">Remember me</checkbox>
                        </div>
                    </div>
                    <div class="row" style="padding: 5% 0">
                        <a class="button_login" id="btnLogin" onserverclick="btnLogin_ServerClick" runat="server">Log In</a>
                    </div>
                    <div class="row">
                        <h6>If you dont have account, click to </h6>
                        <a data-toggle="modal" data-target="#myModal" class="button_signup" id="btn_Signup" runat="server">Sign up</a>
                    </div>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Sign Up</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-popup">
                                        <div class="form-group col-lg-6">
                                            <input class="form-control" type="text" runat="server" id="txt_FName" placeholder="First name" />
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <input class="form-control" type="text" runat="server" id="txt_SName" placeholder="Surname" />
                                        </div>
                                        <div class="form-group akk">
                                            <input class="form-control" type="text" runat="server" id="txt_Username"  placeholder="Your username" />
                                        </div>
                                         <div class="form-group akk">
                                            <input class="form-control" type="email" runat="server" id="txt_PassWord" placeholder="New password" />
                                        </div>
                                        <div class="form-group akk">
                                            <input class="form-control" type="email" runat="server" id="txt_RPassword" placeholder="Repeat your password" />
                                        </div>
                                        <div class="form-group akk">
                                            <input class="form-control" type="text" runat="server" id="txt_Phone" onkeypress="return isNumberKey(event)" placeholder="Mobile number or email address" />
                                        </div>
                                       
                                    </div>
                                    <div class="box-DoB">
                                        <div id="birthday_wrapper">
                                            <span>Date of Birth</span>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <span>
                                                <select aria-label="Day" name="birthday_day" id="day" title="Day" class="calDoB">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                    <option value="14">14</option>
                                                    <option value="15">15</option>
                                                    <option value="16">16</option>
                                                    <option value="17">17</option>
                                                    <option value="18">18</option>
                                                    <option value="19">19</option>
                                                    <option value="20">20</option>
                                                    <option value="21">21</option>
                                                    <option value="22">22</option>
                                                    <option value="23">23</option>
                                                    <option value="24">24</option>
                                                    <option value="25">25</option>
                                                    <option value="26">26</option>
                                                    <option value="27">27</option>
                                                    <option value="28">28</option>
                                                    <option value="29">29</option>
                                                    <option value="30">30</option>
                                                    <option value="31">31</option>
                                                </select>
                                            </span>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <span>
                                                <select aria-label="Month" name="birthday_month" id="month" title="Month" class="calDoB">
                                                    <option value="1">Jan</option>
                                                    <option value="2">Feb</option>
                                                    <option value="3">Mar</option>
                                                    <option value="4">Apr</option>
                                                    <option value="5">May</option>
                                                    <option value="6">Jun</option>
                                                    <option value="7">Jul</option>
                                                    <option value="8">Aug</option>
                                                    <option value="9">Sep</option>
                                                    <option value="10">Oct</option>
                                                    <option value="11">Nov</option>
                                                    <option value="12">Dec</option>
                                                </select>
                                            </span>
                                        </div>
                                        <div class="form-group col-lg-4">
                                            <span>
                                                <select aria-label="Year" name="birthday_year" id="year" title="Year" class="calDoB">
                                                    <option value="2022">2022</option>
                                                    <option value="2021">2021</option>
                                                    <option value="2020">2020</option>
                                                    <option value="2019">2019</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2017">2017</option>
                                                    <option value="2016">2016</option>
                                                    <option value="2015">2015</option>
                                                    <option value="2014">2014</option>
                                                    <option value="2013">2013</option>
                                                    <option value="2012">2012</option>
                                                    <option value="2011">2011</option>
                                                    <option value="2010">2010</option>
                                                    <option value="2009">2009</option>
                                                    <option value="2008">2008</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2002">2002</option>
                                                    <option value="2001">2001</option>
                                                    <option value="2000">2000</option>
                                                    <option value="1999">1999</option>
                                                    <option value="1998">1998</option>
                                                    <option value="1997">1997</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1994">1994</option>
                                                    <option value="1993">1993</option>
                                                    <option value="1992">1992</option>
                                                    <option value="1991">1991</option>
                                                    <option value="1990">1990</option>
                                                    <option value="1989">1989</option>
                                                    <option value="1988">1988</option>
                                                    <option value="1987">1987</option>
                                                    <option value="1986">1986</option>
                                                    <option value="1985">1985</option>
                                                    <option value="1984">1984</option>
                                                    <option value="1983">1983</option>
                                                    <option value="1982">1982</option>
                                                    <option value="1981">1981</option>
                                                    <option value="1980">1980</option>
                                                    <option value="1979">1979</option>
                                                    <option value="1978">1978</option>
                                                    <option value="1977">1977</option>
                                                    <option value="1976">1976</option>
                                                    <option value="1975">1975</option>
                                                    <option value="1974">1974</option>
                                                    <option value="1973">1973</option>
                                                    <option value="1972">1972</option>
                                                    <option value="1971">1971</option>
                                                    <option value="1970">1970</option>
                                                    <option value="1969">1969</option>
                                                    <option value="1968">1968</option>
                                                    <option value="1967">1967</option>
                                                    <option value="1966">1966</option>
                                                    <option value="1965">1965</option>
                                                    <option value="1964">1964</option>
                                                    <option value="1963">1963</option>
                                                    <option value="1962">1962</option>
                                                    <option value="1961">1961</option>
                                                    <option value="1960">1960</option>
                                                    <option value="1959">1959</option>
                                                    <option value="1958">1958</option>
                                                    <option value="1957">1957</option>
                                                    <option value="1956">1956</option>
                                                    <option value="1955">1955</option>
                                                    <option value="1954">1954</option>
                                                    <option value="1953">1953</option>
                                                    <option value="1952">1952</option>
                                                    <option value="1951">1951</option>
                                                    <option value="1950">1950</option>
                                                    <option value="1949">1949</option>
                                                    <option value="1948">1948</option>
                                                    <option value="1947">1947</option>
                                                    <option value="1946">1946</option>
                                                    <option value="1945">1945</option>
                                                    <option value="1944">1944</option>
                                                    <option value="1943">1943</option>
                                                    <option value="1942">1942</option>
                                                    <option value="1941">1941</option>
                                                    <option value="1940">1940</option>
                                                    <option value="1939">1939</option>
                                                    <option value="1938">1938</option>
                                                    <option value="1937">1937</option>
                                                    <option value="1936">1936</option>
                                                    <option value="1935">1935</option>
                                                    <option value="1934">1934</option>
                                                    <option value="1933">1933</option>
                                                    <option value="1932">1932</option>
                                                    <option value="1931">1931</option>
                                                    <option value="1930">1930</option>
                                                    <option value="1929">1929</option>
                                                    <option value="1928">1928</option>
                                                    <option value="1927">1927</option>
                                                    <option value="1926">1926</option>
                                                    <option value="1925">1925</option>
                                                    <option value="1924">1924</option>
                                                    <option value="1923">1923</option>
                                                    <option value="1922">1922</option>
                                                    <option value="1921">1921</option>
                                                    <option value="1920">1920</option>
                                                    <option value="1919">1919</option>
                                                    <option value="1918">1918</option>
                                                    <option value="1917">1917</option>
                                                    <option value="1916">1916</option>
                                                    <option value="1915">1915</option>
                                                    <option value="1914">1914</option>
                                                    <option value="1913">1913</option>
                                                    <option value="1912">1912</option>
                                                    <option value="1911">1911</option>
                                                    <option value="1910">1910</option>
                                                    <option value="1909">1909</option>
                                                    <option value="1908">1908</option>
                                                    <option value="1907">1907</option>
                                                    <option value="1906">1906</option>
                                                    <option value="1905">1905</option>
                                                </select>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <div class="modal-footer akk">
                                    <asp:UpdatePanel ID="uporder" runat="server">
                                        <ContentTemplate>
                                            <button type="button" id="btnSignup" onserverclick="btnSignup_ServerClick" class="btn btn-lienhe" data-dismiss="modal" runat="server">Sign Up</button>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

