<%@ Page Title="Good Food: Online Food Order and Delivery" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GoodFoodSystem.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    body,html{
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    background: #e74c3c !important;
    }

    .searchbar{
    margin-bottom: auto;
    margin-top: auto;
    height: 60px;
    background-color: #353b48;
    border-radius: 30px;
    padding: 10px;
    }

    .search_input{
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 0;
    caret-color:transparent;
    line-height: 40px;
    transition: width 0.4s linear;
    }

    .searchbar > .search_input{
    padding: 0 10px;
    width: 450px;
    caret-color:red;
    transition: width 0.4s linear;
    }

    .searchbar > .search_icon{
    background: white;
    color: #e74c3c;
    }

    .search_icon{
    height: 40px;
    width: 40px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    color:white;
    text-decoration:none;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid w-100" style="background-color:#ececec">
        <div class="row pt-5">
            <div class="col text-center" style="font-size:45px; color: #c70e33; font-weight:bolder; font-family: serif;">
                Are You Hungry?
            </div>
        </div>
        <div class="row">
            <div class="col text-center" style="font-size:25px; font-family:'Poppins', sans-serif;">
                Order from your favourite Restaurant
            </div>
        </div>
        <div class="d-flex justify-content-center mt-3 pb-3">
            <div class="searchbar">
                <form method="GET">
	                <input class="search_input" type="text" runat="server" name="searchTxt" placeholder="Search for your favourite dish..." id="something" list="dishes">
	                <datalist id="dishes">
                        </datalist>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <option value="<%# Eval("DISH_NAME") %>" />
                            </ItemTemplate>
                        </asp:Repeater>
	                <datalist>
	                </datalist>
	                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoodFoodConnectionString %>" ProviderName="<%$ ConnectionStrings:GoodFoodConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DISH_NAME&quot; FROM &quot;DISH&quot;"></asp:SqlDataSource>

                    <button runat="server" id="btnRun" onserverclick="searchDish" class="search_icon">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
