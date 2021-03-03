<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="AddBannerImg.aspx.cs" Inherits="cp_page_Banner_AddBanner" %>

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
                <h4 class="page-title">ADD Banner</h4>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-6 col-lg-6 col-xs-6 form">
                <img src="/upload/banner/banner_<%=bannerID%>.jpg?date=<%=DateTime.Now %>" class="img-responsive center-block" width="250" />
                 
            </div>
        </div>
        <hr />
        <form class="row" runat="server">
            <div class="col-sm-6 col-md-6 col-xs-12">
                <h3 class="box-title">Upload Banner</h3>
                <img src="/cp/images/default-image.jpg" id="imgAvatar" runat="server" width="250" /><br />
                <asp:Label ID="lblStatus" runat="server" Text="Upload status: "></asp:Label>
            </div>
            <div class="col-sm-6 col-md-6 col-xs-12">
                <h3>
                    <br />
                </h3>
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="btn btn-info" /><br />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary"   OnClick="btnUpload_Click"   />
            </div>
        </form>
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
              $("#btnUpload").click(function () {
                  Add();
              });
          });

          function Submit() {
              ShowLoading();
              location.href = "/cp-banner";
          }

          function Cancel() {
              location.href = "/cp-banner";
          }
    </script>
</asp:Content>

