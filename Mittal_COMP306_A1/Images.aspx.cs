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
using Google.Cloud.Storage.V1;

namespace Mittal_COMP306_A1
{
    public partial class Images : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void BtnUpload_Click(object sender, EventArgs e)
        {

            StorageClient storageClient = StorageClient.Create();
            string name = Path.GetFileName(foodImage.PostedFile.FileName);
            String bucketName = "comp306-a1";
            Stream inputStream = foodImage.PostedFile.InputStream;
            string contentType = foodImage.PostedFile.ContentType;
           

            var imgOBj = storageClient.UploadObject(bucketName,name,contentType,inputStream,null,null);
          

        } }
    }
