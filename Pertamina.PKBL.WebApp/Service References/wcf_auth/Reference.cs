﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pertamina.PKBL.WebApp.wcf_auth {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ResponseUsersData", Namespace="http://schemas.datacontract.org/2004/07/WCFUserManagement")]
    [System.SerializableAttribute()]
    public partial class ResponseUsersData : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private Pertamina.PKBL.WebApp.wcf_auth.ResponseMessageClass ResponseMessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private Pertamina.PKBL.WebApp.wcf_auth.GeneralUserProfile UserPropertiesListField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Pertamina.PKBL.WebApp.wcf_auth.ResponseMessageClass ResponseMessage {
            get {
                return this.ResponseMessageField;
            }
            set {
                if ((object.ReferenceEquals(this.ResponseMessageField, value) != true)) {
                    this.ResponseMessageField = value;
                    this.RaisePropertyChanged("ResponseMessage");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Pertamina.PKBL.WebApp.wcf_auth.GeneralUserProfile UserPropertiesList {
            get {
                return this.UserPropertiesListField;
            }
            set {
                if ((object.ReferenceEquals(this.UserPropertiesListField, value) != true)) {
                    this.UserPropertiesListField = value;
                    this.RaisePropertyChanged("UserPropertiesList");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ResponseMessageClass", Namespace="http://schemas.datacontract.org/2004/07/WCFUserManagement")]
    [System.SerializableAttribute()]
    public partial class ResponseMessageClass : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DescField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string MessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string TypeField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Desc {
            get {
                return this.DescField;
            }
            set {
                if ((object.ReferenceEquals(this.DescField, value) != true)) {
                    this.DescField = value;
                    this.RaisePropertyChanged("Desc");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Message {
            get {
                return this.MessageField;
            }
            set {
                if ((object.ReferenceEquals(this.MessageField, value) != true)) {
                    this.MessageField = value;
                    this.RaisePropertyChanged("Message");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Type {
            get {
                return this.TypeField;
            }
            set {
                if ((object.ReferenceEquals(this.TypeField, value) != true)) {
                    this.TypeField = value;
                    this.RaisePropertyChanged("Type");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="GeneralUserProfile", Namespace="http://schemas.datacontract.org/2004/07/Pertamina.Lib")]
    [System.SerializableAttribute()]
    public partial class GeneralUserProfile : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string ApplicationNameField;
        
        private string mAddressField;
        
        private Pertamina.PKBL.WebApp.wcf_auth.GeneralUserAuthObjectValue[] mAuthObjectValueListField;
        
        private string mCompanyCodeField;
        
        private string mEmailField;
        
        private string mEmployeeNoField;
        
        private string mFullNameField;
        
        private bool mIsApprovedField;
        
        private bool mIsLockedOutField;
        
        private bool mProfileExistField;
        
        private string mRemarksField;
        
        private string[] mRoleGroupListField;
        
        private string[] mRoleGroupNameListField;
        
        private string[] mRoleListField;
        
        private string mTelephoneField;
        
        private string mTitleField;
        
        private string[] mUserGroupListField;
        
        private string mUserIdField;
        
        private string mUserNameField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string ApplicationName {
            get {
                return this.ApplicationNameField;
            }
            set {
                if ((object.ReferenceEquals(this.ApplicationNameField, value) != true)) {
                    this.ApplicationNameField = value;
                    this.RaisePropertyChanged("ApplicationName");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mAddress {
            get {
                return this.mAddressField;
            }
            set {
                if ((object.ReferenceEquals(this.mAddressField, value) != true)) {
                    this.mAddressField = value;
                    this.RaisePropertyChanged("mAddress");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public Pertamina.PKBL.WebApp.wcf_auth.GeneralUserAuthObjectValue[] mAuthObjectValueList {
            get {
                return this.mAuthObjectValueListField;
            }
            set {
                if ((object.ReferenceEquals(this.mAuthObjectValueListField, value) != true)) {
                    this.mAuthObjectValueListField = value;
                    this.RaisePropertyChanged("mAuthObjectValueList");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mCompanyCode {
            get {
                return this.mCompanyCodeField;
            }
            set {
                if ((object.ReferenceEquals(this.mCompanyCodeField, value) != true)) {
                    this.mCompanyCodeField = value;
                    this.RaisePropertyChanged("mCompanyCode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mEmail {
            get {
                return this.mEmailField;
            }
            set {
                if ((object.ReferenceEquals(this.mEmailField, value) != true)) {
                    this.mEmailField = value;
                    this.RaisePropertyChanged("mEmail");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mEmployeeNo {
            get {
                return this.mEmployeeNoField;
            }
            set {
                if ((object.ReferenceEquals(this.mEmployeeNoField, value) != true)) {
                    this.mEmployeeNoField = value;
                    this.RaisePropertyChanged("mEmployeeNo");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mFullName {
            get {
                return this.mFullNameField;
            }
            set {
                if ((object.ReferenceEquals(this.mFullNameField, value) != true)) {
                    this.mFullNameField = value;
                    this.RaisePropertyChanged("mFullName");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public bool mIsApproved {
            get {
                return this.mIsApprovedField;
            }
            set {
                if ((this.mIsApprovedField.Equals(value) != true)) {
                    this.mIsApprovedField = value;
                    this.RaisePropertyChanged("mIsApproved");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public bool mIsLockedOut {
            get {
                return this.mIsLockedOutField;
            }
            set {
                if ((this.mIsLockedOutField.Equals(value) != true)) {
                    this.mIsLockedOutField = value;
                    this.RaisePropertyChanged("mIsLockedOut");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public bool mProfileExist {
            get {
                return this.mProfileExistField;
            }
            set {
                if ((this.mProfileExistField.Equals(value) != true)) {
                    this.mProfileExistField = value;
                    this.RaisePropertyChanged("mProfileExist");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mRemarks {
            get {
                return this.mRemarksField;
            }
            set {
                if ((object.ReferenceEquals(this.mRemarksField, value) != true)) {
                    this.mRemarksField = value;
                    this.RaisePropertyChanged("mRemarks");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string[] mRoleGroupList {
            get {
                return this.mRoleGroupListField;
            }
            set {
                if ((object.ReferenceEquals(this.mRoleGroupListField, value) != true)) {
                    this.mRoleGroupListField = value;
                    this.RaisePropertyChanged("mRoleGroupList");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string[] mRoleGroupNameList {
            get {
                return this.mRoleGroupNameListField;
            }
            set {
                if ((object.ReferenceEquals(this.mRoleGroupNameListField, value) != true)) {
                    this.mRoleGroupNameListField = value;
                    this.RaisePropertyChanged("mRoleGroupNameList");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string[] mRoleList {
            get {
                return this.mRoleListField;
            }
            set {
                if ((object.ReferenceEquals(this.mRoleListField, value) != true)) {
                    this.mRoleListField = value;
                    this.RaisePropertyChanged("mRoleList");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mTelephone {
            get {
                return this.mTelephoneField;
            }
            set {
                if ((object.ReferenceEquals(this.mTelephoneField, value) != true)) {
                    this.mTelephoneField = value;
                    this.RaisePropertyChanged("mTelephone");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mTitle {
            get {
                return this.mTitleField;
            }
            set {
                if ((object.ReferenceEquals(this.mTitleField, value) != true)) {
                    this.mTitleField = value;
                    this.RaisePropertyChanged("mTitle");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string[] mUserGroupList {
            get {
                return this.mUserGroupListField;
            }
            set {
                if ((object.ReferenceEquals(this.mUserGroupListField, value) != true)) {
                    this.mUserGroupListField = value;
                    this.RaisePropertyChanged("mUserGroupList");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mUserId {
            get {
                return this.mUserIdField;
            }
            set {
                if ((object.ReferenceEquals(this.mUserIdField, value) != true)) {
                    this.mUserIdField = value;
                    this.RaisePropertyChanged("mUserId");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mUserName {
            get {
                return this.mUserNameField;
            }
            set {
                if ((object.ReferenceEquals(this.mUserNameField, value) != true)) {
                    this.mUserNameField = value;
                    this.RaisePropertyChanged("mUserName");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="GeneralUserAuthObjectValue", Namespace="http://schemas.datacontract.org/2004/07/Pertamina.Lib")]
    [System.SerializableAttribute()]
    public partial class GeneralUserAuthObjectValue : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string Value1Field;
        
        private string Value2Field;
        
        private string mAuthObjectNameField;
        
        private string[] mAuthObjectNameListField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string Value1 {
            get {
                return this.Value1Field;
            }
            set {
                if ((object.ReferenceEquals(this.Value1Field, value) != true)) {
                    this.Value1Field = value;
                    this.RaisePropertyChanged("Value1");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string Value2 {
            get {
                return this.Value2Field;
            }
            set {
                if ((object.ReferenceEquals(this.Value2Field, value) != true)) {
                    this.Value2Field = value;
                    this.RaisePropertyChanged("Value2");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string mAuthObjectName {
            get {
                return this.mAuthObjectNameField;
            }
            set {
                if ((object.ReferenceEquals(this.mAuthObjectNameField, value) != true)) {
                    this.mAuthObjectNameField = value;
                    this.RaisePropertyChanged("mAuthObjectName");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public string[] mAuthObjectNameList {
            get {
                return this.mAuthObjectNameListField;
            }
            set {
                if ((object.ReferenceEquals(this.mAuthObjectNameListField, value) != true)) {
                    this.mAuthObjectNameListField = value;
                    this.RaisePropertyChanged("mAuthObjectNameList");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="wcf_auth.IAuthenticateUser")]
    public interface IAuthenticateUser {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAuthenticateUser/AuthenticateUserAD", ReplyAction="http://tempuri.org/IAuthenticateUser/AuthenticateUserADResponse")]
        Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData AuthenticateUserAD(string CompanyCode, string DomainName, string ApplicationName, string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAuthenticateUser/AuthenticateUserAD", ReplyAction="http://tempuri.org/IAuthenticateUser/AuthenticateUserADResponse")]
        System.Threading.Tasks.Task<Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData> AuthenticateUserADAsync(string CompanyCode, string DomainName, string ApplicationName, string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAuthenticateUser/AuthAD", ReplyAction="http://tempuri.org/IAuthenticateUser/AuthADResponse")]
        Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData AuthAD(string DomainName, string UserName, string Password);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAuthenticateUser/AuthAD", ReplyAction="http://tempuri.org/IAuthenticateUser/AuthADResponse")]
        System.Threading.Tasks.Task<Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData> AuthADAsync(string DomainName, string UserName, string Password);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IAuthenticateUserChannel : Pertamina.PKBL.WebApp.wcf_auth.IAuthenticateUser, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class AuthenticateUserClient : System.ServiceModel.ClientBase<Pertamina.PKBL.WebApp.wcf_auth.IAuthenticateUser>, Pertamina.PKBL.WebApp.wcf_auth.IAuthenticateUser {
        
        public AuthenticateUserClient() {
        }
        
        public AuthenticateUserClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public AuthenticateUserClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AuthenticateUserClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AuthenticateUserClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData AuthenticateUserAD(string CompanyCode, string DomainName, string ApplicationName, string UserName, string Password) {
            return base.Channel.AuthenticateUserAD(CompanyCode, DomainName, ApplicationName, UserName, Password);
        }
        
        public System.Threading.Tasks.Task<Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData> AuthenticateUserADAsync(string CompanyCode, string DomainName, string ApplicationName, string UserName, string Password) {
            return base.Channel.AuthenticateUserADAsync(CompanyCode, DomainName, ApplicationName, UserName, Password);
        }
        
        public Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData AuthAD(string DomainName, string UserName, string Password) {
            return base.Channel.AuthAD(DomainName, UserName, Password);
        }
        
        public System.Threading.Tasks.Task<Pertamina.PKBL.WebApp.wcf_auth.ResponseUsersData> AuthADAsync(string DomainName, string UserName, string Password) {
            return base.Channel.AuthADAsync(DomainName, UserName, Password);
        }
    }
}
