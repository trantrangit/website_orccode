﻿<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="EditBanner.aspx.cs" Inherits="cp_page_Banner_EditBanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12">
                <ul class="page-breadcrumb">
                    <li><a href="/cp-banner">Banner</a></li>
                    <li>Edit banner</li>
                </ul>
            </div>
        </div>
        <div class="row page-title-container">
            <div class="col-md-12 col-xs-12 col-lg-12">
                <h4 class="page-title">EDIT BANNER</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 form">
                <label>Name:* </label>
                <input  id="txtName" class="required" value=<%=banner.Name %>>
                
            </div>
        </div>
          <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 form">
                <label>Title:* </label>
                <input  id="txttitle" class="required" value=<%=banner.TitleBN %>>
                
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
              SetTabActive(2);
           
          });

          $(document).ready(function () {
              SetTabActive(7);
          });
          function Submit() {
              var name = $("#txtName").val();
              var title = $("#txttitle").val();
        
              CheckFieldEmpty('#page');

              var error = "";
              error += CheckFieldError();

              if (error == "") {
                  ShowLoading();
                  $.post(LOCAL_DO_URL + 'banner/edit-banner.aspx', {              
                      name: name,
                      title: title,
                      id: <%=banner.ID%>,
                  }, function (data) {
                      HideLoading();

                      if (data == 1) {
                          alertify.success('Successful!');
                          location.href = "/cp-banner";
                      } else {
                          alertify.alert('Error', data);
                      }
                  });
              } else {
                  alertify.alert('Error', error);
              }
          }

          function Cancel() {
              location.href = "/cp-banner";
          }
    </script>
</asp:Content>

