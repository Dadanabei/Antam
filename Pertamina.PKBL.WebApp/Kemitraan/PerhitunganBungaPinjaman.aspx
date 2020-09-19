<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PerhitunganBungaPinjaman.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PerhitunganBungaPinjaman" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:ScriptManager  ID="scriptMan" runat="server"></asp:ScriptManager>
    <div>
    <h2>Perhitungan Bunga Pinjaman</h2>
    <fieldset>        
        <table>
            <tr>
                <td><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Usulan Kredit (Rp) *" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    :
                </td>
                <td>
                    <dx:ASPxTextBox ID="usulan" runat="server" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                    <asp:RequiredFieldValidator ControlToValidate="usulan" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Harap isi nilai pengajuan kredit.." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Bunga (%) *" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    :
                </td>
                <td>
                    <dx:ASPxTextBox ID="bunga" runat="server" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                    <asp:RequiredFieldValidator ControlToValidate="bunga" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Harap isi nilai bunga kredit.." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Jangka Waktu (bulan) *" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    :
                </td>
                <td>
                    <dx:ASPxTextBox ID="JangkaWaktu" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    <asp:RequiredFieldValidator ControlToValidate="JangkaWaktu" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Harap isi jangka waktu kredit.." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Jenis Kredit *" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    :
                </td>
                <td>
                    <dx:ASPxComboBox ID="jenisJasa" runat="server" Theme="Youthful">
                        <ValidationSettings RequiredField-IsRequired="true"></ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Grace Period "></dx:ASPxLabel>
                </td>
                <td>
                    :
                </td>
                <td>
                    <dx:ASPxTextBox ID="gracePeriod" runat="server" Theme="Youthful" Text="0"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2"><dx:ASPxButton ID="generate" runat="server" Text="Generate" OnClick="generate_Click" Theme="Youthful"></dx:ASPxButton> </td>
                <td><dx:ASPxButton ID="reset" runat="server" Text="Reset" OnClick="reset_Click" Theme="Youthful"></dx:ASPxButton></td>
            </tr>
        </table>                
    </fieldset>
    </div>
    <div>
        <asp:UpdatePanel ID="panel2" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="generate" EventName="Click"/>
            </Triggers>
            <ContentTemplate>
        <fieldset>
            <legend>Hasil Perhitungan</legend>
            <table>
                <tr>
                    <td class="auto-style1">
                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Angsuran /bulan" ></dx:ASPxLabel>
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="angsuranTotal" runat="server" Width="170px" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Pokok"></dx:ASPxLabel>
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="angsuranPokok" runat="server" Width="170px" Theme="Youthful"></dx:ASPxTextBox>                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Bunga"></dx:ASPxLabel>
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="angsuranBunga" runat="server" Width="170px" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </fieldset>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div>        
        <asp:UpdatePanel ID="panel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="generate" EventName="Click"/>
            </Triggers>
            <ContentTemplate>
        <dx:ASPxGridView ID="GridView1" Settings-ShowFooter="true" runat="server" SettingsPager-Mode="ShowAllRecords" Theme="Youthful" Width="100%" AutoGenerateColumns="false" KeyFieldName="AngsuranKe">
            <Columns>
                <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="##,#.00" Caption="Angsuran Ke" FieldName="AngsuranKe" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="##,#.00" Caption="Sisa Pokok" FieldName="SisaPokok">                    
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="##,#.00" Caption="Hutang Pokok(a)" FieldName="HutangPokok" Name="HutangPokok">                    
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="##,#.00" Caption="Jasa Adm. (b)" FieldName="Bunga" Name="Bunga">                    
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn PropertiesTextEdit-DisplayFormatString="##,#.00" Caption="Angsuran (a+b)" FieldName="JmlBayar" Name="JmlBayar">                    
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="HutangPokok" ShowInColumn="HutangPokok" SummaryType="Sum" DisplayFormat="##,#.00"/>
                <dx:ASPxSummaryItem FieldName="Bunga" ShowInColumn="Bunga" SummaryType="Sum" DisplayFormat="##,#.00"/>
                <dx:ASPxSummaryItem FieldName="JmlBayar" ShowInColumn="JmlBayar" SummaryType="Sum" DisplayFormat="##,#.00"/>
            </TotalSummary>
        </dx:ASPxGridView>                
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="html_header">
    <style type="text/css">
        .auto-style1 {
            width: 131px;
        }
    </style>
</asp:Content>

