<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupChat.aspx.cs" Inherits="LoginSignup.GroupChat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chats - PMTool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <style>
        body{
            overflow-x: hidden;
        }
        #Button1{
            width: 100px;
            margin-left: 20px;
        }
        #forscroll{
            height: 500px;
        }
        #Button3{
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mainnav">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" >PMTool</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    </ul>

                    <asp:Button ID="Button3" runat="server" Text="Go to Projects" CssClass="btn btn-outline-success" OnClick="Button3_Click"/>
                    <asp:Button ID="Button2" runat="server" Text="Button" class="btn btn-outline-danger" type="submit" OnClick="Button2_Click" />
                </div>
            </div>
        </nav>
        <br />
        <div id="mainbox">
            <div id="forchatbox" class="col-12" style="margin-bottom: 20px; margin-left: 15px;">
                <div style="height: 80%;">
                    
                <div id="forscroll" class="overflow-auto col-11" style="bottom: 0;">
                    <% for (int i = 0; i < sentby.Length; i++)
                        {
                            if (sentby[i] == username)
                            {
                                %>
                    <div class="card bg-light mb-3 col-11" style="max-width: 75rem; height:40px;">
    <p class="card-text" style="text-align:right; margin-right: 20px;"><%: messgtxt[i] %> <b>| Your Message</b></p></div>
                    <%}
    else if (sentby[i] != username)
    {%>
                        <div class="card bg-light mb-3 col-11" style="max-width: 75rem; height:40px;">
    <p class="card-text" style="text-align:left;margin-left:20px;"><b>
                        <%: sentby[i] %>: 
                        </b><%: messgtxt[i] %></p></div>
                    <%} %>
                    <%} %>
                </div>
                </div>
                <div style="margin-bottom: 20px; position:absolute; bottom: 0; width: 100%;">
                    
                <div style="float:left;" class="col-10">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter your Message"></asp:TextBox>
                </div>
                <div style="float:right;" class="col-2">
                <asp:Button ID="Button1" runat="server" Text="Send" class="btn btn-primary" OnClick="AddMessage"/>
                </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
