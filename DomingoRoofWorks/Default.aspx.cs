using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DomingoRoofWorks
{
    public partial class _Default : Page
    {
        //string used for connections to the database
        public string connectionString = @"Data Source=server19002721.database.windows.net;Initial Catalog=DB19002721;User ID=admin19002721;Password=7h1515MyP455;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        //activates when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            //populates the dropdown list with all the different jobcards for the user to choose which one they would like to see
            string query = "SELECT Job_Card_No FROM JOBCARD";
            if (DropDownList1.Items.Count == 0)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand findcities = new SqlCommand(query, connection);
                    SqlDataReader reader = findcities.ExecuteReader();

                    while (reader.Read())
                    {
                        DropDownList1.Items.Add(reader.GetString(0));
                    }
                    reader.Close();
                    connection.Close();
                }
            }
        }

        //activates when the view invoice button is clicked
        protected void ViewInvoiceButton_Click(object sender, EventArgs e)
        {
            //when the button is clicked, fill the Grid View with the all the jobcard info for the specified jobcard
            string jobCardNo = DropDownList1.SelectedValue.ToString();

            string invoice = "SELECT * FROM JOBCARD WHERE Job_Card_No='" + jobCardNo + "'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(invoice, connectionString);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
                connection.Close();
            }
        }
    }
}