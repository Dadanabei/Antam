using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL;
using System.Net;


namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class Files : System.Web.UI.UserControl
    {
        FilesBll bll = new FilesBll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                getData();

                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnUpload.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            }
        }

        public void getData() {
            download.Visible = false;
            var mitraId = int.Parse(Session["mitraid"].ToString());
            Hashtable ht = new Hashtable();
            ht.Add("@mitra_id-int", mitraId);
            DataTable dt = bll.getData(ht);
            if (dt.Rows.Count > 0)
            {
                download.Visible = true;
                download.Text = dt.Rows[0]["FileName"].ToString();
            }
        
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "upload file";
            log.UserName = userName;

            try
            {
                var mitraId = int.Parse(Session["mitraid"].ToString());
                Hashtable ht = new Hashtable();
                if (fileUpload.HasFile)
                {
                    string filename = fileUpload.PostedFile.FileName;
                    string extension = System.IO.Path.GetExtension(Server.MapPath(filename));
                    Stream fileData = fileUpload.PostedFile.InputStream;

                    BinaryReader br = new BinaryReader(fileData);
                    byte[] databyte = br.ReadBytes(fileUpload.PostedFile.ContentLength);

                    ht.Add("@mitra_id-int", mitraId);
                    ht.Add("@FileName-nvarchar-250", filename);
                    ht.Add("@FileExt-nvarchar-250", extension);
                    ht.Add("@FileData-varbinary", databyte);
                    ht.Add("@UploadBy-nvarchar-50", Session["user"]);

                    bll.updateData(ht);
                    log.Type = "S";
                    log.Description = log.Action + " filename "+filename+ " mitra id " + Session["mitraid"].ToString() + " sukses oleh " + userName;
                    
                    getData();
                }
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = log.Action + " error " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        protected void download_Click(object sender, EventArgs e)
        {            
            var mitraId = int.Parse(Session["mitraid"].ToString());
            Hashtable ht = new Hashtable();
            ht.Add("@mitra_id-int", mitraId);
            DataTable dt = bll.getData(ht);
            //var physicPath = Server.MapPath(filePath);
            string fileName = dt.Rows[0]["FileName"].ToString();
            byte[] fileData = (byte[])dt.Rows[0]["FileData"];
            string fileExt = (string)dt.Rows[0]["FileExt"];

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", String.Format("attachment;filename={0}", fileName));
            Response.ContentType = "application/" + fileExt.Substring(1);
            Response.BinaryWrite(fileData);
            //Response.WriteFile(physicPath);
            Response.Flush();
            Response.End();
            
        }
    }
}