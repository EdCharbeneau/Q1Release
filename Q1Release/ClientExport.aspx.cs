using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Q1Release
{
    public partial class ClientExport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             var relativePath = "~/api/export/file";
 
            CertificateExportManager.ImageSettings.ProxyURL = ResolveUrl(relativePath);
            CertificateExportManager.PdfSettings.ProxyURL = ResolveUrl(relativePath);

            CertificateExportManager.PdfSettings.Fonts.Add("Rochester", "/Fonts/Rochester-Regular.ttf"); //the font is added to export the code viewer properly
        }

    }
}