﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pertamina.PKBL.WebApp.wcf_domain_list {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="DomainList", Namespace="http://schemas.datacontract.org/2004/07/WCFUserManagement")]
    [System.SerializableAttribute()]
    public partial class DomainList : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string CompanyCodeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string CompanyNameField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DomainNameField;
        
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
        public string CompanyCode {
            get {
                return this.CompanyCodeField;
            }
            set {
                if ((object.ReferenceEquals(this.CompanyCodeField, value) != true)) {
                    this.CompanyCodeField = value;
                    this.RaisePropertyChanged("CompanyCode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CompanyName {
            get {
                return this.CompanyNameField;
            }
            set {
                if ((object.ReferenceEquals(this.CompanyNameField, value) != true)) {
                    this.CompanyNameField = value;
                    this.RaisePropertyChanged("CompanyName");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string DomainName {
            get {
                return this.DomainNameField;
            }
            set {
                if ((object.ReferenceEquals(this.DomainNameField, value) != true)) {
                    this.DomainNameField = value;
                    this.RaisePropertyChanged("DomainName");
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
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="wcf_domain_list.IGetAllDomain")]
    public interface IGetAllDomain {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IGetAllDomain/GetAllDomainName", ReplyAction="http://tempuri.org/IGetAllDomain/GetAllDomainNameResponse")]
        Pertamina.PKBL.WebApp.wcf_domain_list.DomainList[] GetAllDomainName();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IGetAllDomain/GetAllDomainName", ReplyAction="http://tempuri.org/IGetAllDomain/GetAllDomainNameResponse")]
        System.Threading.Tasks.Task<Pertamina.PKBL.WebApp.wcf_domain_list.DomainList[]> GetAllDomainNameAsync();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IGetAllDomainChannel : Pertamina.PKBL.WebApp.wcf_domain_list.IGetAllDomain, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class GetAllDomainClient : System.ServiceModel.ClientBase<Pertamina.PKBL.WebApp.wcf_domain_list.IGetAllDomain>, Pertamina.PKBL.WebApp.wcf_domain_list.IGetAllDomain {
        
        public GetAllDomainClient() {
        }
        
        public GetAllDomainClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public GetAllDomainClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public GetAllDomainClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public GetAllDomainClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public Pertamina.PKBL.WebApp.wcf_domain_list.DomainList[] GetAllDomainName() {
            return base.Channel.GetAllDomainName();
        }
        
        public System.Threading.Tasks.Task<Pertamina.PKBL.WebApp.wcf_domain_list.DomainList[]> GetAllDomainNameAsync() {
            return base.Channel.GetAllDomainNameAsync();
        }
    }
}
