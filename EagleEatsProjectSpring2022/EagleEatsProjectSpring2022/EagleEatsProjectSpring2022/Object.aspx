<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Object.aspx.cs" Inherits="EagleEatsProjectSpring2022.Object" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Objects</h1>
    <div>
     
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Object_Id">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Object_Id" HeaderText="Object_Id" InsertVisible="False" ReadOnly="True" SortExpression="Object_Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Object]"></asp:SqlDataSource>
     
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Object_Id" DataSourceID="SqlDataSource2" Height="50px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Object_Id" HeaderText="Object_Id" InsertVisible="False" ReadOnly="True" SortExpression="Object_Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" DeleteCommand="DELETE FROM [Object] WHERE ([Object_Id] = @Object_Id)" InsertCommand="INSERT INTO [Object]([Name], [Note], [Description]) VALUES (@Name, @Note, @Description)" SelectCommand="SELECT * FROM [Object] WHERE ([Object_Id] = @Object_Id)" UpdateCommand="UPDATE [Object] SET [Name] = @Name, [Note] = @Note, [Description] = @Description WHERE([Object_Id] = @Object_Id)">
            <DeleteParameters>
                <asp:Parameter Name="Object_Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Note" />
                <asp:Parameter Name="Description" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Object_Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Note" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="Object_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
     
    </div>
</asp:Content>
