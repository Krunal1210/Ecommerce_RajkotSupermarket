using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

using System.Text;

using System.Data;
using System.Data.SqlClient;

public partial class webHandler_ShoppingCartProcess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (Request.RequestType == "POST")
            {

                string strReq = Convert.ToString(Request["func"]);
                switch (strReq)
                {
                    case "Addcart":



                        AddToCart(Convert.ToInt32(Convert.ToString(Request["item"])), Convert.ToInt32(Convert.ToString(Request["qty"])));

                        Response.Write(getQuickAddedResponse(Convert.ToInt32(Convert.ToString(Request["item"]))));
                        Response.End();

                        break;
                    default:
                        break;
                }
            }

        }


    }


    #region "Functions"

    private void AddToCart(int BookId, int Qty)
    {

        SqlParameter[] spar = new SqlParameter[4];
        spar[0] = new SqlParameter("@strSessionId", app.getCurrentSession());

        spar[2] = new SqlParameter("@bintProductId", BookId);
        spar[3] = new SqlParameter("@intQty", Qty);
        spar[1] = new SqlParameter("@strIPAddr", app.GetIPAddress());

        sqlHelper.executeNonQuery("[dbo].[ShoppiingCartAllInfoAdd]", spar, CommandType.StoredProcedure);
    }

    private string getQuickAddedResponse(int bookId)
    {

        //StringBuilder strBld = new StringBuilder(string.Empty);

        //SqlParameter[] spar = new SqlParameter[1];
        //spar[0] = new SqlParameter("@strSessionId", app.getCurrentSession());

        //DataTable dt = sqlHelper.getDataTable("[dbo].[TempShopCartQuickDtl]", spar, CommandType.StoredProcedure);

        //if (dt.Rows.Count > 0)
        //{


        //    strBld.Append(@"{""totalItem"":""" + Convert.ToString(dt.Rows[0]["intTotalItem"]) + @""",""curSymbol"":""" + Convert.ToString(dt.Rows[0]["strCurSymbol"]) + @""",""TotalPrice"":""" + Convert.ToString(dt.Rows[0]["decNetPrice"]) + @"""}");



        //    //            strBld.Append(@"{""itemCount"":"""+  Convert.ToString(dt.Rows[0]["intTotalItem"]) +@""",""TotalPrice"":"""+ Convert.ToString(dt.Rows[0]["strCurSymbol"]) + " " + Convert.ToString(dt.Rows[0]["decFinalTotalPrice"]) + @"""}");

        //    //strBld.Append("<div  style='z-index:1000;position:absolute;' ><b>Item Added to your basket</b><p>You have " + Convert.ToString(dt.Rows[0]["intTotalItem"]) + " items in your basket.<br/><b>Total Cost: " + Convert.ToString(dt.Rows[0]["strCurSymbol"]) + " " + Convert.ToString(dt.Rows[0]["decFinalTotalPrice"]) + "</b></p></div>");

        //}

        //return strBld.ToString();
        StringBuilder strBld = new StringBuilder(string.Empty);

        SqlParameter[] spar = new SqlParameter[2];
        spar[0] = new SqlParameter("@bintProductId", bookId);
        spar[1] = new SqlParameter("@strSessionId", app.getCurrentSession());
        DataTable dt = sqlHelper.getDataTable("[dbo].[GetQuickProductNameById]", spar, CommandType.StoredProcedure);

        if (dt.Rows.Count > 0)
        {


            strBld.Append(@"{""totalItem"":""" + Convert.ToString(dt.Rows[0]["intTotalItem"]) + @""",""totalprice"":""" + Convert.ToString(dt.Rows[0]["totalprice"]) + @""",""ItemName"":""" + Convert.ToString(dt.Rows[0]["strProName"]) + @"""}");



            
        }

        return strBld.ToString();

    }

    #endregion

}