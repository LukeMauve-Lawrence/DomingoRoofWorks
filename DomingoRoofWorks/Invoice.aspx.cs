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
    public partial class About : Page
    {
        //string used for connections to the database
        public string connectionString = @"Data Source=server19002721.database.windows.net;Initial Catalog=DB19002721;User ID=admin19002721;Password=7h1515MyP455;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        //method that activates when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            //populates drop down list with all jobcard numbers for them to select which job they want to see the invoice for
            string query = "SELECT Job_Card_No FROM JOBCARD";
            if (DropDownList1.Items.Count == 0)
            {
                using(SqlConnection connection = new SqlConnection(connectionString))
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

        //method for when the view invoice 
        protected void ViewInvoiceButton_Click(object sender, EventArgs e)
        {
            //show all invoice information for the selected jobcard
            string jobCardNo = DropDownList1.SelectedValue.ToString();

            string invoice = "SELECT J.Job_Card_No, CONCAT(C.First_Name, ' ', C.Last_Name, ', ', A.City, ', ', A.Postal_Code, ', ', A.Street_Address, ', ', A.Suburb) AS Customer_Details, JT.Job_Type, SUBSTRING((SELECT ', ' + E.Employee_No + ' ' + E.First_Name + ' ' + E.Last_Name AS[text()] FROM EMPLOYEE E, JOBCARD_EMPLOYEE JE WHERE(E.Employee_No = JE.Employee_No) AND(JE.Job_Card_No = J.Job_Card_No) ORDER BY J.Job_Card_No FOR XML PATH('') ), 2, 1000) [Employees Allocated], SUBSTRING((SELECT ', '+ CAST(MU.Amount_Used AS VARCHAR)+' x '+ CAST(M.Material_Name AS VARCHAR)  AS[text()] FROM MATERIAL M, MATERIALS_USED MU WHERE(M.Material_ID = MU.Material_ID) AND(MU.Job_Card_No = J.Job_Card_No) ORDER BY J.Job_Card_No FOR XML PATH('')), 2, 1000) [Equipment/Materials], CONCAT('R', JT.Daily_Rate) AS Daily_Rate, J.No_of_Days, CONCAT('R', (JT.Daily_Rate* J.No_of_Days)) AS Subtotal, CONCAT('R', CAST(ROUND((((JT.Daily_Rate* J.No_of_Days) * 14) / 100), 2, 0) AS DECIMAL(18,2))) AS VAT, CONCAT('R', ((JT.Daily_Rate* J.No_of_Days) + CAST(ROUND((((JT.Daily_Rate* J.No_of_Days) * 14) / 100), 2, 0) AS DECIMAL(18,2)))) AS Total FROM JOBCARD J, CUSTOMER C, ADDRESS_INFO A, JOB_TYPE JT, ORDERS O, QUOTATION Q WHERE(A.Address_ID = C.Address_ID) AND(C.Customer_ID = Q.Customer_ID) AND(Q.Quotation_No = O.Quotation_No) AND(O.Job_Type_ID = JT.Job_Type_ID) AND(J.Orders_ID = O.Orders_ID) AND (J.Job_Card_No = '" + jobCardNo + "') ORDER BY J.Job_Card_No";

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