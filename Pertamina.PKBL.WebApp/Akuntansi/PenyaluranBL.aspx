<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PenyaluranBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PenyaluranBL" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
            <h2 class="page-header">Penyaluran Bina Lingkungan</h2>
            <div class="row">
                <dx:ASPxGridView ID="gvPenyaluran" runat="server" AutoGenerateColumns="False" Theme="Youthful"
                    Width="100%" KeyFieldName="id" OnPageIndexChanged="gvPenyaluran_PageIndexChanged" OnCustomButtonInitialize="gvPenyaluran_CustomButtonInitialize" OnCustomButtonCallback="gvPenyaluran_CustomButtonCallback" SettingsBehavior-AllowFocusedRow="true" ClientInstanceName="grid" >
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Kode" VisibleIndex="1" FieldName="form_number" Name="form_number"></dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="Nama" FieldName="requestor_name" Name="requestor_name" VisibleIndex="2" ReadOnly="true">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="Nama Instansi" FieldName="requestor_company" Name="requestor_company" VisibleIndex="3" ReadOnly="true">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="Alamat" FieldName="requestor_address" Name="requestor_address" VisibleIndex="4" ReadOnly="true">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataDateColumn Caption="Tanggal" FieldName="approval_result_date" Name="approval_result_date" VisibleIndex="5" ReadOnly="true">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>

                        <dx:GridViewDataTextColumn Caption="Nilai Disetujui " FieldName="granted_amount" Name="granted_amount" VisibleIndex="6" CellStyle-HorizontalAlign="Right">
                            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="Nilai Realisasi" FieldName="total_Penyaluran" Name="total_Penyaluran"  VisibleIndex="12" ReadOnly="true" CellStyle-HorizontalAlign="Right">
                            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="Cabang" Name="branch_name" FieldName="branch_name" VisibleIndex="14"></dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="User Log" FieldName="UserLog" Name="UserLog" VisibleIndex="15"></dx:GridViewDataTextColumn>

                        <dx:GridViewCommandColumn Name="opr" Caption="Opr." ShowClearFilterButton="True" ButtonType="Image" ShowEditButton="false" ShowNewButtonInHeader="false" VisibleIndex="13">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton  ID="Detail" Text="Detail" Visibility="AllDataRows">
                                    <Image Url="../content/images/checklist.png"></Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>

                    </Columns>
                    <SettingsCommandButton>
                        <NewButton>
                            <Image ToolTip="New" Url="../content/images/new.png" />
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
                    <SettingsDataSecurity AllowDelete="False" />
                    <SettingsPager AlwaysShowPager="True"></SettingsPager>
                    <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                    <Styles>
                        <CommandColumn Spacing="5px" />
                        <EditingErrorRow HorizontalAlign="Right">
                        </EditingErrorRow>
                    </Styles>
                    <Styles>
                        <CommandColumn Spacing="5px" />
                        <EditingErrorRow HorizontalAlign="Right">
                        </EditingErrorRow>
                        <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
                    </Styles>
                    <StylesPager>
                         <CurrentPageNumber BackColor="#FB000C" >
                         </CurrentPageNumber>
                    </StylesPager>
                </dx:ASPxGridView>
            </div>
          
</asp:Content>
