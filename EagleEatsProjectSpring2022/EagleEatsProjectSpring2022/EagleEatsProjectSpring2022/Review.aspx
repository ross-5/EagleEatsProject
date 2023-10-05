<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="EagleEatsProjectSpring2022.Review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>View and Delete Your Reviews</h1>
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Review_Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Review_Id" HeaderText="Review_Id" InsertVisible="False" ReadOnly="True" SortExpression="Review_Id" />
                <asp:BoundField DataField="From_Id" HeaderText="From_Id" SortExpression="From_Id" />
                <asp:BoundField DataField="To_Id" HeaderText="To_Id" SortExpression="To_Id" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT * FROM [Review]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Review_Id" DataSourceID="SqlDataSource2" Height="50px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted1" OnItemUpdated="DetailsView1_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Review_Id" HeaderText="Review_Id" InsertVisible="False" ReadOnly="True" SortExpression="Review_Id" />
                <asp:TemplateField HeaderText="From_Id" SortExpression="From_Id">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="UserName" DataValueField="User_Id" SelectedValue='<%# Bind("From_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("From_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="To_Id" SortExpression="To_Id">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="UserName" DataValueField="User_Id" SelectedValue='<%# Bind("To_Id") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="UserName" DataValueField="User_Id" SelectedValue='<%# Bind("To_Id") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("To_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                <asp:TemplateField HeaderText="Score" SortExpression="Score">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" SelectedValue='<%# Bind("Score") %>'>
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" SelectedValue='<%# Bind("Score") %>'>
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Score") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" DeleteCommand="DELETE FROM [Review] WHERE ([Review_Id] = @Review_Id)" InsertCommand="INSERT INTO [Review]([From_Id], [To_Id], [Comments], [Score]) VALUES (@From_Id, @To_Id, @Comments, @Score)" SelectCommand="SELECT * FROM [Review] WHERE (([Review_Id] = @Review_Id) AND ([From_Id] = @From_Id))" UpdateCommand="UPDATE [Review] SET [To_Id] = @To_Id, [Comments] = @Comments, [Score] = @Score WHERE([Review_Id] = @Review_Id)">
            <DeleteParameters>
                <asp:Parameter Name="Review_Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="From_Id" />
                <asp:Parameter Name="To_Id" />
                <asp:Parameter Name="Comments" />
                <asp:Parameter Name="Score" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Review_Id" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="From_Id" SessionField="U_Id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="To_Id" />
                <asp:Parameter Name="Comments" />
                <asp:Parameter Name="Score" />
                <asp:Parameter Name="Review_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [User_Id], [UserName] FROM [User] WHERE ([User_Id] = @User_Id)">
            <SelectParameters>
                <asp:SessionParameter Name="User_Id" SessionField="U_Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EagleEatsDBConnectionString %>" SelectCommand="SELECT [User_Id], [UserName] FROM [User]"></asp:SqlDataSource>

    </div>
</asp:Content>
