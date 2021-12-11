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
    public partial class Contact : Page
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

        //method used to bind data to the grid view
        private void BindGrid()
        {
            //fills the grid view with all employee data
            string query = "SELECT * FROM EMPLOYEE";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, connection))
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

        //method to insert data into the database
        protected void Insert(object sender, EventArgs e)
        {
            //grabs the inputs and saves them to variables
            string employee_No = txtEmployee_No.Text;
            string first_Name = txtFirst_Name.Text;
            string last_Name = txtLast_Name.Text;
            string email = txtEmail.Text;
            string phone_Number = txtPhone_Number.Text;
            string address_ID = txtAddress_ID.Text;
            txtEmployee_No.Text = "";
            txtFirst_Name.Text = "";
            txtLast_Name.Text = "";
            txtEmail.Text = "";
            txtPhone_Number.Text = "";
            txtAddress_ID.Text = "";

            //insert SQL query
            string query = "INSERT INTO EMPLOYEE VALUES(@Employee_No, @First_Name, @Last_Name, @Email, @Phone_Number, @Address_ID)";

            //inserts the entered employee values into the database
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Employee_No", employee_No);
                    cmd.Parameters.AddWithValue("@First_Name", first_Name);
                    cmd.Parameters.AddWithValue("@Last_Name", last_Name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone_Number", phone_Number);
                    cmd.Parameters.AddWithValue("@Address_ID", address_ID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            //calls bind grid to update grid view
            this.BindGrid();
        }

        //method to allow for on row editing
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            //calls bind grid to update grid view
            this.BindGrid();
        }

        //method to update data entries on the table
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //saves inputs into variables to use
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string employee_No = (row.FindControl("txtEmployee_No") as TextBox).Text;
            string first_Name = (row.FindControl("txtFirst_Name") as TextBox).Text;
            string last_Name = (row.FindControl("txtLast_Name") as TextBox).Text;
            string email = (row.FindControl("txtEmail") as TextBox).Text;
            string phone_number = (row.FindControl("txtPhone_Number") as TextBox).Text;
            string address_ID = (row.FindControl("txtAddress_ID") as TextBox).Text;

            //SQL update query
            string query = "UPDATE EMPLOYEE SET Employee_No=@Employee_No, First_Name=@First_Name, Last_Name=@Last_Name, Email=@Email, Phone_Number=@Phone_Number, Address_ID=@Address_ID WHERE Employee_No=@Employee_No";
            
            //updates the database with variables
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Employee_No", employee_No);
                    cmd.Parameters.AddWithValue("@First_Name", first_Name);
                    cmd.Parameters.AddWithValue("@Last_Name", last_Name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone_Number", phone_number);
                    cmd.Parameters.AddWithValue("@Address_ID", address_ID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            //calls bind grid to update grid view
            this.BindGrid();
        }

        //method to cancel editing
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        //method to delete data
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //deletes the data for the row
            string employee_No = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            string query = "DELETE FROM EMPLOYEE WHERE Employee_No=@Employee_No";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Employee_No", employee_No);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            //calls bind grid to update grid view
            this.BindGrid();
        }

        //method to confirm if the user wants to delete employee data
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[6].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

    }
}