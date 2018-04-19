<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditShifts.aspx.cs" Inherits="WebApplication1.EditShifts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Shifts</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridViewShift" runat="server" AllowPaging="True" CellPadding="0"
                      GridLines="None" AutoGenerateColumns="False" ShowFooter="True" AllowSorting="True"
                      ForeColor="#333333" PageSize="15" Width="1200px" DataKeyNames="ShiftID" HorizontalAlign="Center"
                      OnRowCancelingEdit="GridViewShift_RowCancelingEdit"
                    OnRowEditing="GridViewShift_RowEditing" OnRowUpdating="GridViewShift_RowUpdating"
                    OnRowDeleting="GridViewShift_RowDeleting" OnRowDataBound="GridViewShift_RowDataBound"
                    OnPageIndexChanging="GridViewShift_PageIndexChanging">
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
            <RowStyle HorizontalAlign="Center" Height="35px" VerticalAlign="Middle" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ShiftID" HeaderText="ShiftID" InsertVisible="False" ReadOnly="True" SortExpression="ShiftID" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="TimeIn" HeaderText="TimeIn" SortExpression="TimeIn" />
                <asp:BoundField DataField="TimeOut" HeaderText="TimeOut" SortExpression="TimeOut" />
                <asp:BoundField DataField="TimeWorked" HeaderText="TimeWorked" SortExpression="TimeWorked" />
                <asp:BoundField DataField="RoundedTimeWorked" HeaderText="RoundedTimeWorked" SortExpression="RoundedTimeWorked" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
            </Columns>
            <SelectedRowStyle ForeColor="#333333" Font-Bold="True" BackColor="#C5BBAF"></SelectedRowStyle>
            <RowStyle BackColor="#E3EAEB"></RowStyle>
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </form>
</body>
</html>
