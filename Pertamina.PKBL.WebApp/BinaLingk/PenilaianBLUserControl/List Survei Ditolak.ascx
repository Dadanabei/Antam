<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List Survei Ditolak.ascx.cs" Inherits="Pertamina.PKBL.WebApp.BinaLingk.UserControlBl.List_Survei_Ditolak" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<div>
    <table>
        <tr>
            <td>
            <asp:TextBox runat="server" ID="txtSearch"></asp:TextBox> 
            <asp:Button runat="server" ID="btnSearch" Text="Cari" OnClick="btnSearch_Click"/>
            <asp:Button runat="server" ID="btnClear" Text="Kosongkan" OnClick="btnClear_Click"/>
            
            </td>
        </tr>

    </table>
</div>
<br />
<div>
    <dx:ASPxGridView ID="gvBlPenilaian" runat="server" AutoGenerateColumns="False" Styles-Header-HorizontalAlign="center" Width="100%" Theme="Youthful"
           KeyFieldName="account_id" >
            <Columns>
                <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="3"  Width="5%" Caption="Opr." ShowClearFilterButton="True" >
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="No" Name="No" VisibleIndex="0" Width="5%">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="No Form"   VisibleIndex="1" Width="5%" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nama" Name="branch_code" VisibleIndex="2" Width="15%" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Instansi" VisibleIndex="2" Width="10" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Alamat" VisibleIndex="2" Width="28" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Nilai Rekomendasi"  VisibleIndex="2" Width="10%" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="JBL"  VisibleIndex="2" Width="5%" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="REK" Name="branch_code" VisibleIndex="2" Width="2" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="File"  VisibleIndex="2" Width="5" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="OPR" Name="branch_code" VisibleIndex="2" Width="10%">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Cabang"  VisibleIndex="2" Width="5" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Userlog" Name="branch_code" VisibleIndex="2" Width="10%">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsCommandButton>
                
                <NewButton>
                     <Image ToolTip="New" Url="../../content/images/new.png"/>
                </NewButton>
                <EditButton>
                    <Image ToolTip="Edit" Url="../content/images/edit.png" />
                </EditButton>
                <DeleteButton>
                    <Image ToolTip="Delete" Url="../content/images/delete.png" />
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsEditing Mode="PopupEditForm"  EditFormColumnCount="1">

            </SettingsEditing>
            <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsDataSecurity AllowDelete="False" />
         <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
         </Styles>
            <Settings ShowFilterRow="True" />

    <Styles>
        <Header HorizontalAlign="Center"></Header>
    </Styles>
    </dx:ASPxGridView>
</div>