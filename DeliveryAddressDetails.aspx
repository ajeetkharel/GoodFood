<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeliveryAddressDetails.aspx.cs" Inherits="GoodFoodSystem.DeliveryAddressDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="GridView1" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="DELIVERY_ADDRESS_ID" DataSourceID="LoyalityPointsDataSource" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="DELIVERY_ADDRESS_ID" HeaderText="DELIVERY_ADDRESS_ID" ReadOnly="True" SortExpression="DELIVERY_ADDRESS_ID" />
                    <asp:BoundField DataField="LOCATION_NAME" HeaderText="LOCATION_NAME" SortExpression="LOCATION_NAME" />
                    <asp:BoundField DataField="LATITUDE" HeaderText="LATITUDE" SortExpression="LATITUDE" />
                    <asp:BoundField DataField="LONGITUDE" HeaderText="LONGITUDE" SortExpression="LONGITUDE" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="LoyalityPointsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GoodFoodConnectionString %>" ProviderName="<%$ ConnectionStrings:GoodFoodConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DELIVERY_ADDRESS&quot;"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
