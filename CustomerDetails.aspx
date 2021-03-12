<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="GoodFoodSystem.CustomerDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:GridView ID="GridView1" CssClass="table table-responsive" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CUSTOMER_ID" DataSourceID="CustomerDetailsDataSource" ForeColor="#333333" GridLines="None" PageSize="5">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID" ReadOnly="True" SortExpression="CUSTOMER_ID" />
                    <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="CUSTOMER_NAME" SortExpression="CUSTOMER_NAME" />
                    <asp:BoundField DataField="CUSTOMER_CONTACT" HeaderText="CUSTOMER_CONTACT" SortExpression="CUSTOMER_CONTACT" />
                    <asp:BoundField DataField="CUSTOMER_EMAIL" HeaderText="CUSTOMER_EMAIL" SortExpression="CUSTOMER_EMAIL" />
                    <asp:BoundField DataField="TOTAL_POINTS" HeaderText="TOTAL_POINTS" SortExpression="TOTAL_POINTS" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>
<asp:SqlDataSource ID="CustomerDetailsDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GoodFoodConnectionString %>" DeleteCommand="DELETE FROM &quot;CUSTOMER&quot; WHERE &quot;CUSTOMER_ID&quot; = ? AND ((&quot;CUSTOMER_NAME&quot; = ?) OR (&quot;CUSTOMER_NAME&quot; IS NULL AND ? IS NULL)) AND ((&quot;CUSTOMER_CONTACT&quot; = ?) OR (&quot;CUSTOMER_CONTACT&quot; IS NULL AND ? IS NULL)) AND ((&quot;CUSTOMER_EMAIL&quot; = ?) OR (&quot;CUSTOMER_EMAIL&quot; IS NULL AND ? IS NULL)) AND ((&quot;TOTAL_POINTS&quot; = ?) OR (&quot;TOTAL_POINTS&quot; IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO &quot;CUSTOMER&quot; (&quot;CUSTOMER_ID&quot;, &quot;CUSTOMER_NAME&quot;, &quot;CUSTOMER_CONTACT&quot;, &quot;CUSTOMER_EMAIL&quot;, &quot;TOTAL_POINTS&quot;) VALUES (?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:GoodFoodConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUSTOMER&quot;" UpdateCommand="UPDATE &quot;CUSTOMER&quot; SET &quot;CUSTOMER_NAME&quot; = ?, &quot;CUSTOMER_CONTACT&quot; = ?, &quot;CUSTOMER_EMAIL&quot; = ?, &quot;TOTAL_POINTS&quot; = ? WHERE &quot;CUSTOMER_ID&quot; = ? AND ((&quot;CUSTOMER_NAME&quot; = ?) OR (&quot;CUSTOMER_NAME&quot; IS NULL AND ? IS NULL)) AND ((&quot;CUSTOMER_CONTACT&quot; = ?) OR (&quot;CUSTOMER_CONTACT&quot; IS NULL AND ? IS NULL)) AND ((&quot;CUSTOMER_EMAIL&quot; = ?) OR (&quot;CUSTOMER_EMAIL&quot; IS NULL AND ? IS NULL)) AND ((&quot;TOTAL_POINTS&quot; = ?) OR (&quot;TOTAL_POINTS&quot; IS NULL AND ? IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_CUSTOMER_ID" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_NAME" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_NAME" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_CONTACT" Type="Decimal" />
        <asp:Parameter Name="original_CUSTOMER_CONTACT" Type="Decimal" />
        <asp:Parameter Name="original_CUSTOMER_EMAIL" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_EMAIL" Type="String" />
        <asp:Parameter Name="original_TOTAL_POINTS" Type="Decimal" />
        <asp:Parameter Name="original_TOTAL_POINTS" Type="Decimal" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CUSTOMER_ID" Type="String" />
        <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
        <asp:Parameter Name="CUSTOMER_CONTACT" Type="Decimal" />
        <asp:Parameter Name="CUSTOMER_EMAIL" Type="String" />
        <asp:Parameter Name="TOTAL_POINTS" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
        <asp:Parameter Name="CUSTOMER_CONTACT" Type="Decimal" />
        <asp:Parameter Name="CUSTOMER_EMAIL" Type="String" />
        <asp:Parameter Name="TOTAL_POINTS" Type="Decimal" />
        <asp:Parameter Name="original_CUSTOMER_ID" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_NAME" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_NAME" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_CONTACT" Type="Decimal" />
        <asp:Parameter Name="original_CUSTOMER_CONTACT" Type="Decimal" />
        <asp:Parameter Name="original_CUSTOMER_EMAIL" Type="String" />
        <asp:Parameter Name="original_CUSTOMER_EMAIL" Type="String" />
        <asp:Parameter Name="original_TOTAL_POINTS" Type="Decimal" />
        <asp:Parameter Name="original_TOTAL_POINTS" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
