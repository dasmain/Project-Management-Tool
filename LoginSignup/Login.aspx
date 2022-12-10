<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginSignup.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - PMTool</title>
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
                        <h1 class="text-base text-primary text-uppercase mb-4">Login</h1>
                        <h2 class="mb-4" id="h2id">Welcome Back!</h2>

                        <div class="form-group mb-4">
                            <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Email" runat="server" ID="Uname2"></asp:TextBox>

                        </div>

                        <div class="form-group mb-4">
                            <asp:TextBox required="true" TextMode="Password" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Password" runat="server" ID="forPassword2"></asp:TextBox>

                        </div>
                        <asp:Button Text="LOGIN" CssClass="btn btn-primary" Height="50px" Width="400px" runat="server" OnClick="UserLogin" />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <br />

                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Signup.aspx">Signup/Register?</asp:HyperLink>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
