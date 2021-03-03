<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Addbanner.aspx.cs" Inherits="cp_page_Banner_Addbanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12">
                <ul class="page-breadcrumb">
                    <li><a href="/cp-banner">Banner</a></li>
                    <li>Add banner</li>
                </ul>
            </div>
        </div>
        <div class="row page-title-container">
            <div class="col-md-12 col-xs-12 col-lg-12">
                <h4 class="page-title">ADD BANNER</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 form">
                <label>Name:* </label>
                <input  id="txtName" class="required">
                
            </div>
        </div>
       <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 form">
                <label>Title:* </label>
                <input  id="txtTitle" class="required">
                
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 form">
                <button class="btn btn-primary" onclick="Submit()">Submit</button>
                <button class="btn btn-danger" onclick="Cancel()">Cancel</button>
            </div>
        </div>
    </div>
      <script>
          $(document).ready(function () {
              SetTabActive(6);

          });
          function Submit() {
              var name = $("#txtName").val();
              var title = $("#txtTitle").val();

              //check exception
              CheckFieldEmpty('page');
              var error = CheckFieldError();

              if (error != "") { //has error
                  alertify.alert('Error', error);
              }else{
                  ShowLoading();                           
                  $.post(LOCAL_DO_URL + 'banner/add-banner.aspx', {
                      name: name,
                      title: title

                  }, function (data) {
                      HideLoading();

                      if (data != 1) {
                          alertify.alert('Error', data);
                         
                      } else {
                          alertify.success('Successful!');
                          location.href = "/cp-banner";
                      }
                  });
              }           
          }
          function Cancel() {
              location.href = "/cp-banner";
          }
    </script>
</asp:Content>

