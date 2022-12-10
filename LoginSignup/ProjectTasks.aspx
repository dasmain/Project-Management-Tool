<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTasks.aspx.cs" Inherits="LoginSignup.Project_Tasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Tasks - PMTool</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <style>
        .auto-style1 {
            margin-left: 50px;
        }

        #DropDownList1 {
            margin-left: 40px;
            margin-top: 20px;
        }

        #DropDownList2 {
            width: 130px;
        }

        body {
            font-family: "Lato", sans-serif;
        }

        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

            .sidebar a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

                .sidebar a:hover {
                    color: #f1f1f1;
                }

            .sidebar .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

        .openbtn:hover {
            background-color: #444;
        }

        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        #mainnav {
            transition: margin-left .5s;
            padding: 16px;
        }

        .forSideBar {
            background-color: transparent;
            border: none;
            color: white;
            width: 100%;
            height: 60px;
            font-size: 20px;
        }

        .Label3 {
            margin-bottom: 20px;
        }
        
        #Button7{
            margin-right: 20px;
        }
        
        #fornoti{
            margin-left: 70%;
            position: absolute;
        }


        /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
        @media screen and (max-height: 450px) {
            .sidebar {
                padding-top: 15px;
            }

                .sidebar a {
                    font-size: 18px;
                }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mainnav">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" onclick="openNav(); return false">☰ PMTool</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    </ul>
                    
                    <asp:Button ID="Button7" runat="server" Text="🔔" class="btn btn-outline-success" OnClientClick="openNoti(); return false;"/>
                    <asp:Button ID="Button2" runat="server" Text="Button" class="btn btn-outline-danger" type="submit" OnClick="Button2_Click" />
                </div>
            </div>
        </nav>
         <div id="fornoti" hidden="hidden">
            <div class="card col-lg-12">
  <div class="card-header">
    Notifications
  </div>
  <div class="card-body">
      <% for (int i = 0; i < notitext.Length; i++)
          { %>
          <%: notitext[i] %>
      <hr />
      <%} %>
  </div>
</div>
        </div>
        <div id="mySidebar" class="sidebar">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
            <asp:Button ID="Button4" runat="server" Text="Home" OnClick="BackToHome" class="forSideBar" />
            <% if (isPM || admincheck)
                { %>
            <asp:Button ID="Button1" runat="server" Text="Add New Task" class="forSideBar" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" Text="Delete a Task" class="forSideBar" OnClick="Button3_Click" />
            <asp:Button ID="Button5" runat="server" Text="Update a Task" class="forSideBar" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" Text="Add Team Members" class="forSideBar" OnClick="Button6_Click" />
            <% } %>
        </div>
        <div class="content" id="main">
            <h1 class="auto-style1">Project Tasks</h1>
            <div class="col-lg-4 px-lg-4" style="float:left;">
                <asp:DropDownList ID="DropDownList1" runat="server" class="form-select" OnSelectedIndexChanged="SetValue" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div style="float: left; margin-top: 20px; margin-left: 35px;">
                
            <asp:Button ID="Button8" runat="server" Text="Go to Chats" class="btn btn-secondary" OnClick="GoToChats"/>
            </div>
            <br />
            <br />
            <% for (int i = 0; i < taskname.Length; i++)
                {%>
            <br />
            <div class="card" style="width: 45rem; top: 4px; left: 91px;">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <div class="container-fluid">
                        <h5 class="card-title" style="color: whitesmoke;">
                            <b>
                                <%: taskid[i] %>.
                                <asp:Label ID="Label2" runat="server" Text="" Visible="false">

                                </asp:Label>
                                <%: taskname[i] %>
                            </b>
                        </h5>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                </nav>
                <div class="card-body">

                    <div class="col-lg-3 px-lg-4" style="float: left;">
                        <b>
                            <asp:Label ID="Label1" runat="server" Text="Status"></asp:Label>
                        </b>
                        <br />
                        <%: showstat[i] %>
                    </div>
                    <div class="col-lg-3 px-lg-4" style="float: left;">
                        <b>
                            <asp:Label ID="Label3" runat="server" Text="Assigned to: "></asp:Label>
                        </b>
                        <br style="margin-bottom: 20px;" />
                        <%: tuname[i] %>
                    </div>
                    <div class="col-lg-3 px-lg-4" style="float: left;">
                        <b>
                            <asp:Label ID="Label4" runat="server" Text="Priority Level:"></asp:Label>
                            <br style="margin-bottom: 20px" />
                        </b>

                        <%: priority[i] %>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <% } %>
            <br />
            <br />
        </div>

        <script>
            function openNav() {
                document.getElementById("mySidebar").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                document.getElementById("mainnav").style.marginLeft = "250px";
            }

            function closeNav() {
                document.getElementById("mySidebar").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
                document.getElementById("mainnav").style.marginLeft = "0";
            }

            function openNoti() {
                var noti = document.getElementById("fornoti").hidden;
                if (noti == true) {
                    document.getElementById("fornoti").hidden = false;
                }
                else {
                    document.getElementById("fornoti").hidden = true;
                }
            }
        </script>
    </form>
</body>
</html>
