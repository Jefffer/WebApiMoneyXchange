using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace BusinessLayer.Services
{
    public class ConversionService
    {
        // API URL and KEY
        const string baseUrl = "https://free.currconv.com/api/v7/";
        const string apiKey = "5f659d8e8f8ff8f89494";        

        public double GetExchange(string from, string to, decimal amount)
        {
            // Re asign 'from' and 'to' values            

            // create request url
            string url = baseUrl + "convert?q=" + from + "_" + to + "&compact=ultra&apiKey=" + apiKey;

            var jsonString = GetResponse(url);
            return JObject.Parse(jsonString).First.First["val"].ToObject<double>();

        }

        /// <summary>
        /// Private method to Get response from URL request
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        private static string GetResponse(string url)
        {
            string jsonString;

            var request = (HttpWebRequest)WebRequest.Create(url);
            request.AutomaticDecompression = DecompressionMethods.GZip;

            using (var response = (HttpWebResponse)request.GetResponse())
            using (var stream = response.GetResponseStream())
            using (var reader = new StreamReader(stream))
            {
                jsonString = reader.ReadToEnd();
            }

            return jsonString;
        }

    }
}
