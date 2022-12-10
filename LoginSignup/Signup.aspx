<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="LoginSignup.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup - PMTool</title>
    <link href="Helper/css/style.default.css" rel="stylesheet" />
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class=" page-holder d-flex align-items-center">
            <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">

                        <div class="pr-lg-5">
                            <img src="Images/illustration.svg" alt="" class="img-fluid" />
                        </div>
                    </div>
                    <div class="col-lg-5 px-lg-4">
                        <h1 class="text-base text-primary text-uppercase mb-4">Signup</h1>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <br />

                        <div class="form-group mb-4">
                            <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="First Name" runat="server" ID="Fname"></asp:TextBox>

                        </div>
                        <div class="form-group mb-4">
                            <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Last Name" runat="server" ID="Lname"></asp:TextBox>

                        </div>
                        <div class="form-group mb-4">
                            <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Username" runat="server" ID="Uname"></asp:TextBox>

                        </div>
                        <div class="form-group mb-4">
                            <asp:TextBox required="true" CssClass="form-control border-`0 shadow form-control-lg text-base" placeholder="Email" runat="server" ID="mailID"></asp:TextBox>

                        </div>
                        <div class="form-group mb-4">
                            <asp:TextBox required="true" TextMode="Password" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Password" runat="server" ID="forPassword"></asp:TextBox>

                        </div>
                        <div class="form-group mb-4">
                            <asp:TextBox required="true" TextMode="Password" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Confirm Password" runat="server" ID="forConfirmPassword"></asp:TextBox>

                        </div>

                        <asp:Button Text="Sign up" CssClass="btn btn-primary" Height="50px" Width="400px" runat="server" OnClick="Unnamed7_Click" />

                        <br />
                        <br />

                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Already registered? Login!</asp:HyperLink>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
