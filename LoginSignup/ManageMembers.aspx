<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMembers.aspx.cs" Inherits="LoginSignup.ManageMembers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Members - PMTool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <div id="addTask">
            <div class=" page-holder d-flex align-items-center">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-lg-6 px-lg-4">
                            <h1 class="text-base text-primary text-uppercase mb-4">Manage Members</h1>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <br />
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Username" runat="server" ID="Uname"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Project ID" runat="server" ID="Pid"></asp:TextBox>

                            </div>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            <br />
                            <br />
                            <asp:Button Text="Add" CssClass="btn btn-primary" Height="50px" Width="180px" runat="server" OnClick="AddMembers" Style="margin-left: 20px;" />
                            <asp:Button Text="Delete" CssClass="btn btn-primary" Height="50px" Width="180px" runat="server" OnClick="DeleteMembers" Style="margin-left: 20px;" />
                            <br />
                            <br />

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
