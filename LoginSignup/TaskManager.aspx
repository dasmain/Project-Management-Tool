<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskManager.aspx.cs" Inherits="LoginSignup.TaskManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Manager - PMTool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <%if (todo == "addtask")
            { %>
        <div id="addTask">
            <div class=" page-holder d-flex align-items-center">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-lg-6 px-lg-4">
                            <h1 class="text-base text-primary text-uppercase mb-4">Add a new Task</h1>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <br />

                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Task Name" runat="server" ID="Tname"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">

                                <asp:DropDownList ID="forSetStatus" runat="server" CssClass="form-select form-select-lg shadow border-0">
                                    <asp:ListItem Value="" Selected="true" hidden="true">Set Status</asp:ListItem>
                                    <asp:ListItem Value="OnGoing"></asp:ListItem>
                                    <asp:ListItem Value="Completed"></asp:ListItem>
                                    <asp:ListItem Value="OnHold"></asp:ListItem>
                                    <asp:ListItem Value="Dropped"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Project ID" runat="server" ID="Pid"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Username of Assigned Individual" runat="server" ID="Uai"></asp:TextBox>

                            </div>

                            <div class="form-group mb-4">

                                <asp:DropDownList ID="SetPriority" runat="server" CssClass="form-select form-select-lg shadow border-0">
                                    <asp:ListItem Value="" Selected="true" hidden="true">Set Priority</asp:ListItem>
                                    <asp:ListItem Value="Low"></asp:ListItem>
                                    <asp:ListItem Value="Medium"></asp:ListItem>
                                    <asp:ListItem Value="High"></asp:ListItem>
                                    <asp:ListItem Value="Very High"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                            <asp:Button Text="Add" CssClass="btn btn-primary" Height="50px" Width="180px" runat="server" OnClick="AddTasks" Style="margin-left: 20px;" />
                            <br />
                            <br />

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%} %>
        <% if (todo == "updatetask")
            { %>
        <div id="updateTask">
            <div class=" page-holder d-flex align-items-center">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-lg-6 px-lg-4">
                            <h1 class="text-base text-primary text-uppercase mb-4">Update a Task</h1>
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                            <br />

                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Task ID" runat="server" ID="forTaskID"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Task Name" runat="server" ID="UpdateTName"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">

                                <asp:DropDownList ID="forUpdateStatus" runat="server" CssClass="form-select form-select-lg shadow border-0">
                                    <asp:ListItem Value="" Selected="true" hidden="true">Set Status</asp:ListItem>
                                    <asp:ListItem Value="OnGoing"></asp:ListItem>
                                    <asp:ListItem Value="Completed"></asp:ListItem>
                                    <asp:ListItem Value="OnHold"></asp:ListItem>
                                    <asp:ListItem Value="Dropped"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Project ID" runat="server" ID="UpdatePid"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Username of Assigned Individual" runat="server" ID="UpdateUai"></asp:TextBox>

                            </div>

                            <div class="form-group mb-4">

                                <asp:DropDownList ID="UpdatePriority" runat="server" CssClass="form-select form-select-lg shadow border-0">
                                    <asp:ListItem Value="" Selected="true" hidden="true">Set Priority</asp:ListItem>
                                    <asp:ListItem Value="Low"></asp:ListItem>
                                    <asp:ListItem Value="Medium"></asp:ListItem>
                                    <asp:ListItem Value="High"></asp:ListItem>
                                    <asp:ListItem Value="Very High"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

                            <asp:Button Text="Update" CssClass="btn btn-primary" Height="50px" Width="180px" runat="server" OnClick="UpdateTasks" Style="margin-left: 20px;" />
                            <br />
                            <br />

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%} %>
        <% if (todo == "deletetask")
            { %>
        <div id="deleteTask">
            <div class=" page-holder d-flex align-items-center">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-lg-6 px-lg-4">
                            <h1 class="text-base text-primary text-uppercase mb-4">Delete a Task</h1>
                            <asp:Label ID="Label5" runat="server"></asp:Label>
                            <br />

                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Task ID to Delete" runat="server" ID="TaskID"></asp:TextBox>

                            </div>
                            <asp:Label ID="Label6" runat="server" Text=""></asp:Label>

                            <asp:Button Text="Delete" CssClass="btn btn-primary" Height="50px" Width="180px" runat="server" OnClick="DeleteTask" Style="margin-left: 20px;" />
                            <br />
                            <br />

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%} %>
    </form>
</body>
</html>
