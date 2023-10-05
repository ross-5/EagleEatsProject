<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DriverRoutes.aspx.cs" Inherits="EagleEatsProjectSpring2022.DriverRoutes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Routes</h1>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Route] WHERE ([Sender_Id] = @Sender_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="Sender_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Route_Id" DataSourceID="SqlDataSource2" Height="50px" OnItemDeleted="DetailsView1_ItemDeleted1" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Route_Id" HeaderText="Route_Id" InsertVisible="False" ReadOnly="True" SortExpression="Route_Id" />
                <asp:TemplateField HeaderText="Sender_Id" SortExpression="Sender_Id">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="UserName" DataValueField="User_Id" SelectedValue='<%# Bind("Sender_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Sender_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Object_Id" SortExpression="Object_Id">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="Object_Id" SelectedValue='<%# Bind("Object_Id") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="Object_Id" SelectedValue='<%# Bind("Object_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Object_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FromLocation" HeaderText="FromLocation" SortExpression="FromLocation" />
                <asp:BoundField DataField="ToLocation" HeaderText="ToLocation" SortExpression="ToLocation" />
                <asp:BoundField DataField="BeginTime" HeaderText="BeginTime" SortExpression="BeginTime" />
                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                <asp:BoundField DataField="RouteCost" HeaderText="RouteCost" SortExpression="RouteCost" />
                <asp:BoundField DataField="RouteDistance" HeaderText="RouteDistance" SortExpression="RouteDistance" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" DeleteCommand="DELETE FROM [Route] WHERE ([Route_Id] = @Route_Id)" InsertCommand="INSERT INTO [Route]([Sender_Id], [Object_Id], [FromLocation], [ToLocation], [BeginTime], [EndTime], [RouteCost], [RouteDistance]) VALUES (@Sender_Id, @Object_Id, @FromLocation, @ToLocation, @BeginTime, @EndTime, @RouteCost, @RouteDistance)" SelectCommand="SELECT * FROM [Route] WHERE ([Route_Id] = @Route_Id)" UpdateCommand="UPDATE [Route] SET [Object_Id] = @Object_Id, [FromLocation] = @FromLocation, [ToLocation] = @ToLocation, [BeginTime] = @BeginTime, [EndTime] = @EndTime, [RouteCost] = @RouteCost, [RouteDistance] = @RouteDistance WHERE([Route_Id] = @Route_Id)">
            <DeleteParameters>
                <asp:Parameter Name="Route_Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Sender_Id" />
                <asp:Parameter Name="Object_Id" />
                <asp:Parameter Name="FromLocation" />
                <asp:Parameter Name="ToLocation" />
                <asp:Parameter Name="BeginTime" />
                <asp:Parameter Name="EndTime" />
                <asp:Parameter Name="RouteCost" />
                <asp:Parameter Name="RouteDistance" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Route_Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Object_Id" />
                <asp:Parameter Name="FromLocation" />
                <asp:Parameter Name="ToLocation" />
                <asp:Parameter Name="BeginTime" />
                <asp:Parameter Name="EndTime" />
                <asp:Parameter Name="RouteCost" />
                <asp:Parameter Name="RouteDistance" />
                <asp:Parameter Name="Route_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [User_Id], [UserName] FROM [User] WHERE ([User_Id] = @User_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="User_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [Object_Id], [Name] FROM [Object]"></asp:SqlDataSource>

    </div>
</asp:Content>
