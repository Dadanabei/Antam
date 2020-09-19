using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using Pertamina.PKBL.BLL;
using System.Data;
using System.Collections;
using System.Net;


namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class BidangUsaha : System.Web.UI.UserControl
    {
        BidangUsahaBll bll = new BidangUsahaBll();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initCombo();
                GetData();


                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnUpdate.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            }
        }

        public void GetData()
        {
            Hashtable ht = new Hashtable();

            ht.Add("@mitra_id-int", Session["mitraid"]);

            var data = bll.getData(ht);

            if (data.Rows.Count > 0)
            {

                var detail = data.Rows[0];

                txtAlat1.Text = detail["owned_tool1"].ToString();
                txtQtyAlat1.Text = detail["owned_tool1_count"].ToString();
                txtAlat2.Text = detail["owned_tool2"].ToString();
                txtQtyAlat2.Text = detail["owned_tool2_count"].ToString();
                txtAlat3.Text = detail["owned_tool3"].ToString();
                txtQtyAlat3.Text = detail["owned_tool3_count"].ToString();
                txtJenisProduksi1.Text = detail["p1_production_kind"].ToString();
                txtJmlProd1.Text = detail["p1_amount"].ToString();
                txtHargaSatuan1.Text = detail["p1_item_price"].ToString();
                txtJmlJualan1.Text = detail["p1_sales"].ToString();
                txtJenisProduksi2.Text = detail["p2_production_kind"].ToString();
                txtJmlProd2.Text = detail["p2_amount"].ToString();
                txtHargaSatuan2.Text = detail["p2_item_price"].ToString();
                txtJmlJualan2.Text = detail["p2_sales"].ToString();
                txtJenisProduksi3.Text = detail["p3_production_kind"].ToString();
                txtJmlProd3.Text = detail["p3_amount"].ToString();
                txtHargaSatuan3.Text = detail["p3_item_price"].ToString();
                txtJmlJualan3.Text = detail["p3_sales"].ToString();
                txtJenisProduksi4.Text = detail["p4_production_kind"].ToString();
                txtJmlProd4.Text = detail["p4_amount"].ToString();
                txtHargaSatuan4.Text = detail["p4_item_price"].ToString();
                txtJmlJualan4.Text = detail["p4_sales"].ToString();
                mmJasa.Text = detail["service_provided"].ToString();
                mmPemasaran.Text = detail["marketing"].ToString();
                bool handmade = bool.Parse(detail["is_product_handmade"].ToString());
                bool machine = bool.Parse(detail["is_product_machinemade"].ToString());

                if (handmade && machine)
                {
                    cbbBrgProd.SelectedItem = cbbBrgProd.Items.FindByValue("2");
                }
                else if (handmade && !machine)
                {
                    var mbuh = cbbBrgProd.Items.FindByValue("0");
                    cbbBrgProd.SelectedItem = mbuh;
                }
                else
                {
                    cbbBrgProd.SelectedItem = cbbBrgProd.Items.FindByValue("1");
                }

                bool local = bool.Parse(detail["is_local_market"].ToString());
                bool export = bool.Parse(detail["is_export"].ToString());

                if (local && export)
                {
                    cbbDaerahPemasaran.SelectedItem = cbbDaerahPemasaran.Items.FindByValue("2");
                }
                else if (local && !export)
                {
                    cbbDaerahPemasaran.SelectedItem = cbbDaerahPemasaran.Items.FindByValue("0");
                }
                else
                {
                    cbbDaerahPemasaran.SelectedItem = cbbDaerahPemasaran.Items.FindByValue("1");
                }

            }
            else
            {
                txtJmlProd1.Text = "0";
                txtHargaSatuan1.Text = "0";
                txtJmlJualan1.Text = "0";

                txtJmlProd2.Text = "0";
                txtHargaSatuan2.Text = "0";
                txtJmlJualan2.Text = "0";

                txtJmlProd3.Text = "0";
                txtHargaSatuan3.Text = "0";
                txtJmlJualan3.Text = "0";

                txtJmlProd4.Text = "0";
                txtHargaSatuan4.Text = "0";
                txtJmlJualan4.Text = "0";
            }

        }

        public void initCombo()
        {
            DdlBll combo = new DdlBll();

            var produksi = combo.GetComboItem("ddl_produksi");
            var pemasaran = combo.GetComboItem("ddl_pemasaran");

            cbbBrgProd.DataSource = produksi;
            cbbBrgProd.TextField = "ddl_item";
            cbbBrgProd.ValueField = "ddl_value";
            cbbBrgProd.DataBind();
            cbbBrgProd.SelectedIndex = 0;

            cbbDaerahPemasaran.DataSource = pemasaran;
            cbbDaerahPemasaran.TextField = "ddl_item";
            cbbDaerahPemasaran.ValueField = "ddl_value";
            cbbDaerahPemasaran.DataBind();
            cbbDaerahPemasaran.SelectedIndex = 0;

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
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
            log.Action = "update data bidang usaha";
            log.UserName = userName;


            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@mitra_id-int", Session["mitraid"]);
                ht.Add("@owned_tool1-varchar-64", txtAlat1.Text);
                ht.Add("@owned_tool1_count-int", txtQtyAlat1.Text);
                ht.Add("@owned_tool2-varchar-64", txtAlat2.Text);
                ht.Add("@owned_tool2_count-int", txtQtyAlat2.Text);
                ht.Add("@owned_tool3-varchar-64", txtAlat3.Text);
                ht.Add("@owned_tool3_count-int", txtQtyAlat3.Text);
                ht.Add("@owned_tool4-varchar-64", "hardcode");
                ht.Add("@owned_tool4_count-int", 1);
                ht.Add("@production_kind1-varchar-64", txtJenisProduksi1.Text);
                ht.Add("@amount1-int", txtJmlProd1.Text);
                ht.Add("@item_price1-decimal", txtHargaSatuan1.Text);
                ht.Add("@sales1-decimal", txtJmlJualan1.Text);
                ht.Add("@production_kind2-varchar-64", txtJenisProduksi2.Text);
                ht.Add("@amount2-int", txtJmlProd2.Text);
                ht.Add("@item_price2-decimal", txtHargaSatuan2.Text);
                ht.Add("@sales2-decimal", txtJmlJualan2.Text);
                ht.Add("@production_kind3-varchar-64", txtJenisProduksi3.Text);
                ht.Add("@amount3-int", txtJmlProd3.Text);
                ht.Add("@item_price3-decimal", txtHargaSatuan3.Text);
                ht.Add("@sales3-decimal", txtJmlJualan3.Text);
                ht.Add("@production_kind4-varchar-64", txtJenisProduksi4.Text);
                ht.Add("@amount4-int", txtJmlProd4.Text);
                ht.Add("@item_price4-decimal", txtHargaSatuan4.Text);
                ht.Add("@sales4-decimal", txtJmlJualan4.Text);
                ht.Add("@service_provided-text", mmJasa.Text);
                ht.Add("@marketing-text", mmPemasaran.Text);
                ht.Add("@modified_by-varchar-64", Session["user"]);

                if (Int32.Parse(cbbBrgProd.Value.ToString()) == 0)
                {
                    ht.Add("@is_product_handmade-bit", 1);
                    ht.Add("@is_product_machinemade-bit", 0);
                }
                else if (Int32.Parse(cbbBrgProd.Value.ToString()) == 1)
                {
                    ht.Add("@is_product_handmade-bit", 0);
                    ht.Add("@is_product_machinemade-bit", 1);
                }


                if (Int32.Parse(cbbDaerahPemasaran.Value.ToString()) == 0)
                {
                    ht.Add("@is_local_market-bit", 1);
                    ht.Add("@is_export-bit", 0);
                }
                else if (Int32.Parse(cbbDaerahPemasaran.Value.ToString()) == 1)
                {
                    ht.Add("@is_local_market-bit", 0);
                    ht.Add("@is_export-bit", 1);
                }

                
                bll.updateData(ht);
                log.Type = "S";
                log.Description = log.Action + " mitra id " + Session["mitraid"].ToString() + " sukses oleh " + userName;
                GetData();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            catch (Exception ex) {
                log.Type = "E";
                log.Description = "update data bidang usaha error : " + ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }
    }
}