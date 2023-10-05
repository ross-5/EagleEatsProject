<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EagleEatsProjectSpring2022.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Change Your Password</h1>
    <form id="form1" runat="server">
        <div>

            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="User_Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [User_Id], [UserName] FROM [User]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="User_Id" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
                <Fields>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Passwd" HeaderText="Passwd" SortExpression="Passwd" />
                    <asp:BoundField DataField="User_Id" HeaderText="User_Id" InsertVisible="False" ReadOnly="True" SortExpression="User_Id" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [UserName], [Passwd], [User_Id], [Address] FROM [User] WHERE ([User_Id] = @User_Id)" UpdateCommand="UPDATE [User] SET [UserName] = @UserName, [Passwd] = @Passwd, [Address] = @Address WHERE ([User_Id] = @User_Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="User_Id" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UserName" />
                    <asp:Parameter Name="Passwd" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="User_Id" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Return To Login" />

        </div>
    </form>
</body>
</html>
