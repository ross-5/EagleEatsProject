<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="driverDeliveries.aspx.cs" Inherits="EagleEatsProjectSpring2022.driverDeliveries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pending and Accepted Deliveries</h1>
    <p>Here you can accept and then complete orders as a driver.</p>
    <div>
        <h3>Pending Orders</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource1">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Delivery] WHERE (([DeliveryStatus] = @DeliveryStatus) AND ([Driver_Id] = @Driver_Id))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="pending" Name="DeliveryStatus" Type="String" />
                    <asp:SessionParameter Name="Driver_Id" SessionField="U_Id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource2" Height="50px" OnItemUpdated="DetailsView1_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:TemplateField HeaderText="DeliveryStatus" SortExpression="DeliveryStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [Delivery_Id], [DeliveryStatus] FROM [Delivery] WHERE ([Delivery_Id] = @Delivery_Id)" UpdateCommand="UPDATE [Delivery] SET [DeliveryStatus] = @DeliveryStatus WHERE([Delivery_Id] = @Delivery_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Delivery_Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DeliveryStatus" />
                <asp:Parameter Name="Delivery_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <h3>Accepted Orders</h3>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource3">
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Delivery] WHERE (([DeliveryStatus] = @DeliveryStatus) AND ([Driver_Id] = @Driver_Id))">
            <SelectParameters>
                <asp:Parameter DefaultValue="accepted" Name="DeliveryStatus" Type="String" />
                <asp:SessionParameter Name="Driver_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource4" Height="50px" OnItemUpdated="DetailsView2_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:TemplateField HeaderText="DeliveryStatus" SortExpression="DeliveryStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [Delivery_Id], [DeliveryStatus] FROM [Delivery] WHERE ([Delivery_Id] = @Delivery_Id)" UpdateCommand="UPDATE [Delivery] SET [DeliveryStatus] = @DeliveryStatus WHERE([Delivery_Id] = @Delivery_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="Delivery_Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DeliveryStatus" />
                <asp:Parameter Name="Delivery_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
