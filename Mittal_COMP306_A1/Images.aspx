<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Images.aspx.cs" Inherits="Mittal_COMP306_A1.Images" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/StyleSheetImages.css" rel="stylesheet" />
    </head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">

        <div id="banner">
            <br />
            <center> Dine With Us </center>
        </div>

        <div id="navigation">
           <center>
           <ul id="nav">
               <li><a href="#"> &nbsp;Home</a></li>
               <li><a href="Images.aspx">&nbsp;Images</a></li>
           </ul>
          </center>
       </div>

        <div id="body">
            <br />
           <%-- <asp:Label ID="Label1" runat="server" Text="Click Here Upload Image"></asp:Label>--%>
         
            
            <asp:FileUpload ID="foodImage" runat="server" />
            &nbsp; &nbsp;
            
            <asp:Button ID="BtnUpload" runat="server" Text="Upload" OnClick="BtnUpload_Click"/>
            
            <br />
            <br/>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="25px" Width="97px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="100" ControlStyle-Width="100" >
                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    </asp:ImageField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            
            <a href="https://storage.googleapis.com/comp306-a1/paniPuri1.png"><img src="https://storage.googleapis.com/comp306-a1/paniPuri1.png" height="150" width="150"/> </a>
            <a href="https://storage.googleapis.com/comp306-a1/paniPuri2.jpg"><img src="https://storage.googleapis.com/comp306-a1/paniPuri2.jpg" height="150" width="150"/> </a>
            <a href="https://storage.googleapis.com/comp306-a1/paniPuri3.gif"><img src="https://storage.googleapis.com/comp306-a1/paniPuri3.gif" height="150" width="150"/> </a>
            <a href="https://storage.googleapis.com/comp306-a1/paniPuri4.jpg"><img src="https://storage.googleapis.com/comp306-a1/paniPuri4.jpg" height="150" width="150"/> </a>
        </div>
    
    </div>
    </form>
</body>
</html>
