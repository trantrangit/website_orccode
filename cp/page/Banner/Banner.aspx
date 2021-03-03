<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Banner.aspx.cs" Inherits="cp_page_Banner_Banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row page-title-container">
            <div class="col-md-12 col-xs-12 col-lg-12">
                <h4 class="page-title">BANNER</h4>
            </div>
        </div>
        <div class="row page-control-container">
            <div class="col-md-6 col-lg-6 col-xs-6">
                <button class="btn btn-info" onclick="Add()">Add Banner</button>
            </div>        
        </div>
        <div class="row">
            <div class="col-md-12 col-xs-12 col-lg-12">
                <div class="pagination-table" id="paging-table">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Name</th>   
                                <th class="text-center">Title</th>                           
                                <th class="text-center">Banner</th>
                                <th class="text-center">Manage</th>
                               
                            </tr>
                        </thead>
                        <tbody class="pagination-body">
                            <%for (int i = 0; i < listBanber.Count; i++) {%>
                                <tr>
                                    <td><%=listBanber[i].ID %></td>
                                    <td><%=listBanber[i].Name %></td>
                                    <td><%=listBanber[i].TitleBN%></td>
                                    <td>
                                         <%if (System.IO.File.Exists(Server.MapPath("~/upload/banner/banner_" + listBanber[i].ID + ".jpg")))
                                    { %>
                                        <img style="width: 90px" class="img-responsive" src="/upload/banner/banner_<%=listBanber[i].ID %>.jpg?date=<%=DateTime.Now %>" />
                                        <% }
                                        else
                                        { %>
                                        <img src="/cp/images/default-image.jpg" width="100" height="100" />
                                        <%} %>
                                    </td>
                                    <td class="text-right">
                                        <button class="btn btn-info" onclick="AddImage(<%=listBanber[i].ID %>)">Image</button>
                                        <button class="btn btn-primary" onclick="Edit(<%=listBanber[i].ID %>)">Edit</button>
                                        <button class="btn btn-danger" onclick="Delete(<%=listBanber[i].ID %>)">Delete</button>
                                    </td>
                                </tr>
                            <%} %>
                        </tbody>
                    </table>
                    <div id="pagination"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            SetTabActive(2);

            Pagination(50, 'paging-table');
        });

        function Add() {
            location.href = "/cp-add-banner";
        }

        function AddImage(id) {
            location.href = "/cp-add-banner-image/id-" + id;
        }
        function Edit(id) {
            location.href = "/cp-edit-banner/id-" + id;
        }

        function Delete(id) {
            alertify.confirm('Are you sure you want to DELETE this?', function () {
                ShowLoading();

                $.post(LOCAL_DO_URL + 'banner/delete-banner.aspx', {
                    id: id,
                }, function (data) {
                    HideLoading();

                    if (data == 1) {
                        alertify.success('Deleted!');

                        // refresh page
                        location.reload();
                    } else {
                        alertify.alert(data);
                    }
                });
            });
        }
    </script>
</asp:Content>

