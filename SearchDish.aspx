<%@ Page Title="Search Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchDish.aspx.cs" Inherits="GoodFoodSystem.SearchDish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="input-group mt-3">
        <input class="form-control" type="text" runat="server" name="searchTxt" placeholder="Search..." id="something" list="dishes">
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
        <div class="input-group-append">
            <button runat="server" id="btnRun" onserverclick="searchDish" class="btn btn-outline-secondary" type="button" aria-expanded="undefined">Search</button>
        </div>
    </div>
    <asp:GridView CssClass="table table-responsive mt-3" ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
</asp:Content>
