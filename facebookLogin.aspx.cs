using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


using facebook;
using facebook.web;

using ImpactWorks;
using FacebookUserImport.Facebook;
using ImpactWorks.FBGraph.Core;
using System.Collections.Generic;


using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!loginclass.isClientLogin())
        {

            //Setting up the facebook object
            ImpactWorks.FBGraph.Connector.Facebook facebook = new ImpactWorks.FBGraph.Connector.Facebook();
            facebook.AppID = "892245834140464";
            facebook.CallBackURL = "http://rajkotsupermarket.com/facebooklogin.aspx"; //Please update port number as per your configuration
            facebook.Secret = "6c51849f53801cf25bf80b2a04401790";


            //Setting up the permissions
            List<FBPermissions> permissions = new List<FBPermissions> {
             FBPermissions.email
        };

            //Pass the permissions object to facebook instance
            facebook.Permissions = permissions;

            if (String.IsNullOrEmpty(Request.QueryString["code"]))
            {
                String authLink = facebook.GetAuthorizationLink();
                Response.Redirect(authLink);
            }
            else
            {
                //Get the code returned by facebook
                string Code = Request.QueryString["code"];

                //process code for auth token
                facebook.GetAccessToken(Code);

                //Get User info
                FBUser currentUser = facebook.GetLoggedInUserInfo();
                string passwod = "";
                string email = currentUser.email;
                string fname = currentUser.first_name;
                string lname = currentUser.last_name;
                string addres = Convert.ToString(currentUser.hometown);
                 passwod = Convert.ToString(GetRandomPassword());



                SqlParameter[] spar = new SqlParameter[6];
                spar[0] = new SqlParameter("@strEmailAddress", email);
                spar[1] = new SqlParameter("@StrPassword", passwod);
                spar[2] = new SqlParameter("@strFirstName", fname);
                spar[3] = new SqlParameter("@strAddress", addres);
                spar[4] = new SqlParameter("@intRetVal", 0);
                spar[4].Direction = ParameterDirection.Output;
                spar[5] = new SqlParameter("@strLastName", lname);

                sqlHelper.executeNonQuery("[dbo].[UserCreate]", spar, CommandType.StoredProcedure);

                if (Convert.ToString(spar[4].Value) == "0")
                {
                    try
                    {
                        SqlParameter[] spar1 = new SqlParameter[5];
                        spar1[0] = new SqlParameter("@UserEmail", email);
                        DataTable dt = sqlHelper.getDataTable("[GetPaasswordByEmail]", spar1, CommandType.StoredProcedure);
                        passwod = Convert.ToString(dt.Rows[0]["strPassword"]);
                    }
                    catch (Exception)
                    {
                        
                       
                    }
                   

                  
                }
                else
                {

                    string strMsg, strSubject = "";
                    strMsg = app.getEmailTemplate("Registration", ref strSubject);

                    strMsg = strMsg.Replace("[[Name]]", fname);
                    strMsg = strMsg.Replace("[[UserName]]", email);

                    strMsg = strMsg.Replace("[[Password]]", passwod);
                    // SendMailNew(txtEmailAddrRegis.Text.Trim(), "shrikant@whitepearl.biz", strMsg, "BooksForYou - Registration Confirmation");
                    string cc = "shrikant@whitepearl.biz";
                    // SendMailNewcs(Convert.ToString(dt.Rows[0]["UserEmail"]), cc, "BooksForYou - Password Recovery", strMsg);
                    //SendMailNewcs(email, cc, "Rajkot Supermarket - Registration Confirmation", strMsg);
                    app.SendMail(email, "Rajkot Supermarket - Registration Confirmation", strMsg);
                }

                loginclass.getCustomerLogin(email, passwod,true);


                Response.Redirect("http://rajkotsupermarket.com/Checkout.aspx");
                #region "Get Parameters start"

                //lblAbout.Text = currentUser.about;
                //lblBio.Text = currentUser.Bio;

                //try
                //{
                //    lblBirthday.Text = Convert.ToString(currentUser.birthday);

                //}
                //catch (Exception)
                //{
                //}
                //try
                //{
                //    lblEducation.Text = Convert.ToString(currentUser.education);
                //}
                //catch (Exception)
                //{
                //}

                //lblEmail.Text = currentUser.email;
                //lblFName.Text = currentUser.first_name;
                //lblGender.Text = currentUser.gender;
                //try
                //{
                //    lblHometown.Text = Convert.ToString(currentUser.hometown);

                //}
                //catch (Exception)
                //{
                //}
                //try
                //{
                //    lblID.Text = Convert.ToString(currentUser.id);

                //}
                //catch (Exception)
                //{
                //}
                //lblLName.Text = currentUser.last_name;
                //lblLink.Text = currentUser.link;
                //try
                //{
                //    lblLocation.Text = Convert.ToString(currentUser.location);

                //}
                //catch (Exception)
                //{
                //}
                //lblMessage.Text = currentUser.message;
                //lblName.Text = currentUser.name;
                //lblPolitical.Text = currentUser.Political;
                //lblReligion.Text = currentUser.religion;
                //try
                //{
                //    lblWork.Text = Convert.ToString(currentUser.work);

                //}
                //catch (Exception)
                //{
                //}
                #endregion





                //check user status ends

            }

        }
        else
        {
            Response.Redirect("http://rajkotsupermarket.com/Checkout.aspx");
        }


    }

    
    private void LoginToAcc(string username)
    {
        FormsAuthentication.Initialize();
        string strRole = "buyers";
        //'The AddMinutes determines how long the user will be logged in after leaving
        //'the site if he doesn't log off.
        string strusername = username;
        FormsAuthenticationTicket fat = new FormsAuthenticationTicket(1, strusername, DateTime.Now, DateTime.Now.AddMinutes(60), false, strRole, FormsAuthentication.FormsCookiePath);
        Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(fat)));

        //Response.Redirect(FormsAuthentication.GetRedirectUrl(strusername, false));

        Response.Redirect("Default.aspx");
    }

    public string GetRandomPassword()
    {
        Random rand = new Random();
        StringBuilder newpassword = new StringBuilder("");

        for (int index = 1; index <= 4; index++)
        {
            newpassword.Append((char)rand.Next(65, 90));
        }

        for (int index = 0; index < 3; index++)
        {
            newpassword.Insert(rand.Next(0, 3 + index), Convert.ToString(rand.Next(0, 9)));
        }

        return newpassword.ToString();
    }


}