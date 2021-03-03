<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Custom CSS -->    
    <link href="/stylesheet/contact/contactus.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="sec-qoute bg-logan sec-qourte-responsive ">
            <div class="container text-center">
                <div class="row">
                     <div class="container text-center">
                <div class="row">
                    <div class="col-sm-12 mt-5 mb-5">
                        <h1 class="text-logan">Ready To Upgrade Your
                            PSD to HTML Process?</h1>
                        <p >Get a quote today, or discuss how we can work together.
                            Email us at hello@cactuscoding.com or Call Us </p>
                        <p><strong>-or-</strong></p>
                        <div class="d-flex justify-content-center align-items-center">
                            <button class="btn btn-let">GET A QOUTE</button>

                        </div>
                        <div class="row mt-3">
                            <div class="col d-flex flex-row justify-content-center align-items-center">
                                <img src="images/home/satisfaction-badge.svg" alt="">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-xs-12 col-sm-4 col-md-4"><i class="fa fa-check-circle"></i> Unbeatable Service</div>
                            <div class="col-xs-12 col-sm-4 col-md-4"><i class="fa fa-check-circle"></i> 100% White Label</div>
                            <div class="col-xs-12 col-sm-4 col-md-4"><i class="fa fa-check-circle"></i> Money-Back Guarantee</div>
                        </div>
                    </div>
                </div>
                
            </div>
                </div>
            </div>
        </section>
   
    <section id="contact">
        <div class="container">
            <div class="row mt-5 mb-5">
                <div class="col-xs-12 col-sm-12">
                     <div class="title-contact">
                            <h1>CONTACT</h1>
                     </div>
                </div>
            </div>
            <div class="row mt-4 mb-4">
                <div class="col-xs-12 col-sm-12 col-md-4 context-address">
                    <h3>IT TRAINING LAB BY FERYA</h3>
                    <p>Head Office: 65/11 Nguyen Dinh Chieu St, Ward 4, Phunhuan District, HCMC, Vietnam</p>
                    <span><i class="fa fa-phone"></i></span><a href="tel: +84 903 174 903"> +84 903 174 903</a><br />
                    <span><i class="fa fa-envelope"></i></span><a href="mailto: nguyentu.am@feryao.org"> nguyentu.am@ferya.org</a><br />
                </div>
                <div class="col-xs-12 col-sm-12 col-md-8">
                     <div class="form-row row">
                        <div class="form-group col-md-6">
                          <label for="first-name">First name <span class="required-star">*</span></label>
                          <input type="text" class="form-control" id="first-name">
                        </div>
                        <div class="form-group col-md-6">
                          <label for="last-name">Last name  <span class="required-star">*</span></label>
                          <input type="text" class="form-control" id="last-name">
                        </div>
                     </div>
                    <div class="form-row row">
                        <div class="form-group col-md-6">
                          <label for="email">Email  <span class="required-star">*</span></label>
                          <input type="email" class="form-control" id="email">
                        </div>
                        <div class="form-group col-md-6">
                          <label for="phone">Password  <span class="required-star">*</span></label>
                          <input type="text" class="form-control" id="phone" >
                        </div>
                     </div>
                    <div class="form-row row">
                        <div class="form-group col-md-12">
                          <label for="message">Type your message</label>
                          <textarea class="form-control" id="message" rows="5">

                          </textarea>
                        </div>
                       
                     </div>
                     <button type="submit" class="btn btn-background">Submit</button>
                </div>


            </div>
        </div>
    </section>
</asp:Content>
