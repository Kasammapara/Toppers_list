<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students_List.aspx.cs" Inherits="KJSCSC_Exam.Students_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <fieldset>
        <div>
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Labelclass" runat="server" Font-Bold="True" Text="Class"></asp:Label>
&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownListclass" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="151px"  AutoPostBack="True">
                <asp:ListItem Value="0">--Select--</asp:ListItem>
                <asp:ListItem Value="1">F.Y</asp:ListItem>
                <asp:ListItem Value="2">S.Y</asp:ListItem>
                <asp:ListItem Value="3">T.Y</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;
            <asp:Label ID="Labelstream" runat="server" Font-Bold="True" Text="Stream"></asp:Label>
&nbsp;:
            <asp:DropDownList ID="DropDownListstream" runat="server" Height="23px" Width="181px"  >
               
            </asp:DropDownList>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Labelsemester" runat="server" Font-Bold="True" Text="Semester"></asp:Label>
&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:DropDownList ID="DropDownListsemester" runat="server" Height="23px" Width="181px">
                <asp:ListItem Value="0">--Select--</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Labelmonth" runat="server" Font-Bold="True" Text="Month &amp; Year"></asp:Label>
            &nbsp;:&nbsp;&nbsp;<asp:DropDownList ID="DropDownListyrs" runat="server" Height="22px" Width="157px" OnSelectedIndexChanged="DropDownListyrs_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;
            <asp:Label ID="Labelcombo" runat="server" Font-Bold="True" Text="Combination"></asp:Label>
&nbsp;:&nbsp;
            <asp:DropDownList ID="DropDownListcombo" runat="server" Height="23px" Width="181px">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Buttonsubmit" runat="server" Height="51px" Text="Button" Width="168px" OnClick="Buttonsubmit_Click"   />
        </div>
            </fieldset>
    <p>
&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Comb_Code" HeaderText="Comb_Code" SortExpression="Comb_Code" />
                <asp:BoundField DataField="Comb_Title" HeaderText="Comb_Title" SortExpression="Comb_Title" />
                <asp:BoundField DataField="St_Cmb_ID" HeaderText="St_Cmb_ID" InsertVisible="False" ReadOnly="True" SortExpression="St_Cmb_ID" />
                <asp:BoundField DataField="Roll_No" HeaderText="Roll_No" SortExpression="Roll_No" />
                <asp:BoundField DataField="Comb_Code1" HeaderText="Comb_Code1" SortExpression="Comb_Code1" />
                <asp:BoundField DataField="St_Cmb_ID1" HeaderText="St_Cmb_ID1" SortExpression="St_Cmb_ID1" />
                <asp:BoundField DataField="Seat_No" HeaderText="Seat_No" SortExpression="Seat_No" />
                <asp:BoundField DataField="Total_Marks" HeaderText="Total_Marks" SortExpression="Total_Marks" />
                <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                <asp:BoundField DataField="Pointer" HeaderText="Pointer" SortExpression="Pointer" />
                <asp:BoundField DataField="Outof100" HeaderText="Outof100" SortExpression="Outof100" />
                <asp:BoundField DataField="MnthYear" HeaderText="MnthYear" SortExpression="MnthYear" />
            </Columns>
        </asp:GridView>
    </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KJSCSC_EXAM_AIDEDConnectionString %>" SelectCommand="SELECT [KJSCSC_EXAM_AIDED].[dbo].[Course_Combination].Comb_Code,[KJSCSC_EXAM_AIDED].[dbo].[Course_Combination].[Comb_Title],
[KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].[St_Cmb_ID],[KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].[Roll_No],[KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].[Comb_Code],
[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].[St_Cmb_ID],[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].[Seat_No],[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].[Total_Marks],
[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].[Grade],[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].[Pointer],[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].[Outof100],[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].MnthYear
FROM [KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map] 
INNER JOIN [KJSCSC_EXAM_AIDED].[dbo].[Course_Combination] ON [KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].Comb_Code = [KJSCSC_EXAM_AIDED].[dbo].[Course_Combination].[Comb_Code]
INNER JOIN [KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList] ON  [KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].St_Cmb_ID = [KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].St_Cmb_ID
 WHERE ([Comb_Title] = @Comb_Title) AND ([MnthYear] = @MnthYear) ;

">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownListcombo" Name="Comb_Title" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownListyrs" Name="MnthYear" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Exporttoexcel" runat="server" OnClick="Exporttoexcel_Click" Text="Export to Excel" />
&nbsp;<asp:Button ID="Exporttoword" runat="server" OnClick="Exporttoword_Click" Text="Export to Word" />
    </form>
    </body>
</html>
