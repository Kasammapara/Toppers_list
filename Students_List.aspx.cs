using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace KJSCSC_Exam
{
    public partial class Students_List : System.Web.UI.Page
    {
        string ctstream,ctclass;
        protected void Page_Load(object sender, EventArgs e)
        {
            string con1 = WebConfigurationManager.ConnectionStrings["Cms"].ConnectionString;
            using (SqlConnection con = new SqlConnection(con1))
            {
                SqlCommand cmd = new SqlCommand("Select [Exam_MnthYear] From Examination", con);
                con.Open();

                DropDownListyrs.DataSource = cmd.ExecuteReader();
                DropDownListyrs.DataTextField = "Exam_MnthYear";
                DropDownListyrs.DataBind();
                DropDownListyrs.Items.Insert(0, "--Select--");
                con.Close();


                SqlCommand cmd1 = new SqlCommand("Select Code,Value From GenSettings Where Head = 'Stream'", con);
                con.Open();

                DropDownListstream.DataSource = cmd1.ExecuteReader();
                DropDownListstream.DataTextField = "Code";
                DropDownListstream.DataValueField = "Value";
                DropDownListstream.DataBind();
                DropDownListstream.Items.Insert(0, "--Select--");
                con.Close();

            }
        }
        
        string con2 = WebConfigurationManager.ConnectionStrings["Cms"].ConnectionString;

        protected void DropDownListyrs_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownListcombo.Items.Clear();
            DropDownListcombo.Items.Insert(0, "Select");
            try
            {

                SqlConnection conn = new SqlConnection(con2);

                conn.Open();
                {
                    string combquery = "Select [KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].Semester,[KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].MnthYear,[KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].Stream,[KJSCSC_EXAM_AIDED].[dbo].[Course_Combination].Comb_Title,[KJSCSC_EXAM_AIDED].[dbo].[Course_Combination].Core_Course from [KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList]  INNER JOIN [KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map] ON [KJSCSC_EXAM_AIDED].[dbo].[Student_MarkList].St_Cmb_ID = [KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].St_Cmb_ID INNER JOIN [KJSCSC_EXAM_AIDED].[dbo].[Course_Combination] ON [KJSCSC_EXAM_AIDED].[dbo].[Course_Combination].Comb_Code = [KJSCSC_EXAM_AIDED].[dbo].[St_CourseComb_Map].Comb_Code WHERE ((Stream = '" + DropDownListstream.SelectedItem.Value + "') AND(Class = '" + DropDownListclass.SelectedItem.Value + "') AND (Semester = '" + DropDownListsemester.SelectedItem.Value + "') AND (MnthYear = '" + DropDownListyrs.SelectedItem.Value + "'))  ";
                    SqlDataAdapter da1 = new SqlDataAdapter(combquery, conn);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    DropDownListcombo.DataSource = dt1;
                    DropDownListcombo.DataTextField = "Comb_Title ";
                    DropDownListcombo.DataValueField = "Core_Course ";
                    DropDownListcombo.DataBind();


                }
                conn.Close();



            }
            catch (Exception)
            {
                Response.Write("<script>alert('Please contact your administrator');</script>");
            }

        }

        protected void Buttonsubmit_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            Exporttoexcel.Visible = true;   
            Exporttoword.Visible = true;    
        }

        protected void Exporttoexcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();           
            Response.AppendHeader("content-disposition", "attachment; filename=TopperList.xls");          
            Response.ContentType = "application/excel";            
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            GridView1.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }
        protected void Exporttoword_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment; filename=TopperList.doc");
            Response.ContentType = "application/word";
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            GridView1.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownListsemester.Items.Clear();

            if (DropDownListclass.SelectedValue == "1")
            {
                DropDownListsemester.Items.Insert(0, "--Select--");
                DropDownListsemester.Items.Insert(1, "1");
                DropDownListsemester.Items.Insert(2, "2");
            }

            else if (DropDownListclass.SelectedValue == "2")
            {
                DropDownListsemester.Items.Insert(0, "--Select--");
                DropDownListsemester.Items.Insert(1, "3");
                DropDownListsemester.Items.Insert(2, "4");
            }

            else if (DropDownListclass.SelectedValue == "3")
            {
                DropDownListsemester.Items.Insert(0, "--Select--");
                DropDownListsemester.Items.Insert(1, "5");
                DropDownListsemester.Items.Insert(2, "6");
            }

            else
            {
                Response.Write("not valid");
            }
        }

       
    }
    
}