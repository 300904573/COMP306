<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mittal_COMP306_A1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/StyleSheet.css" rel="stylesheet" />
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

        <div id="contant_area">
            <center>
                 <p>
                    <asp:Label ID="Label1" runat="server" Text="First Name :"></asp:Label>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbFname" runat="server"></asp:TextBox>
                     <%--<asp:RequiredFieldValidator runat="server" id="reqfName" controltovalidate="tbFname" errormessage="Please enter your first name!" />--%>
                 </p>
                 <p>
                    <asp:Label ID="Label2" runat="server" Text="Last Name :"></asp:Label>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbLname" runat="server"></asp:TextBox>
                     <%--  <asp:RequiredFieldValidator runat="server" id="reqLName" controltovalidate="tbLname" errormessage="Please enter your last name!" />--%>
                 </p>
                 <p>
                     <asp:Button ID="btnRemember" runat="server" OnClick="btnRemember_Click" Text="Remember Me?" />
                 </p>
                 <p>
                     <asp:Label ID="lblRemember" runat="server" Visible="False"></asp:Label>
                 </p>
                 <p>
                    <asp:Label ID="Label3" runat="server" Text="City :"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbCity" runat="server"></asp:TextBox>
                </p>
                <p>
                    <asp:Label ID="Label4" runat="server" Text="Postal Code :"></asp:Label>
                    &nbsp; &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbPcode" runat="server"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator runat="server" id="reqPcode" controltovalidate="tbPcode" errormessage="Please enter your Postal Code!" />--%>
                </p>
                <p>
                    <asp:Label ID="Label5" runat="server" Text="Phone Number :"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="tbPno" runat="server"></asp:TextBox>
                    <%-- <asp:RequiredFieldValidator runat="server" id="reqPno" controltovalidate="tbPno" errormessage="Please enter your Phone Number!" />--%>
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Text="Province :"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="tbProvince" runat="server"></asp:TextBox>
&nbsp; &nbsp;
                    <asp:DropDownList ID="ddListProvince" runat="server" OnSelectedIndexChanged="ddListProvince_SelectedIndexChanged">
                     <asp:ListItem Text="Ontario">Ontario</asp:ListItem>
                     <asp:ListItem Text="PEI">PEI</asp:ListItem>
                     <asp:ListItem Text="Alberta">Alberta</asp:ListItem>
                     <asp:ListItem Text="Nova Scotia">Nova Scotia</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="province" runat="server"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label7" runat="server" Text="Food and Drinks :"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:CheckBoxList ID="cbListFood" runat="server">
                        <asp:ListItem>Pani Puri</asp:ListItem>
                        <asp:ListItem>Paneer Masala</asp:ListItem>
                        <asp:ListItem>Palak Paneer</asp:ListItem>
                        <asp:ListItem>Bread Pakoda</asp:ListItem>
                        <asp:ListItem>Aloo Paratha</asp:ListItem>
                        <asp:ListItem>Idli</asp:ListItem>
                    </asp:CheckBoxList>
                    <%-- <asp:RequiredFieldValidator runat="server" id="reqFood" controltovalidate="cbListFood" errormessage="Please Select atleast one food!" />--%>
                 </p>
                 <p>
                     <asp:Label ID="Label8" runat="server" Text="Delivery Method :"></asp:Label>
                      &nbsp;&nbsp;
                    <asp:RadioButtonList ID="rbListMethod" runat="server">
                        <asp:ListItem>Pick Up</asp:ListItem>
                        <asp:ListItem>Delivary</asp:ListItem>
                     </asp:RadioButtonList>
                     <%--<asp:RequiredFieldValidator runat="server" id="reqMethod" controltovalidate="rbListMethod" errormessage="Please select any one delivary method!" />--%>
                 </p>
                <p>
                     <asp:Label ID="Label9" runat="server" Text="Comments :"></asp:Label>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:TextBox ID="tbComment" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
                <br />
                <p>
                    <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
                </p>
                 <p>
                     <asp:Label ID="dbSc" runat="server" Visible="False"></asp:Label>
                </p>
            </center>
        </div>
       

      <%--  <div id="sidebar">
            <img src="IMAGES/food1.jpg" />
        </div>--%>
        <div id="footer">
              <br />
            <br />

            <center>All Rights Are Reserved. </center>
       
        </div>
    
    </div>
    </form>
</body>
</html>
