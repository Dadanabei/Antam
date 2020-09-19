<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PenilaianBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PenilaianBL" %>


<%@ Register Src="~/BinaLingk/ListBInalingkungan.ascx" TagPrefix="uc1" TagName="ListBInalingkungan" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
          
        <h2 class="page-header">Lembar Survei Bina Lingkungan</h2>

<br />
<div>
    <dx:ASPxGridView ID="gvBlPenilaian" runat="server" AutoGenerateColumns="False" Styles-Header-HorizontalAlign="center" Width="100%" Theme="Youthful"
           KeyFieldName="id" OnRowUpdating="gvBlPenilaian_RowUpdating" OnHtmlRowPrepared="gvBlPenilaian_HtmlRowPrepared" >
            <Columns>
              
                <dx:GridViewDataTextColumn Caption="#" Name="#" VisibleIndex="0" Width="5%">
                      <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="id"  FieldName="id" Name="id"  visible="false" Width="5%" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="No Form"  FieldName="form_number" Name="form_number"  VisibleIndex="1" Width="5%" ReadOnly="true">
                    
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nama" Name="requestor_name"  FieldName="requestor_name" VisibleIndex="2" Width="15%" ReadOnly="true" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Instansi" VisibleIndex="3" Name="requestor_company" FieldName="requestor_company" Width="10"  ReadOnly="true">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Alamat" VisibleIndex="4" Name="requestor_address" FieldName="requestor_address" Width="28" ReadOnly="true" >
                       <EditFormSettings Visible="true" />
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="No Proposal" Name="proposal_number"  VisibleIndex="5" FieldName="proposal_number" Width="10%" ReadOnly="true" >
                       <EditFormSettings Visible="true" />
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="JBL"  VisibleIndex="6" Name="binaling_kind_id" FieldName="binaling_kind_id" Width="5%" ReadOnly="true" >
                       <EditFormSettings Visible="true" />
                </dx:GridViewDataTextColumn>
               <dx:GridViewDataComboBoxColumn Caption="Status" VisibleIndex="7" Width="10%"  Name="evaluation_result" FieldName="evaluation_result">        
                    <EditFormSettings ColumnSpan="4" />
                   <PropertiesComboBox>
                       <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                           <RequiredField IsRequired="True" />
                       </ValidationSettings>
                   </PropertiesComboBox>
               </dx:GridViewDataComboBoxColumn>
                <dx:GridViewCommandColumn Caption="Opr" Name="opr" ShowClearFilterButton="True" ButtonType="Image" ShowEditButton="True" Width="5%"  VisibleIndex="8">
                </dx:GridViewCommandColumn>
                 <dx:GridViewDataTextColumn Caption="Cabang"  Name="branch_code" fieldname="branch_code" VisibleIndex="9" Width="5" >
                       <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="UserLog" Name="created_by" FieldName="created_by" VisibleIndex="10" Width="10%">
                       <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nilai Rekomandasi" Visible="false" Name="recomended_amount" FieldName="recomended_amount" VisibleIndex="10" Width="80%">
                    <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true">
                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>   
                    <EditFormSettings Visible="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nilai Diminta" Visible="false" ReadOnly="true" Name="requested_amount" FieldName="requested_amount" VisibleIndex="9" Width="80%">
                    <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true"></PropertiesTextEdit>   
                       <EditFormSettings Visible="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="Deskripsi" Visible="false" VisibleIndex="11" PropertiesMemoEdit-Height="50px" Name="survey_result_descr" FieldName="survey_result_descr">
                    <EditFormSettings Visible="True" ColumnSpan="2" />
                    <EditFormCaptionStyle VerticalAlign="Top"></EditFormCaptionStyle>
                    <PropertiesMemoEdit>
                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesMemoEdit>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn Caption="brnch" Visible="false" Name="branch_code" FieldName="branch_code" VisibleIndex="10" Width="80%" >
                       <EditFormSettings Visible="false" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="brnch" Visible="false" Name="approval_result" FieldName="approval_result" VisibleIndex="10" Width="80%" >
                       <EditFormSettings Visible="false" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsCommandButton>
                
                <NewButton>
                     <Image ToolTip="New" Url="~/content/images/new.png"/>
                </NewButton>
                <EditButton>
                    <Image ToolTip="Edit" Url="~/content/images/edit.png" />
                </EditButton>
                <DeleteButton>
                    <Image ToolTip="Delete" Url="~/content/images/delete.png" />
                </DeleteButton>
                <UpdateButton>
                 <Image ToolTip="update" Url="~/content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="~/content/images/delete-rect.png"></Image>
             </CancelButton>
            </SettingsCommandButton>
            <SettingsEditing Mode="PopupEditForm"  EditFormColumnCount="2" >

            </SettingsEditing>
            <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
                <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" Width="600"></EditForm>
            </SettingsPopup>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsDataSecurity AllowDelete="False" />
         <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
         </Styles>
         <SettingsPager AlwaysShowPager="True"></SettingsPager>
            <Settings ShowFilterRow="True" />
         <StylesPager>
             <CurrentPageNumber BackColor="#FB000C">
             </CurrentPageNumber>
         </StylesPager>
    <Styles>
        <Header HorizontalAlign="Center"></Header>
    </Styles>
    </dx:ASPxGridView>
</div>
<div>
    <uc1:listbinalingkungan runat="server" ID="ListBInalingkungan" />
</div>

                
                
                

         
        <div class="row">
            <div class="col-md-10" style="overflow-x:scroll;">
                
                
                 
               <%-- <img id="img01" src="<%=ResolveUrl("~/content/images/ss/binalingk-penilaian-listsurveyditerima.jpg") %>" />--%>
            </div>
        </div>
        <hr />
        <div style="margin-top:30px;opacity:0.35;">
          
          

            <%--<a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/binalingk-penilaian-daftarcif.jpg") %>'">(list CIF)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/binalingk-penilaian-daftarcif-add.jpg") %>'">(list CIF &rArr; add)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/binalingk-penilaian-listsurveyditolak.jpg") %>'">(list ditolak)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/binalingk-penilaian-listsurveyditerima-edit.jpg") %>'">(list diterima &rArr; edit)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/binalingk-penilaian-listsurveyditerima.jpg") %>'">(list diterima)</a>--%>
        </div>
    </div>
</asp:Content>
