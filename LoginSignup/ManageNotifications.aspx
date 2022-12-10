<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageNotifications.aspx.cs" Inherits="LoginSignup.ManageNotifications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Notifications - PMTool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="addNoti">
            <div class=" page-holder d-flex align-items-center">
                <div class="container">
                    <div class="row align-items-center py-5">
                        <div class="col-lg-6 px-lg-4">
                            <h1 class="text-base text-primary text-uppercase mb-4">Add Notifications</h1>
                            <asp:Label ID="Label5" runat="server"></asp:Label>
                            <br />
                            <div class="form-group mb-4">
                            <asp:Label ID="Label1" runat="server" Text="Please enter the Project ID (Optional)"></asp:Label>
                                <asp:TextBox CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Project ID (Optional)" runat="server" ID="ProjectID" Text="NULL"></asp:TextBox>

                            </div>
                            
                            <div class="form-group mb-4">
                                <asp:TextBox required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Notification Text" runat="server" ID="NotiText"></asp:TextBox>

                            </div>
                            <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Button Text="Add Notification" CssClass="btn btn-primary" Height="50px" Width="180px" runat="server" OnClick="AddNotis" Style="margin-left: 20px;" />
                            <br />
                            <br />

                        </div>
                    </div>
                </div>

            </div>
        </div>
        </div>
    </form>
</body>
</html>
