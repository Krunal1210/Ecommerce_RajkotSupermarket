using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class sitemap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        System.Text.StringBuilder strxml = new System.Text.StringBuilder();
        string priorityone = "1";
        string prioritypointnine = "0.9";
        string prioritypointeight = "0.8";
        string prioritypointthree = "0.3";
        string daily = "daily";
        string weekly = "weekly";
        string monthly = "monthly";


        strxml.Append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        //strxml.Append("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">");
        //strxml.Append("<urlset xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd");
        strxml.Append("<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">");
        // for home page
        strxml.Append("<url>");
        strxml.Append("<loc>http://rajkotsupermarket.com/</loc>");
        strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
        strxml.Append("<priority>" + priorityone + "</priority>");
        strxml.Append("<changefreq>" + daily + "</changefreq>");
        strxml.Append("</url>");

        //strxml.Append("<url>");
        //strxml.Append("<loc>http://rajkotsupermarket.com/Join-Us.aspx</loc>");
        //strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
        //strxml.Append("<priority>" + prioritypointnine + "</priority>");
        //strxml.Append("<changefreq>" + monthly + "</changefreq>");
        //strxml.Append("</url>");

        

        strxml.Append("<url>");
        strxml.Append("<loc>http://rajkotsupermarket.com/Registration.aspx</loc>");
        strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
        strxml.Append("<priority>" + prioritypointnine + "</priority>");
        strxml.Append("<changefreq>" + monthly + "</changefreq>");
        strxml.Append("</url>");

        strxml.Append("<url>");
        strxml.Append("<loc>http://rajkotsupermarket.com/MyAccount.aspx</loc>");
        strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
        strxml.Append("<priority>" + prioritypointnine + "</priority>");
        strxml.Append("<changefreq>" + monthly + "</changefreq>");
        strxml.Append("</url>");

        strxml.Append("<url>");
        strxml.Append("<loc>http://rajkotsupermarket.com/MyOrder.aspx</loc>");
        strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
        strxml.Append("<priority>" + prioritypointnine + "</priority>");
        strxml.Append("<changefreq>" + monthly + "</changefreq>");
        strxml.Append("</url>");








        DataTable dtCat = sqlHelper.getDataTable("[SiteMap_MainCategoryListFront]", CommandType.StoredProcedure);


        for (int i = 0; i < dtCat.Rows.Count; i++)
        {
            strxml.Append("<url>");
            strxml.Append("<loc>http://rajkotsupermarket.com/Categories/" + dtCat.Rows[i]["DisplayUrl"] + "</loc>");
            strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
            strxml.Append("<priority>" + prioritypointeight + "</priority>");
            strxml.Append("<changefreq>" + daily + "</changefreq>");
            strxml.Append("</url>");
        }



        DataTable dtAuthr = sqlHelper.getDataTable("[SiteMap_SubCategoryListFront]", CommandType.StoredProcedure);

        for (int i = 0; i < dtAuthr.Rows.Count; i++)
        {
            strxml.Append("<url>");
            strxml.Append("<loc>http://rajkotsupermarket.com/Category/" + dtAuthr.Rows[i]["DisplayUrl"] + "</loc>");
            strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
            strxml.Append("<priority>" + prioritypointeight + "</priority>");
            strxml.Append("<changefreq>" + daily + "</changefreq>");
            strxml.Append("</url>");
        }


        DataTable dtSub = sqlHelper.getDataTable("[Sitemap_SubCategoryList]", CommandType.StoredProcedure);

        for (int i = 0; i < dtSub.Rows.Count; i++)
        {
            strxml.Append("<url>");
            strxml.Append("<loc>http://rajkotsupermarket.com/SubCategory/" + dtSub.Rows[i]["parent"] + "/" + dtSub.Rows[i]["DisplayUrl"] + "</loc>");
            strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
            strxml.Append("<priority>" + prioritypointeight + "</priority>");
            strxml.Append("<changefreq>" + daily + "</changefreq>");
            strxml.Append("</url>");
        }


       

        DataTable dtBook = sqlHelper.getDataTable("[PageListAdmin]", CommandType.StoredProcedure);

        for (int i = 0; i < dtBook.Rows.Count; i++)
        {
            strxml.Append("<url>");
            strxml.Append("<loc>http://rajkotsupermarket.com/Pages/" + dtBook.Rows[i]["strPageUrl"] + "</loc>");
            strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
            strxml.Append("<priority>" + prioritypointeight + "</priority>");
            strxml.Append("<changefreq>" + weekly + "</changefreq>");
            strxml.Append("</url>");
        }


        DataTable dtprd = sqlHelper.getDataTable("[Sitemap_productList]", CommandType.StoredProcedure);

        for (int i = 0; i < dtprd.Rows.Count; i++)
        {
            strxml.Append("<url>");
            strxml.Append("<loc>http://rajkotsupermarket.com/Product/" + dtprd.Rows[i]["ProductUrl"] + "</loc>");
            strxml.Append("<lastmod>" + System.DateTime.UtcNow.ToString("yyyy-MM-dd") + "</lastmod>");
            strxml.Append("<priority>" + prioritypointeight + "</priority>");
            strxml.Append("<changefreq>" + weekly + "</changefreq>");
            strxml.Append("</url>");
        }


        strxml.Append("</urlset>");
        Response.Write(strxml);

    }
}