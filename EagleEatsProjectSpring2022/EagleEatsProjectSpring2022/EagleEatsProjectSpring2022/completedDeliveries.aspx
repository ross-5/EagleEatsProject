<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="completedDeliveries.aspx.cs" Inherits="EagleEatsProjectSpring2022.completedDeliveries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Completed Orders</h1>
    <p>Here you can view all denied orders, as well as either pay or dispute a completed order</p>
    <h3>Denied Orders</h3>
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:BoundField DataField="Route_Id" HeaderText="Route_Id" SortExpression="Route_Id" />
                <asp:BoundField DataField="Driver_Id" HeaderText="Driver_Id" SortExpression="Driver_Id" />
                <asp:BoundField DataField="Reciever_Id" HeaderText="Reciever_Id" SortExpression="Reciever_Id" />
                <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
                <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Delivery] WHERE (([Reciever_Id] = @Reciever_Id) AND ([DeliveryStatus] = @DeliveryStatus))">
            <SelectParameters>
                <asp:SessionParameter Name="Reciever_Id" SessionField="U_Id" Type="Int32" />
                <asp:Parameter DefaultValue="denied" Name="DeliveryStatus" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <h3>Completed Orders</h3>
    <div>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:BoundField DataField="Route_Id" HeaderText="Route_Id" SortExpression="Route_Id" />
                <asp:BoundField DataField="Driver_Id" HeaderText="Driver_Id" SortExpression="Driver_Id" />
                <asp:BoundField DataField="Reciever_Id" HeaderText="Reciever_Id" SortExpression="Reciever_Id" />
                <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
                <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Delivery] WHERE (([Reciever_Id] = @Reciever_Id) AND ([DeliveryStatus] = @DeliveryStatus))">
            <SelectParameters>
                <asp:SessionParameter Name="Reciever_Id" SessionField="U_Id" Type="Int32" />
                <asp:Parameter DefaultValue="confirmed" Name="DeliveryStatus" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource3" Height="50px" OnItemUpdated="DetailsView1_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [Delivery_Id], [DeliveryStatus] FROM [Delivery] WHERE ([Delivery_Id] = @Delivery_Id)" UpdateCommand="UPDATE [Delivery] SET [DeliveryStatus] = @DeliveryStatus WHERE([Delivery_Id] = @Delivery_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="Delivery_Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DeliveryStatus" />
                <asp:Parameter Name="Delivery_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
    <h3>Paid Orders</h3>
    <div>

        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:BoundField DataField="Route_Id" HeaderText="Route_Id" SortExpression="Route_Id" />
                <asp:BoundField DataField="Driver_Id" HeaderText="Driver_Id" SortExpression="Driver_Id" />
                <asp:BoundField DataField="Reciever_Id" HeaderText="Reciever_Id" SortExpression="Reciever_Id" />
                <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
                <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Delivery] WHERE (([Reciever_Id] = @Reciever_Id) AND ([DeliveryStatus] = @DeliveryStatus))">
            <SelectParameters>
                <asp:SessionParameter Name="Reciever_Id" SessionField="U_Id" Type="Int32" />
                <asp:Parameter DefaultValue="paid" Name="DeliveryStatus" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <h3>Disputed Orders</h3>
    <div>

        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:BoundField DataField="Route_Id" HeaderText="Route_Id" SortExpression="Route_Id" />
                <asp:BoundField DataField="Driver_Id" HeaderText="Driver_Id" SortExpression="Driver_Id" />
                <asp:BoundField DataField="Reciever_Id" HeaderText="Reciever_Id" SortExpression="Reciever_Id" />
                <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
                <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Delivery] WHERE (([DeliveryStatus] = @DeliveryStatus) AND ([Reciever_Id] = @Reciever_Id))">
            <SelectParameters>
                <asp:Parameter DefaultValue="dispute" Name="DeliveryStatus" Type="String" />
                <asp:SessionParameter Name="Reciever_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
