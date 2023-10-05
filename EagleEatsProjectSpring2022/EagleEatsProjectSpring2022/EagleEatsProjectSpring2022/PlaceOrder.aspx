<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="EagleEatsProjectSpring2022.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Place Your Order</h1>
    <p>Step one is to choose which route you want to take.</p>
    <p>Then select the test delivery, then create a new delivery.</p>
    <p>Then the order will be pending, the driver will need to accept or deny the route. Once this is done, the driver will then complete the delivery.</p>
    <p>Then the delivery will show up in completed deliveries, where either you pay or dispute it.</p>
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Route_Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Route_Id" HeaderText="Route_Id" InsertVisible="False" ReadOnly="True" SortExpression="Route_Id" />
                <asp:BoundField DataField="Sender_Id" HeaderText="Sender_Id" SortExpression="Sender_Id" />
                <asp:BoundField DataField="Object_Id" HeaderText="Object_Id" SortExpression="Object_Id" />
                <asp:BoundField DataField="FromLocation" HeaderText="FromLocation" SortExpression="FromLocation" />
                <asp:BoundField DataField="ToLocation" HeaderText="ToLocation" SortExpression="ToLocation" />
                <asp:BoundField DataField="BeginTime" HeaderText="BeginTime" SortExpression="BeginTime" />
                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                <asp:BoundField DataField="RouteCost" HeaderText="RouteCost" SortExpression="RouteCost" />
                <asp:BoundField DataField="RouteDistance" HeaderText="RouteDistance" SortExpression="RouteDistance" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Route] WHERE ([Sender_Id] &lt;&gt; @Sender_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="Sender_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Delivery] WHERE ([DeliveryStatus] = @DeliveryStatus)">
            <SelectParameters>
                <asp:Parameter DefaultValue="test" Name="DeliveryStatus" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Delivery_Id" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="Delivery_Id" HeaderText="Delivery_Id" InsertVisible="False" ReadOnly="True" SortExpression="Delivery_Id" />
                <asp:TemplateField HeaderText="Route_Id" SortExpression="Route_Id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Route_Id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="Route_Id" DataValueField="Route_Id" SelectedValue='<%# Bind("Route_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Route_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Driver_Id" SortExpression="Driver_Id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Driver_Id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource5" DataTextField="Sender_Id" DataValueField="Sender_Id" SelectedValue='<%# Bind("Driver_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Driver_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reciever_Id" SortExpression="Reciever_Id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Reciever_Id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource6" DataTextField="UserName" DataValueField="User_Id" SelectedValue='<%# Bind("Reciever_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Reciever_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TotalCost" SortExpression="TotalCost">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TotalCost") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource7" DataTextField="RouteCost" DataValueField="RouteCost" SelectedValue='<%# Bind("TotalCost") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("TotalCost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DeliveryStatus" SortExpression="DeliveryStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("DeliveryStatus") %>'>
                            <asp:ListItem>Pending</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DeliveryStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" InsertCommand="INSERT INTO [Delivery]([Route_Id], [Driver_Id], [Reciever_Id], [TotalCost], [DeliveryStatus]) VALUES (@Route_Id, @Driver_Id, @Reciever_Id, @TotalCost, @DeliveryStatus)" SelectCommand="SELECT * FROM [Delivery] WHERE ([Delivery_Id] = @Delivery_Id)">
            <InsertParameters>
                <asp:Parameter Name="Route_Id" />
                <asp:Parameter Name="Driver_Id" />
                <asp:Parameter Name="Reciever_Id" />
                <asp:Parameter Name="TotalCost" />
                <asp:Parameter Name="DeliveryStatus" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="Delivery_Id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [Route_Id] FROM [Route] WHERE ([Route_Id] = @Route_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Route_Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [Sender_Id] FROM [Route] WHERE ([Route_Id] = @Route_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Route_Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [UserName], [User_Id] FROM [User] WHERE ([User_Id] = @User_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="User_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT RouteCost FROM Route WHERE (Route_Id = @Route_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Route_Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />

    </div>
</asp:Content>
