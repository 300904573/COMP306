﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;

namespace Mittal_COMP306_A1
{
    public partial class Home : System.Web.UI.Page
    {
        String str = " ";
        //define SQL connection
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["COMP306_300904573ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            //open the connection
            con.Open();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //Response.Redirect("WebForm1.aspx");
            //Define SQL command
            SqlCommand cmd;

            //for loop for selecting muiltiple items from check box
            for (int i=0; i< cbListFood.Items.Count-1; i++)
            {
                if(cbListFood.Items[i].Selected)
                {
                    if(str==" ")
                    {
                        str = cbListFood.Items[i].Text;
                    }
                    else
                    {
                        str += ", " + cbListFood.Items[i].Text;
                    }  
                } //end of if
            } //end of for

            //SQL Query
            cmd = new SqlCommand
          ("insert into DineWithUs values('" + tbFname.Text + "','" + tbLname.Text + "','" + tbCity.Text + "','" + tbPcode.Text + "','" + tbPno.Text + "','" + ddListProvince.Text + "','" + str + "','" + rbListMethod.SelectedItem.Text + "','" + tbComment.Text + "')", con);

            //execution of query
            cmd.ExecuteNonQuery();

            //close the connection
            con.Close();

            //check whether data inserted into database or not
            dbSc.Visible = true;
            dbSc.Text = "Successfull..!!";

        } //end of btn_send click event

        protected void btnRemember_Click(object sender, EventArgs e)
        {
            //define dataReader to read data from database
            SqlDataReader reader = null;

            // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["COMP306_300904573ConnectionString"].ConnectionString);

            SqlCommand selectCmd = new SqlCommand("select City,PostalCode,PhoneNumber,Province,Comments from DineWithUs where FirstName=@firstName and LastName=@lastName",con);
            selectCmd.Parameters.AddWithValue("@firstName", tbFname.Text);
            selectCmd.Parameters.AddWithValue("@lastName", tbLname.Text);

            reader = selectCmd.ExecuteReader();

            if(reader.Read())
            {
                lblRemember.Visible = true;
                lblRemember.Text = "found..!!";
                tbCity.Text = Convert.ToString(reader["City"]);
                tbPcode.Text = Convert.ToString(reader["PostalCode"]);
                tbPno.Text = Convert.ToString(reader["PhoneNumber"]);
                tbProvince.Text = Convert.ToString(reader["Province"]);
                tbComment.Text = Convert.ToString(reader["Comments"]);


                //ddListProvince.Text = Convert.ToString(reader["Province"]);
                // cbListFood.Text = Convert.ToString(reader["FoodAndDrink"]);
                //rbListMethod.Text = Convert.ToString(reader["PickupOrDelivery"]);
                //if(Convert.ToString(reader["PickupOrDelivery"])== "Pick Up")
                //{
                //    rbListMethod.Items[0].Selected = true;
                //    rbListMethod.Items[1].Selected = false;
                //}
                //else // (reader["PickupOrDelivery"].ToString() == "Delivary")
                //{
                //    rbListMethod.Items[0].Selected = false;
                //    rbListMethod.Items[1].Selected = true;
                //}

            }
            else
            {
                lblRemember.Visible = true;
                lblRemember.Text = "sorry..User Not Found..!!";
                tbCity.Text = String.Empty;
                tbPcode.Text = String.Empty;
                tbPno.Text = String.Empty;
               // ddListProvince.Text = String.Empty;
                cbListFood.Text = String.Empty;
                rbListMethod.Text = String.Empty;
                tbProvince.Text = String.Empty;
                tbComment.Text = String.Empty;
            }
        } //end of btnRemember click event

        protected void ddListProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            //for(int i=0; i<ddListProvince.Items.Count-1; i++)
            //{
            //    if (ddListProvince.Items[i].Selected)
            //    {
            //        tbProvince.Text += ddListProvince.Items[i].ToString();
            //    }
            //    else
            //    {
            //        tbProvince.Text = String.Empty;
            //    }
            //}
            this.tbProvince.Text += ddListProvince.SelectedItem.Text;
            //province.Text += ddListProvince.SelectedValue.ToString();
        }
    } // end of class

}//end of namespace