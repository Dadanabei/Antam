<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataAgunan.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.DataAgunan" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div class="bodydetail">
<dx:ASPxLabel runat="server" ID="ASPxLabel7" Font-Bold="true" Text="Mobil" Font-Size="14px"></dx:ASPxLabel>
<div class="borderdetail">
    <table>
        <tr>
            <td style="width:10%">
                <dx:ASPxLabel ID="lblJenis" runat="server" Text="Jenis / Merk"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtJenis" Theme="Youthful" runat="server" Width="74%"></dx:ASPxTextBox>
            </td>
        </tr>

        <tr>
            <td>
                <dx:ASPxLabel ID="lblNilaiAgunan" runat="server" Text="Nilai Agunan"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtNilaiAgunan" Theme="Youthful" runat="server" Width="90.97%">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>

        <tr>
            <td>
                <dx:ASPxLabel ID="lblKondisi" runat="server" Text="Kondisi"></dx:ASPxLabel>
            </td>
            <td>                
                <dx:ASPxTextBox ID="cbbKondisi" runat="server" Theme="Youthful" ></dx:ASPxTextBox>                                
            </td>
        </tr>
    </table>
</div>
<br />
<dx:ASPxLabel runat="server" ID="lblPenjamins2" Font-Bold="true" Text="Motor" Font-Size="14px"></dx:ASPxLabel>
<div class="borderdetail">
    
    <table>
        <tr>
            <td style="width:10%">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Jenis / Merk"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtJenisMotor" Theme="Youthful" runat="server" Width="74%"></dx:ASPxTextBox>
            </td>
        </tr>

        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Nilai Agunan"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtAgunanMotor" Theme="Youthful" runat="server" Width="90.97%">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>

        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Kondisi"></dx:ASPxLabel>
            </td>
            <td>               
                <dx:ASPxTextBox ID="cbbKondisiMotor" runat="server" Theme="Youthful" ></dx:ASPxTextBox> 
                
            </td>
        </tr>
    </table>
</div>
<br />
<dx:ASPxLabel runat="server" ID="ASPxLabel8" Font-Bold="true" Text="Lainnya" Font-Size="14px"></dx:ASPxLabel>
<div class="borderdetail">
    
    <table>
        <tr>
            <td style="width:10%">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Jenis / Merk"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtJenisLain" Theme="Youthful" runat="server" Width="74%"></dx:ASPxTextBox>
            </td>
        </tr>

        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Nilai Agunan"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtAgunanLain" Theme="Youthful" runat="server" Width="90.97%">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>

        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Kondisi"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtKondisiLain" Theme="Youthful" runat="server" Width="74%"></dx:ASPxTextBox>
            </td>
        </tr>
    </table>
</div>
<br />
<table>
    <tr>
        <td>
            <dx:ASPxLabel ID="lblKeterangan" runat="server" Text="Keterangan Agunan"></dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxMemo ID="mmAgunan" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
        </td>
    </tr>
</table>
<br />
<dx:ASPxButton ID="btnUpdate" runat="server" Theme="Youthful" Text="Update" OnClick="btnUpdate_Click"></dx:ASPxButton>
</div>