<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateProject.aspx.cs" Inherits="LoginSignup.CreateProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Creation - PMTool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <style>
        #newproject {
            margin-left: 500px;
            margin-top: 110px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="newproject">
            <div class=" page-holder d-flex align-items-center">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-lg-6 px-lg-4">
                            <h1 class="text-base text-primary text-uppercase mb-4">Add new Project</h1>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <br />

                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Project Name" runat="server" ID="Pname"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">

                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Project Description" runat="server" ID="PDesc"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Project Code" runat="server" ID="PCode"></asp:TextBox>

                            </div>
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-`0 shadow form-control-lg text-base" placeholder="Username of Project Manager" runat="server" ID="Upm"></asp:TextBox>

                            </div>

                            <asp:Button Text="Add" CssClass="btn btn-primary btn-lg" Height="50px" Width="90%" runat="server" OnClick="Unnamed7_Click" Style="margin-left: 20px;" />
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
