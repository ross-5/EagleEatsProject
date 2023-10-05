<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PayMethod.aspx.cs" Inherits="EagleEatsProjectSpring2022.PayMethod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>View And Edit Your Payment Methods Here</h1>
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PaymentMethod_Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="PaymentMethod_Id" HeaderText="PaymentMethod_Id" InsertVisible="False" ReadOnly="True" SortExpression="PaymentMethod_Id" />
                <asp:BoundField DataField="User_Id" HeaderText="User_Id" SortExpression="User_Id" />
                <asp:BoundField DataField="InformationHash" HeaderText="InformationHash" SortExpression="InformationHash" />
                <asp:BoundField DataField="Provider" HeaderText="Provider" SortExpression="Provider" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [PaymentMethod] WHERE ([User_Id] = @User_Id)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="User_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="PaymentMethod_Id" DataSourceID="SqlDataSource2" Height="50px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="PaymentMethod_Id" HeaderText="PaymentMethod_Id" InsertVisible="False" ReadOnly="True" SortExpression="PaymentMethod_Id" />
                <asp:TemplateField HeaderText="User_Id" SortExpression="User_Id">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="UserName" DataValueField="User_Id" SelectedValue='<%# Bind("User_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="InformationHash" HeaderText="InformationHash" SortExpression="InformationHash" />
                <asp:BoundField DataField="Provider" HeaderText="Provider" SortExpression="Provider" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" DeleteCommand="DELETE FROM [PaymentMethod] WHERE ([PaymentMethod_Id] = @PaymentMethod_Id)" InsertCommand="INSERT INTO [PaymentMethod]([User_Id], [InformationHash], [Provider]) VALUES (@User_Id, @InformationHash, @Provider)" SelectCommand="SELECT * FROM [PaymentMethod] WHERE ([PaymentMethod_Id] = @PaymentMethod_Id)" UpdateCommand="UPDATE [PaymentMethod] SET [InformationHash] = @InformationHash, [Provider] = @Provider WHERE([PaymentMethod_Id] = @PaymentMethod_Id)">
            <DeleteParameters>
                <asp:Parameter Name="PaymentMethod_Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_Id" />
                <asp:Parameter Name="InformationHash" />
                <asp:Parameter Name="Provider" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="PaymentMethod_Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="InformationHash" />
                <asp:Parameter Name="Provider" />
                <asp:Parameter Name="PaymentMethod_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [User_Id], [UserName] FROM [User] WHERE ([User_Id] = @User_Id)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="User_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
