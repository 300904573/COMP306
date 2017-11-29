using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Storage.v1;
using System.Threading;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace Mittal_COMP306_A1
{
    public partial class Images : System.Web.UI.Page
    {
        private static ClientSecrets _clientSecrets = new ClientSecrets();
        private static UserCredential _userCredential = null;
        private static StorageService _storageService = new StorageService();

        private const string ClientId = "230504989884-1fqljdorguhvven95oo1tcmad0ggpi0s.apps.googleusercontent.com";
        private const string ClientSecret = "TUb8ZAU2v-z2lQ88FrCHkksa";
        //private static string[] Scopes = new[] { @"https://www.googleapis.com/auth/devstorage.full_control" };
       

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void upload(String path, String file)
        //{

        //}
        protected async void BtnUpload_Click(object sender, EventArgs e)
        {
            var Scopes = new[] { @"https://www.googleapis.com/auth/devstorage.full_control" };

            //authorised your request
            _clientSecrets.ClientId = ClientId;
            _clientSecrets.ClientSecret = ClientSecret;

            //CancellationTokenSource cts = new CancellationTokenSource();
            var cts = new CancellationTokenSource();
            _userCredential = await GoogleWebAuthorizationBroker.AuthorizeAsync(_clientSecrets, Scopes, "mittal3patel@gmail.com", cts.Token);

            //refreash token
            await RefreshTokenIfExpired(cts);

            //create storage service
            var service = new Google.Apis.Storage.v1.StorageService();

            //craeting new bucket
            var newBucket = new Google.Apis.Storage.v1.Data.Bucket()
            {
                Name = "bucketTest"
            };

            var newBucketQuery = service.Buckets.Insert(newBucket, "hardy-album-164320");
            newBucketQuery.OauthToken = _userCredential.Token.AccessToken;
            //you probably want to wrap this into try..catch block
            newBucketQuery.Execute();


            //list your bucket
            var bucketsQuery = service.Buckets.List("hardy-album-164320");
            bucketsQuery.OauthToken = _userCredential.Token.AccessToken;
            var buckets = bucketsQuery.Execute();

            //var bucketsQuery = _storageService.Buckets.List("hardy-album-164320");
            //bucketsQuery.OauthToken = _userCredential.Token.AccessToken;
            //var buckets = bucketsQuery.Execute();
            //string bucketToUpload = buckets.Items[0].Name;

            //uploading a file
            //enter bucket name to which you want to upload file
            var bucketToUpload = buckets.Items.FirstOrDefault().Name;
            var newObject = new Google.Apis.Storage.v1.Data.Object()
            {
                Bucket = bucketToUpload,
                Name = "some-file-" + new Random().Next(1, 666)
            };

            FileStream fileStream = null;
            try
            {
                var dir = Directory.GetCurrentDirectory();
                var path = Path.Combine(dir, "test.png");
                fileStream = new FileStream(path, FileMode.Open);
                var uploadRequest = new Google.Apis.Storage.v1.ObjectsResource.InsertMediaUpload(service, newObject,
                bucketToUpload, fileStream, "image/png");
                uploadRequest.OauthToken = _userCredential.Token.AccessToken;
                await uploadRequest.UploadAsync();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                if (fileStream != null)
                {
                    fileStream.Dispose();
                }
            }



        }

        private async Task RefreshTokenIfExpired(CancellationTokenSource cts)
        {
            // throw new NotImplementedException();
            if (_userCredential.Token.IsExpired(Google.Apis.Util.SystemClock.Default))
            {
                await _userCredential.RefreshTokenAsync(cts.Token);
            }
        }
    }
}