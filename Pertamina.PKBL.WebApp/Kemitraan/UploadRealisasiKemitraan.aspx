<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UploadRealisasiKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.UploadRealisasiKemitraan" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <style>
        #theform>tbody>tr{
            height:25px;
        }

        #theform>tbody>tr>:first-child {
            width:200px;
            font-size:larger;
        }
    </style>
    <%= ViewState["msg"] %>
    <dx:ASPxGridView runat="server" ID="gvDetailPencairanPK" AutoGenerateColumns="False" Theme="Youthful" Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No Akun" Name="account_id" FieldName="account_id" VisibleIndex="1">
                <CellStyle HorizontalAlign="left"></CellStyle>
            </dx:GridViewDataTextColumn>
                
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name" VisibleIndex="2">
                 <CellStyle HorizontalAlign="left"></CellStyle>
            </dx:GridViewDataTextColumn>            
            <dx:GridViewDataTextColumn Caption="Saldo" Name="SaldoAkhir" FieldName="SaldoAkhir" VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

        </Columns>

        <Settings ShowFilterRow="True" />
        <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords"></SettingsPager>
        <StylesPager>
            <CurrentPageNumber BackColor="#FB000C">
            </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>
    <br />
    <br />
    <br />
    <br />
    <asp:LinkButton ID="linkDownload" runat="server" OnClick="linkDownload_Click" Text="Template Upload Realisasi PK" Font-Size="Larger"></asp:LinkButton>
    <br />
    <asp:HyperLink ID="kot" runat="server" Text="List Kota Kabupaten" Font-Size="Larger" NavigateUrl="~\Administer\DownloadMaster.aspx?mstnm=CityIndex" Target="_blank"></asp:HyperLink>
    <br />
    <br />
    <br />
    <br />
    <dx:ASPxComboBox ID="cbbKota" runat="server" Visible="false"></dx:ASPxComboBox>
    <dx:ASPxComboBox ID="cbbStatusPernikahan" runat="server" Visible="false"></dx:ASPxComboBox>
    <dx:ASPxComboBox ID="cbbPendidikanTerakhir" runat="server" Visible="false"></dx:ASPxComboBox>
    <table id="theform">
        <tr>
            <td>File</td>
            <td>
                <asp:FileUpload ID="fuUploadData" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>Tanggal Permohonan</td>
            <td>
                <dx:ASPxDateEdit ID="deTglPermohonan" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td>Tanggal Persetujuan</td>
            <td>
                <dx:ASPxDateEdit ID="deTglPersetujuan" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td>Tanggal Realisasi</td>
            <td>
                <dx:ASPxDateEdit ID="deTglRealisasi" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td>Akun</td>
            <td>
                <dx:ASPxComboBox ID="cbbCOABank" runat="server" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Sektor</td>
            <td>
                <dx:ASPxComboBox ID="cbbSector" runat="server" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Periode <span style="color:red">*</span></td>
            <td>
                <dx:ASPxTextBox ID="txtPeriode" runat="server" Width="170px" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Yarnen</td>
            <td>
                <dx:ASPxCheckBox ID="cbIsYarnen" runat="server" Theme="Youthful">
                    <ClientSideEvents CheckedChanged="function(s, e) { cbIsYarnen_CheckedChanged(s,e);  e.processOnServer = false;} " />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>Suplier</td>
            <td>
                <dx:ASPxComboBox ID="cbbSuplier" runat="server" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Jenis Usaha</td>
            <td>
                <dx:ASPxComboBox ID="cbbCompanyKind" runat="server" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Jenis Kredit</td>
            <td>
                <dx:ASPxComboBox ID="cbbJkr" runat="server" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Bunga (%) <span style="color:red">*</span></td>
            <td>
                <dx:ASPxTextBox ID="txtBunga" runat="server" Width="170px" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Jenis Jasa</td>
            <td>
                <dx:ASPxComboBox ID="cbbJenisJasa" runat="server" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Grace Period <span style="color:red">*</span></td>
            <td>
                <dx:ASPxTextBox ID="txtGracePeriod" runat="server" Width="170px" Theme="Youthful" ClientInstanceName="txtGracePeriod">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>Deskripsi <span style="color:red">*</span></td>
            <td>
                <dx:ASPxMemo ID="txtDeskripsi" runat="server" Height="71px" Width="170px" Theme="Youthful">
                    <ValidationSettings ValidationGroup="MyGroup" ValidateOnLeave="False">
                        <RequiredField IsRequired="True" ErrorText="Field is required" />
                    </ValidationSettings>
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                
            </td>
        </tr>
    </table>
    
    
    

    <asp:Button ID="btnPreview" Text="Preview" runat="server" OnClick="btnPreview_Click" />
    <dx:ASPxLabel ID="lblKeterangan" Font-Bold="true" Font-Size="Larger" runat="server"></dx:ASPxLabel>
    <div class="bodydetail" style="overflow:auto;overflow-y:hidden;overflow-x:scroll">
        <dx:ASPxGridView ID="gPreview" runat="server" SettingsPager-PageSize="100" SettingsPager-Visible="true" SettingsPager-AlwaysShowPager="true" OnPageIndexChanged="gPreview_PageIndexChanged" Theme="Youthful" Settings-ShowFooter="true">
            <Columns>
                <dx:GridViewDataColumn Caption="No" Name="No" VisibleIndex="0"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Message" Name="Message" FieldName="Message" Visible="false" VisibleIndex="1"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nama" Name="NamaKTP" FieldName="NamaKTP"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="TempatLahir" Name="TempatLahir" FieldName="TempatLahir"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="TglLahir" Name="TglLahir" FieldName="TglLahir"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="NoKTP" Name="NoKTP" FieldName="NoKTP"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="NoAnggota" Name="NoAnggota" FieldName="NoAnggota"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Alamat" Name="Alamat" FieldName="Alamat"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="RTRW" Name="RTRW" FieldName="RTRW"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Desa" Name="Desa" FieldName="Desa"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Kecamatan" Name="Kecamatan" FieldName="Kecamatan"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Kotakab" Name="Kotakab" FieldName="Kotakab"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="PendidikanTerakhir" Name="PendidikanTerakhir" FieldName="PendidikanTerakhir"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Pekerjaan" Name="Pekerjaan" FieldName="Pekerjaan"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="StatusPernikahan" Name="StatusPernikahan" FieldName="StatusPernikahan"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="NamaIbuKandung" Name="NamaIbuKandung" FieldName="NamaIbuKandung"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="NamaPenjamin" Name="NamaPenjamin" FieldName="NamaPenjamin"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="NoKTPPenjamin" Name="NoKTPPenjamin" FieldName="NoKTPPenjamin"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="TmptLahirPenjamin" Name="TmptLahirPenjamin" FieldName="TmptLahirPenjamin"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="TgllahirPenjamin" Name="TgllahirPenjamin" FieldName="TgllahirPenjamin"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="PekerjaanPenjamin" Name="PekerjaanPenjamin" FieldName="PekerjaanPenjamin"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Rekening" Name="Rekening" FieldName="Rekening"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="LuasTanah" Name="LuasTanah" FieldName="LuasTanah"></dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn Caption="Pinjaman" Name="Pinjaman" FieldName="Pinjaman" PropertiesTextEdit-DisplayFormatString="##,#.00"></dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="Pinjaman" DisplayFormat="##,#.00" ShowInColumn="Pinjaman" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>



    </div>
    <asp:Button ID="btnSave" Text="Save" Visible="false" runat="server" OnClick="btnSave_Click" OnClientClick="validate" />

    <script>

        function validate(s, e) {
            debugger;
            e.processOnServer = ASPxClientEdit.ValidateGroup('MyGroup');
        }

        function cbIsYarnen_CheckedChanged(s, e) {
            if (s.GetChecked()) {
                txtGracePeriod.SetValue(0);
                txtGracePeriod.SetEnabled(false);
            }
            else {
                
                txtGracePeriod.SetEnabled(true);
            }

        }
    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
