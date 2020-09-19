using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.BinaLingk;
using Pertamina.PKBL.BLL;
using System.IO;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;

namespace Pertamina.PKBL.WebApp.BinaLingk
{
    public partial class CheckList : System.Web.UI.Page
    {

        CheckListBll bll = new CheckListBll();
        UploadedFile fileUploaded;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rbConfirm.SelectedValue = "0";
                InitCombo();
                
            }

            btnSubmit.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "BL.Permohonan.Edit");

        }

        private void InitCombo()
        {
            DdlBll ddlBll = new DdlBll();

            var comboData = ddlBll.GetComboItem("ddl_checklist_input");

            cbbActivity.DataSource = comboData;
            cbbActivity.TextField = "ddl_item";
            cbbActivity.ValueField = "ddl_value";
            cbbActivity.DataBind();

            cbbKTP.DataSource = comboData;
            cbbKTP.TextField = "ddl_item";
            cbbKTP.ValueField = "ddl_value";
            cbbKTP.DataBind();

            cbbPICorComitee.DataSource = comboData;
            cbbPICorComitee.TextField = "ddl_item";
            cbbPICorComitee.ValueField = "ddl_value";
            cbbPICorComitee.DataBind();

            cbbProfilePic.DataSource = comboData;
            cbbProfilePic.TextField = "ddl_item";
            cbbProfilePic.ValueField = "ddl_value";
            cbbProfilePic.DataBind();

            cbbProposalComplete.DataSource = comboData;
            cbbProposalComplete.TextField = "ddl_item";
            cbbProposalComplete.ValueField = "ddl_value";
            cbbProposalComplete.DataBind();

            cbbRAB.DataSource = comboData;
            cbbRAB.TextField = "ddl_item";
            cbbRAB.ValueField = "ddl_value";
            cbbRAB.DataBind();


            
            var data = bll.GetCurrent(Session["idPermohonan"].ToString());

            if (data.Rows.Count > 0)
            {

                cbbActivity.SelectedItem = cbbActivity.Items.FindByValue(data.Rows[0]["activity_photo_checked"]);
                cbbKTP.SelectedItem = cbbKTP.Items.FindByValue(data.Rows[0]["idcard_or_drivinglicense_checked"]);
                cbbPICorComitee.SelectedItem = cbbPICorComitee.Items.FindByValue(data.Rows[0]["pic_or_commitee_checked"]);
                cbbProfilePic.SelectedItem = cbbProfilePic.Items.FindByValue(data.Rows[0]["profilephoto_checked"]);
                cbbProposalComplete.SelectedItem = cbbProposalComplete.Items.FindByValue(data.Rows[0]["complete_proposal_checked"]);
                cbbRAB.SelectedItem = cbbRAB.Items.FindByValue(data.Rows[0]["activity_photo_checked"]);
            }


        }

        private void SetWithFile()
        {

            string fileName = Path.GetFileName(file.PostedFile.FileName);
            string savePath = Server.MapPath("UploadedFile") + "\\" + fileName;
            byte[] fileData=null;
            string mime = "" ;
            string ext = "";

            if (file.PostedFile.ContentLength / 1024 / 1024 < 2)
            {
                mime = file.PostedFile.ContentType;
                fileData = new byte[file.PostedFile.ContentLength];
                file.PostedFile.InputStream.Read(fileData,0,file.PostedFile.ContentLength);
                ext = Path.GetFileName(fileName);
            }
            else
            {
                Response.Redirect("CheckList.aspx");
            }
            

            Hashtable ht = new Hashtable();
            ht.Add("@profilephoto_checked-bit", cbbProfilePic.Value);
            ht.Add("@idcard_or_drivinglicense_checked-bit", cbbKTP.Value);
            ht.Add("@complete_proposal_checked-bit", cbbProposalComplete.Value);
            ht.Add("@rab_checked-bit", cbbRAB.Value.ToString());
            ht.Add("@pic_or_commitee_checked-bit", cbbPICorComitee.Value);
            ht.Add("@original_filename-varchar-200", fileName);
            ht.Add("@id-int", Session["idPermohonan"]);
            ht.Add("@activity_photo_checked-bit", cbbActivity.Value);
            ht.Add("@file_data-varbinary", fileData);
            ht.Add("@mime_type-varchar-100", mime);
            ht.Add("@UploadBy-varchar-100", Session["user"]);
            ht.Add("@file_ext-varchar-100", ext);

            bll.SetData(ht);
        }

        private void SetWithOutFile()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@profilephoto_checked-bit", cbbProfilePic.Value);
            ht.Add("@idcard_or_drivinglicense_checked-bit", cbbKTP.Value);
            ht.Add("@complete_proposal_checked-bit", cbbProposalComplete.Value);
            ht.Add("@rab_checked-bit", cbbRAB.Value.ToString());
            ht.Add("@pic_or_commitee_checked-bit", cbbPICorComitee.Value);
            ht.Add("@id-int", Session["idPermohonan"]);
            ht.Add("@activity_photo_checked-bit", cbbActivity.Value);

            bll.SetWithOutFile(ht);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (rbConfirm.SelectedValue == "1")
            {
                SetWithFile();
            }
            else if (rbConfirm.SelectedValue == "0")
            {
                SetWithOutFile();
            }
            Session["idPermohonan"] = null;

            Response.Redirect("PermohonanBL.aspx");
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PermohonanBL.aspx");
        }

        protected void file_FilesUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FilesUploadCompleteEventArgs e)
        {
            
        }



    }
}