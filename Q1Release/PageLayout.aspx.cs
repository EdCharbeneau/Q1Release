using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using Q1Release.Services;
using System.Collections.Generic;
using Telerik.Web.Device;
using Telerik.Web.Device.Detection;
using Q1Release;
using System.Linq;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            var screenSize = Detector.GetScreenSize(Request.UserAgent);
            if (screenSize == DeviceScreenSize.Small)
            {
                RadGrid1.Columns.FindByDataField("ProductID").Display = false;
                RadGrid1.Columns.FindByDataField("Discontinued").Display = false;
                RadGrid1.Columns.FindByDataField("UnitsInStock").Display = false;
                RadGrid1.PageSize = 5;
                RadHtmlChart1.Visible = false;
                AnalysisPanel.Visible = true;
            }
        }

    }

    public IQueryable<SampleDataViewModel> GetProducts()
    {
        return MyDataService.GetSampleData().AsQueryable();
    }

    public List<InventoryAnalysisModel> GetInventoryAnalysis()
    {
        var products = GetProducts();
        var totalInventory = products.Sum(p => p.UnitsInStock);
        var totalDiscontinued = products.Where(p => p.Discontinued).Sum(p => p.UnitsInStock);
        var marketableInventory = totalInventory - totalDiscontinued;
        var analysis = new List<InventoryAnalysisModel>
        {
            new InventoryAnalysisModel {InventoryType = "Marketable", Percent = Math.Round(((decimal)marketableInventory / (decimal)totalInventory) *100)},
            new InventoryAnalysisModel {InventoryType = "Discontinued", Percent = Math.Round(((decimal)totalDiscontinued / (decimal)totalInventory) * 100)}

        };
        return analysis;
    }

    protected void ShowAnalysisButton_Click(object sender, EventArgs e)
    {
        //RadHtmlChart1.DataBind();
        RadHtmlChart1.Visible = true;
        AnalysisPanel.Visible = false;
    }
}
