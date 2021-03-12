<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoyalityPointsDetails.aspx.cs" Inherits="GoodFoodSystem.LoyalityPointsDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="GridView1" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="LOYALTY_POINT_ID" DataSourceID="LoyalityPointsDataSource" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="LOYALTY_POINT_ID" HeaderText="LOYALTY_POINT_ID" ReadOnly="True" SortExpression="LOYALTY_POINT_ID" />
                    <asp:BoundField DataField="POINTS" HeaderText="POINTS" SortExpression="POINTS" />
                    <asp:BoundField DataField="LATITUDE" HeaderText="LATITUDE" SortExpression="LATITUDE" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="LoyalityPointsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GoodFoodConnectionString %>" ProviderName="<%$ ConnectionStrings:GoodFoodConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LOYALTY_POINT&quot;"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
