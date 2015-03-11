using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using Newtonsoft.Json;
namespace Q1Release.Services
{
    public class MyDataService
    {
        public static List<SampleDataViewModel> GetSampleData()
        {
            var dataUrl = "http://demos.telerik.com/kendo-ui/service/products?callback=";
            var jsonData = String.Empty;
            using (var w = new WebClient())
            {
                jsonData = w.DownloadString(dataUrl);
            }
            return JsonConvert.DeserializeObject<List<SampleDataViewModel>>(jsonData);
        }
    }
}