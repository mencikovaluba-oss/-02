using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;

namespace desktop
{
    internal class ApiService
    {
        private readonly HttpClient _httpClient;
        private string _authToken;

        private const string BaseUrl = "http://localhost:5000/api/";

        public ApiService() 
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new Uri(BaseUrl);
            _httpClient.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
        }

    }
}