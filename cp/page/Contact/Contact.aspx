<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="cp_page_Contact_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container-fluid">
        <div class="row page-title-container">
            <div class="col-md-12 col-xs-12 col-lg-12">
                <h4 class="page-title">Contact</h4>
            </div>
        </div>
        <div class="row page-control-container">
            <div class="col-md-6 col-lg-6 col-xs-6">
                <button class="btn btn-info" onclick="Add()">Add Contact</button>
            </div>        
        </div>
        <div class="row">
            <div class="col-md-12 col-xs-12 col-lg-12">
                <div class="pagination-table" id="paging-table">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>                                                                           
                                <th class="text-center">Content</th>
                                <th class="text-center">Manage</th>
                               
                            </tr>
                        </thead>
                        <tbody class="pagination-body">
                            <%for (int i = 0; i < contact.Count; i++) {%>
                                <tr>
                                    <td><%=contact[i].ID %></td>
                                    <td><%=contact[i].Content %></td>                            
                                    <td class="text-right">                                   
                                        <button class="btn btn-primary" onclick="Edit(<%=contact[i].ID %>)">Edit</button>
                                        <button class="btn btn-danger" onclick="Delete(<%=contact[i].ID %>)">Delete</button>
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
            location.href = "/cp-add-contact";
        }    
        function Edit(id) {
            location.href = "/cp-edit-contact/id-" + id;
        }

        function Delete(id) {
            alertify.confirm('Are you sure you want to DELETE this?', function () {
                ShowLoading();

                $.post(LOCAL_DO_URL + 'contact/delete-contact.aspx', {
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

