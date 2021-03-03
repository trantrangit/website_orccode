<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="EditContact.aspx.cs" Inherits="cp_page_Contact_EditContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12">
                <ul class="page-breadcrumb">
                    <li><a href="/cp-banner">Contact</a></li>
                    <li>Edit contact</li>
                </ul>
            </div>
        </div>
        <div class="row page-title-container">
            <div class="col-md-12 col-xs-12 col-lg-12">
                <h4 class="page-title">EDIT CONTACT</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 form">
                <label>Content:* </label>
                 <textarea id="txtContent" class="tinymce" placeholder="Content"><%=contact.Content %></textarea>
                
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
              var content = tinymce.get('txtContent').getContent();
              //check exception
              CheckFieldEmpty('page');
              var error = CheckFieldError();

              if (error != "") { //has error
                  alertify.alert('Error', error);
              } else {
                  ShowLoading();
                  $.post(LOCAL_DO_URL + 'contact/edit-contact.aspx', {
                      content: content,
                      id: <%=contact.ID%>,
                  }, function (data) {
                      HideLoading();

                      if (data != 1) {
                          alertify.alert('Error', data);

                      } else {
                          alertify.success('Successful!');
                          location.href = "/cp-contact";
                      }
                  });
              }
          }

          function Cancel() {
              location.href = "/cp-contact";
          }
    </script>

    </asp:Content>
