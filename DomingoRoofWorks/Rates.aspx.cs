using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace DomingoRoofWorks
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //string used for connections to the database
        public string connectionString = @"Data Source=server19002721.database.windows.net;Initial Catalog=DB19002721;User ID=admin19002721;Password=7h1515MyP455;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        //call the bind method on the first page load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        //binds the grid view to the jobtype table
        private void BindGrid()
        {
            //all data in jobtype
            string query = "SELECT * FROM JOB_TYPE";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        //method for on row editing
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        //method for updating on the row
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //updates the price based on what the user inputted where the jobcard ID is on the same row
            GridViewRow row = GridView1.Rows[e.RowIndex];

            double rate = Convert.ToDouble((row.FindControl("txtDaily_Rate") as TextBox).Text);
            string jobType = (row.FindControl("lblJob_Type_ID") as Label).Text;

            string query = "UPDATE JOB_TYPE SET Daily_Rate=@Daily_Rate WHERE Job_Type_ID=@Job_Type_ID";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Job_Type_ID", jobType);
                    cmd.Parameters.AddWithValue("@Daily_Rate", rate);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        //method to cancel editting
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

    }
}