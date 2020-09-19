<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DaftarTransfer.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.TransferDanaBankControl.DaftarTransfer" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<div class="borderdetail">
    <table style="width:75%">
        <tr>
            <td>
                Dari Tanggal
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTanggal1" Theme="Youthful"></dx:ASPxDateEdit>
            </td>
            <td style="width:20px">

            </td>
            <td>
                Hingga Tanggal
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTaggal2" Theme="Youthful"></dx:ASPxDateEdit>
            </td>
            <td style="width:20px">

            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnFilter" Theme="Youthful" Text="Filter" OnClick="btnFilter_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <dx:ASPxGridView runat="server" ID="gvDaftarTransfer" Width="100%" Theme="Youthful" KeyFieldName="NoBukti" Settings-ShowGroupedColumns="true">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No" Name="NoBukti" FieldName="NoBukti">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tanggal # Bukti" Name="TglBukti" FieldName="TglBukti">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Akun" Width="50%" Name="coa" FieldName="coa">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Debet" Name="debet" FieldName="debet" PropertiesTextEdit-DisplayFormatString="##,#.00">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kredit" Name="kredit" FieldName="kredit" PropertiesTextEdit-DisplayFormatString="##,#.00">
            </dx:GridViewDataTextColumn>
             <dx:GridViewCommandColumn Caption="Opr." ButtonType="Image">  
                 <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnPrint" Text="Print" Visibility="AllDataRows" Image-ToolTip="tambah">
                        <Image Url="~/content/images/print.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>               
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Area" FieldName="KodeCabang" Name="KodeCabang">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Userlog">
            </dx:GridViewDataTextColumn>
           
        </Columns>
        <SettingsCommandButton>
            <NewButton>
                <Image ToolTip="New" Url="../content/images/new.png"/>
            </NewButton>
            <EditButton>
                <Image ToolTip="Edit" Url="../content/images/edit.png" />
            </EditButton>
            <DeleteButton>
                <Image ToolTip="Delete" Url="../content/images/delete.png" />
            </DeleteButton>
             <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
        </SettingsCommandButton>

            <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
                    <Settings  ShowColumnHeaders="true"/>
                     <Settings  ShowTitlePanel="true"/>

                    <SettingsPager AlwaysShowPager="True"></SettingsPager>
                    <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                    <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
                    <SettingsPopup>
                        <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
                    </SettingsPopup>
                    <Styles>
                        <CommandColumn Spacing="5px" />
                        <EditingErrorRow HorizontalAlign="Right">
                        </EditingErrorRow>
                        <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
                    </Styles>
        <SettingsPager PageSize="100"></SettingsPager>
                    <StylesPager>
                         <CurrentPageNumber BackColor="#FB000C" >
                         </CurrentPageNumber>
                     </StylesPager>
    </dx:ASPxGridView>

</div>
