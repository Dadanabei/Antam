<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="SinergiBUMN.aspx.cs" Inherits="Pertamina.PKBL.WebApp.SinergiBUMN" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="con" ContentPlaceHolderID="html_header" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        //function CustomButtonClick(s,e) {
        //    //   kode.SetText(e.visibleIndex);
        //    gvPenyalur.GetRowValues(e.visibleIndex, "supplier_code;supplier_name", RecieveGridValues);
        //}
        //function RecieveGridValues(values) {
        //    alert(values[0]);
        //}

        function CustomButtonClick(s, e) {
            var index = e.visibleIndex;
            gvPenyalur.GetRowValues(e.visibleIndex, 'supplier_code;supplier_name;keterangan;idSupplier;alamat;telepon;fax;jabatan;PIC;branchCode;tglDaftar', OnGetRowValues);
            //var a = s.batchEditApi.GetCellValue(e.visibleIndex, s.GetColumnByField('supplier_code'));
            //alert(index);
        }

        function OnGetRowValues(values) {
            var dob = new Date(values[10]);
            kode.SetText(values[0]);
            nama.SetText(values[1]);
            keterangan.SetText(values[2]);
            idText.SetText(values[3]);
            alamatSup.SetText(values[4]);
            telepon.SetText(values[5]);
            fax.SetText(values[6]);
            jabatan.SetText(values[7]);
            pic.SetText(values[8]);
            tglDaftar.SetDate(dob);
            //BodyContent_ddlRegion.SetValue(values[10]);
            document.getElementById("BodyContent_ddlRegion").value = values[9];
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <style>
    </style>
    <div id="page-wrapper">
        <h2 class="page-header">Penyalur</h2>
        
        <fieldset class="form-wrapper">
            <table>
                <tr>
                    <td>Id</td>
                    <td><dx:ASPxTextBox ID="idText" runat="server" ClientInstanceName="idText" Visible="true" ReadOnly="true"></dx:ASPxTextBox></td>
                </tr>
                <tr>
                    <td>Tanggal Daftar: *</td>
                    <td>
                        <dx:ASPxDateEdit ID="tglDaftar" ClientInstanceName="tglDaftar" Theme="Youthful" runat="server" Width="170px" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>

                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Kode Penyalur: *</td>
                    <td>
                        <dx:ASPxTextBox ID="kode" ClientInstanceName="kode" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kode penyalur tidak boleh kosong.." ControlToValidate="kode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Nama Penyalur: *</td>
                    <td>
                        <dx:ASPxTextBox ID="nama" ClientInstanceName="nama" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="nama penyalur tidak boleh kosong.." ControlToValidate="nama" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Alamat: </td>
                    <td>
                        <dx:ASPxTextBox ID="alamat" ClientInstanceName="alamatSup" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Telepon: </td>
                    <td>
                        <dx:ASPxTextBox ID="telepon" ClientInstanceName="telepon" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Fax: </td>
                    <td>
                        <dx:ASPxTextBox ID="fax" ClientInstanceName="fax" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Keterangan: </td>
                    <td>
                        <dx:ASPxTextBox ID="keterangan" ClientInstanceName="keterangan" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>PIC: </td>
                    <td>
                        <dx:ASPxTextBox ID="pic" ClientInstanceName="pic" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Jabatan: </td>
                    <td>
                        <dx:ASPxTextBox ID="jabatan" ClientInstanceName="jabatan" Theme="Youthful" runat="server" Width="170px"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Cabang: *</td>
                    <td>
                        <asp:DropDownList ID="ddlRegion" runat="server" ClientIDMode="Inherit"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="save" Text="Simpan" runat="server" Theme="Youthful" EnableTheming="true" OnClick="save_Click"></dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div>
        <dx:ASPxGridView ID="gvPenyalur" Theme="Youthful" Width="100%"  OnDataBinding="gvPenyalur_DataBinding"
            runat="server" KeyFieldName="id" OnCustomButtonCallback="gvPenyalur_CustomButtonCallback" ClientInstanceName="gvPenyalur">
            <ClientSideEvents CustomButtonClick="CustomButtonClick"/>
              
            <Settings ShowFilterRowMenu="true" ShowFilterRow="true" />
            <SettingsPager AlwaysShowPager="true"></SettingsPager>
            <SettingsCommandButton>
                <UpdateButton>
                    <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
                </UpdateButton>
            </SettingsCommandButton>
            <Columns>
                <dx:GridViewDataColumn Caption="id" FieldName="idSupplier"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Kode Penyalur" FieldName="supplier_code"></dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn Caption="Nama Penyalur" FieldName="supplier_name"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Visible="false" FieldName="alamat"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Visible="false" FieldName="telepon"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Visible="false" FieldName="fax"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Visible="false" FieldName="jabatan"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Visible="false" FieldName="PIC"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Visible="false" FieldName="branchCode"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Visible="false" FieldName="tglDaftar" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="keterangan"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Jml Mitra" FieldName="totalMitr"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total pinjaman" FieldName="totalPinjaman" PropertiesTextEdit-DisplayFormatString="##,#.00"></dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn Caption="Opr." ShowUpdateButton="true" VisibleIndex="9" ButtonType="Image" Name="opr">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="Tambah" Text="TAMBAH" Visibility="AllDataRows" Image-ToolTip="tambah">
                            <Image Url="~/content/images/new.png"></Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>
