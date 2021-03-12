<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RestaurantDetails.aspx.cs" Inherits="GoodFoodSystem.RestaurantDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="RESTAURANT_ID" DataSourceID="RestaurantDetailsDataSource" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="RESTAURANT_ID" HeaderText="RESTAURANT_ID" ReadOnly="True" SortExpression="RESTAURANT_ID" />
                    <asp:BoundField DataField="RESTAURANT_NAME" HeaderText="RESTAURANT_NAME" SortExpression="RESTAURANT_NAME" />
                    <asp:BoundField DataField="RESTAURANT_ADDRESS" HeaderText="RESTAURANT_ADDRESS" SortExpression="RESTAURANT_ADDRESS" />
                    <asp:BoundField DataField="RESTAURANT_CONTACT" HeaderText="RESTAURANT_CONTACT" SortExpression="RESTAURANT_CONTACT" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="RestaurantDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GoodFoodConnectionString %>" ProviderName="<%$ ConnectionStrings:GoodFoodConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;RESTAURANT&quot;"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
