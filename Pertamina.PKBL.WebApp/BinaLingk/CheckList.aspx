<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CheckList.aspx.cs" Inherits="Pertamina.PKBL.WebApp.BinaLingk.CheckList" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 238px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function myfunction() {
            $('#BodyContent_file').hide();
        })
        function nonActive() {
            $('#BodyContent_file').hide();
        }

        function Active() {
            $('#BodyContent_file').show();
        }


        function ValidateX() {
            var file = document.getElementById("BodyContent_file").files;
            var length = file[0].size / 1024 / 1024;

            if (length > 2) {
                document.getElementById("btnSubmit").disabled = true;
                $('#lblError').text('max 2 MB');
            }
            else {
                document.getElementById("btnSubmit").disabled = false;
                $('#lblError').text('')
            }

        }
    </script>
    <div id="checklistpanel">
        <table>
            <tr>
            <th colspan="3">
                <dx:ASPxLabel ID="lblHeader" Font-Bold="true" runat="server" Text="Identitas Calon Mitra Binaan"></dx:ASPxLabel>
                
            </th>
            </tr>
            <tr>
                <td class="label" style="width: 55%">
                    <dx:ASPxLabel ID="lblKodeAkun" Theme="Youthful" runat="server" Text="Pas Photo uk. 4x6, berwarna"></dx:ASPxLabel>
                </td>

                <td>
                    <dx:ASPxLabel ID="lblTitik0" Theme="Youthful" runat="server" Text=":"></dx:ASPxLabel>
                </td>

                <td class="auto-style1">
                    <dx:ASPxComboBox ID="cbbProfilePic" Theme="Youthful" runat="server" ValueField="profilephoto_checked">
                    </dx:ASPxComboBox>
                </td>

            </tr>

            <tr>
                <td class="label" style="width: 55%">
                    <dx:ASPxLabel ID="lblCabang" runat="server" Text="Fotocopy KTP/SIM"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblTitik1" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td class="auto-style1">
                    <dx:ASPxComboBox ID="cbbKTP" Theme="Youthful" runat="server" ValueField="idcard_or_drivinglicense_checked">
                    </dx:ASPxComboBox>
                </td>

            </tr>
            <tr>
                <td class="label" style="width: 55%">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Proposal Lengkap"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td class="auto-style1">
                    <dx:ASPxComboBox ID="cbbProposalComplete" Theme="Youthful" runat="server" ValueField="complete_proposal_checked">
                    </dx:ASPxComboBox>
                </td>

            </tr>
            <tr>
                <td class="label" style="width: 55%">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="RAB"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td class="auto-style1">
                    <dx:ASPxComboBox ID="cbbRAB" Theme="Youthful" runat="server" ValueField="rab_checked">
                    </dx:ASPxComboBox>
                      
                </td>

            </tr>
            <tr>
                <td class="label" style="width: 55%">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Kepanitiaan / Orang yang bertanggung jawab"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td class="auto-style1">
                    <dx:ASPxComboBox ID="cbbPICorComitee" Theme="Youthful" runat="server" ValueField="pic_or_commitee_checked">
                    </dx:ASPxComboBox>
                  
                </td>

            </tr>
            <tr>
                <td class="label" style="width: 55%">
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Foto Kegiatan / Transkrip Nilai"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td class="auto-style1">
                    <dx:ASPxComboBox ID="cbbActivity" Theme="Youthful" runat="server" ValueField="activity_photo_checked">
                    </dx:ASPxComboBox>
                </td>

            </tr>
            
        </table>
    </div>
    <div id="checkpanel">
        <dx:ASPxLabel runat="server" ID="lblCheck" Text="File Upload :"/>
        <asp:RadioButtonList runat="server" ID="rbConfirm">
            <asp:ListItem Value="1" onclick="Active()">Ya</asp:ListItem>
            <asp:ListItem Value="0" onclick="nonActive()">Tidak</asp:ListItem>
        </asp:RadioButtonList>
        <br />
<%--        <dx:ASPxUploadControl ID="file" runat="server" UploadMode="Auto" Width="280px" ValidationSettings-MaxFileSize="2097152">
            <ValidationSettings MaxFileSizeErrorText="File Max. 2MB"></ValidationSettings>
        </dx:ASPxUploadControl>--%>
        <asp:FileUpload ID="file" runat="server" ClientIDMode="Static" BorderStyle="None" onchange="ValidateX()" ValidateRequestMode="Enabled" />
        <asp:Label ID="lblError" ClientIDMode="Static" runat="server" ForeColor="Red" />
    </div>


    <asp:Button ID="btnSubmit" ClientIDMode="Static" runat="server" Text="Simpan" OnClick="btnSubmit_Click"/>
    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Batal" NavigateUrl="PermohonanBL.aspx" Theme="Youthful">
    </dx:ASPxHyperLink>
    


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
