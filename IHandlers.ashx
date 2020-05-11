<%@ WebHandler Language="C#" Class="IHandlers" %>

using System;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

public class IHandlers : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        
         try
            {
                {
                    string strPath = context.Request.QueryString["P"];
                    string[] strData = null;
                    strData = context.Request.QueryString["D"].ToLower().Split('x');
                    string strWidth = strData[0];
                    string strHeight = strData[1];
                    string intResizeType = "1";
                    if (strData.Length > 2)
                    {
                        intResizeType = strData[2];
                    }
                    string strFilePath = context.Server.MapPath("~\\" + strPath);

                    context.Response.Clear();
                    context.Response.ContentType = "image/jpeg";
                    ResizeImageFile(strFilePath, Convert.ToInt32(strHeight), Convert.ToInt32(strWidth), Convert.ToSingle(intResizeType)).WriteTo(context.Response.OutputStream);
                    context.Response.End();
                }

            }
            catch (Exception ex)
            {
            }
       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    
    
     private MemoryStream ResizeImageFile(string strFileName, int height, int width, float intResizeType)
        {
            using (Image oldImage = System.Drawing.Image.FromFile(strFileName))
            {
                float oldwidth = oldImage.Width;
                float oldheight = oldImage.Height;

                int thumbHeight = height;
                int thumbWidth = width;

                if ((intResizeType == 1))
                {
                    if ((oldwidth > width))
                    {
                        double def = width;
                        double imgwidth = Convert.ToDouble(oldwidth);
                        double diff = (def / imgwidth);
                        thumbWidth = Convert.ToInt16(Math.Round(diff * oldwidth));
                        thumbHeight = Convert.ToInt16(Math.Round(diff * oldheight));
                    }
                    else
                    {
                        thumbWidth =Convert.ToInt32(oldwidth);
                        thumbHeight =Convert.ToInt32(oldheight);
                    }

                    if ((thumbHeight > height))
                    {
                        double def = height;
                        double imgheight = Convert.ToDouble(thumbHeight);
                        double diff = (def / imgheight);
                        thumbWidth = Convert.ToInt16(Math.Round(diff * thumbWidth));
                        thumbHeight = height;
                    }
                }

                Size newSize = new Size(thumbWidth, thumbHeight);
                using (Bitmap newImage = new Bitmap(newSize.Width - 3, newSize.Height - 3, System.Drawing.Imaging.PixelFormat.Format24bppRgb))
                {
                    using (Graphics canvas = Graphics.FromImage(newImage))
                    {
                        canvas.SmoothingMode = SmoothingMode.AntiAlias;
                        canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        canvas.DrawImage(oldImage, new Rectangle(new Point(-1, -1), newSize));
                        MemoryStream m = new MemoryStream();
                        newImage.Save(m, System.Drawing.Imaging.ImageFormat.Jpeg);
                        return m;
                    }
                }
            }
        }
    }

