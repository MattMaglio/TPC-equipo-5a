<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="webApp.MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            
            margin-top: 20px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            line-height: 1.42857143;
            color: #333;
            background-color: #fff;
        }

        .ui-w-80 {
            width: 80px !important;
            height: auto;
        }

        .btn-default {
            border-color: rgba(24,28,33,0.1);
            background: rgba(0,0,0,0);
            color: #4E5155;
        }

        label.btn {
            margin-bottom: 0;
        }

        .btn-outline-primary {
            border-color: #26B4FF;
            background: transparent;
            color: #26B4FF;
        }

        .btn {
            cursor: pointer;
        }

        .text-light {
            color: #babbbc !important;
        }

        .btn-facebook {
            border-color: rgba(0,0,0,0);
            background: #3B5998;
            color: #fff;
        }

        .btn-instagram {
            border-color: rgba(0,0,0,0);
            background: #000;
            color: #fff;
        }

        .card {
            background-clip: padding-box;
            box-shadow: 0 1px 4px rgba(24,28,33,0.012);
        }

        .row-bordered {
            overflow: hidden;
        }

        .account-settings-fileinput {
            position: absolute;
            visibility: hidden;
            width: 1px;
            height: 1px;
            opacity: 0;
        }

        .account-settings-links .list-group-item.active {
            font-weight: bold !important;
        }

        html:not(.dark-style) .account-settings-links .list-group-item.active {
            background: transparent !important;
        }

        .account-settings-multiselect ~ .select2-container {
            width: 100% !important;
        }

        .light-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }

            .light-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

        .material-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24, 28, 33, 0.03) !important;
        }

            .material-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

        .dark-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(255, 255, 255, 0.03) !important;
        }

            .dark-style .account-settings-links .list-group-item.active {
                color: #fff !important;
            }

        .light-style .account-settings-links .list-group-item.active {
            color: #4E5155 !important;
        }

        .light-style .account-settings-links .list-group-item {
            padding: 0.85rem 1.5rem;
            border-color: rgba(24,28,33,0.03) !important;
        }

        .form-control {
            border: none;
            border-bottom: 1px solid #ced4da;
            background: transparent;
            box-shadow: none;
            padding: 10px 0;
            margin-bottom: 20px;
        }

            .form-control:focus {
                outline: none;
                border-bottom: 1px solid #007bff;
            }

        .form-group {
            position: relative;
        }

        .form-label {
            position: absolute;
            left: 0;
            top: -10px;
            font-size: 12px;
            color: #000;
            transition: 0.2s;
        }
        .switcher .switcher-input:checked + .switcher-indicator {
    background-color: #000; 
}

.switcher .switcher-input:checked + .switcher-indicator .switcher-yes {
    background-color: #000;
}

.switcher .switcher-input:checked + .switcher-indicator .switcher-no {
    background-color: transparent; 
}


       

        .btn-outline-primary {
            border-color: #6c757d;
            / background: transparent;
            color: #6c757d;
            transition: background-color 0.3s, color 0.3s;
        }

            .btn-outline-primary:hover {
                background-color: #6c757d;
                color: #fff;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container light-style flex-grow-1 container-p-y">

        <h4 class="font-weight-bold py-3 mb-4">Account settings
        </h4>

        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">General</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-change-password">Change password</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-info">Info</a>
<%--                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-social-links">Social links</a>--%>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#account-notifications">Notifications</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">

                            <div class="card-body media align-items-center">
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="d-block ui-w-80">
                                <div class="media-body ml-4">
                                    <label class="btn btn-outline-primary">
                                        Upload new photo
                    <input type="file" class="account-settings-fileinput">
                                    </label>
                                    &nbsp;
                  <button type="button" class="btn btn-default md-btn-flat">Reset</button>

                                    <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                </div>
                            </div>
                            <hr class="border-light m-0">

                            <div class="card-body">
                                <div class="form-group">
                                    <label class="form-label">Username</label>
                                    <input type="text" class="form-control mb-1" value="GolfEnthusiast">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Name</label>
                                    <input type="text" class="form-control" value="Joel">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Surname</label>
                                    <input type="text" class="form-control" value="Miller">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">E-mail</label>
                                    <input type="text" class="form-control mb-1" value="jmiller@mail.com">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Company</label>
                                    <input type="text" class="form-control" value="Fireflies Ltd.">
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="account-change-password">
                            <div class="card-body pb-2">

                                <div class="form-group">
                                    <label class="form-label">Current password</label>
                                    <input type="password" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label class="form-label">New password</label>
                                    <input type="password" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Repeat new password</label>
                                    <input type="password" class="form-control">
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-info">
                            <div class="card-body pb-2">

                               
                                <div class="form-group">
                                    <label class="form-label">Birthday</label>
                                    <input type="text" class="form-control" value="May 3, 1995">
                                </div>
                                                                        <div class="form-group">
    <label class="form-label">Adresses stored</label>
                                    <br />
    <select class="custom-select">
        <option>742 Evergreen Terrace, SP, USA</option>
        <option selected="">1640 Riverside Drive, Hill Valley, CA, USA</option>
        <option>167 Hemdale Street Los Angeles, CA, USA</option>
        <option>Segurola y Habana, CABA, Argentina</option>
       
    </select>
</div>
                                    <div class="form-group">
    <label class="form-label">Add new adress?</label>
                                    <br />
    <input type="text" class="form-control" value="new adress...">
</div>

                                    <%--<div class="form-group">
    <label class="form-label">Credit Cards stored</label>
                                    <br />
    <select class="custom-select">
        <option>XXXX-XXXX-XXXX-2545 VISA</option>
        <option selected="">XXXX-XXXX-XXXX-7855 AMEX</option>
        <option>XXXX-XXXX-XXXX-4455 CABAL</option>
       
    </select>
</div>
                                                                        <div class="form-group">
    <label class="form-label">Add new credit card?</label>
                                    <br />
    <input type="text" class="form-control" value="new credit card...">
</div>

--%>


                                


                            </div>
                            <hr class="border-light m-0">
                            <div class="card-body pb-2">

                             
                                <div class="form-group">
                                    <label class="form-label">Phone</label>
                                    <input type="text" class="form-control" value="+0 (123) 456 7891">
                                </div>
                               

                            </div>

                        </div>
                      <%--  <div class="tab-pane fade" id="account-social-links">
                            <div class="card-body pb-2">

                                <div class="form-group">
                                    <label class="form-label">Twitter</label>
                                    <input type="text" class="form-control" value="https://twitter.com/user">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Facebook</label>
                                    <input type="text" class="form-control" value="https://www.facebook.com/user">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Google+</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">LinkedIn</label>
                                    <input type="text" class="form-control" value="">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Instagram</label>
                                    <input type="text" class="form-control" value="https://www.instagram.com/user">
                                </div>

                            </div>
                        </div>--%>
                        
                        <div class="tab-pane fade" id="account-notifications">
                            <div class="card-body pb-2">

                                <h6 class="mb-4">Activity</h6>

                                <div class="form-group">
                                    <label class="switcher">
                                        <input type="checkbox" class="switcher-input" checked="">
                                        <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                        <span class="switcher-label">Email me when my item is on its way</span>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="switcher">
                                        <input type="checkbox" class="switcher-input" checked="">
                                        <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                        <span class="switcher-label">Email me when someone answers my question</span>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="switcher">
                                        <input type="checkbox" class="switcher-input">
                                        <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                        <span class="switcher-label">Email me when an item I follow is in stock</span>
                                    </label>
                                </div>
                            </div>
                            <hr class="border-light m-0">
                            <div class="card-body pb-2">

                                <h6 class="mb-4">Application</h6>

                                <div class="form-group">
                                    <label class="switcher">
                                        <input type="checkbox" class="switcher-input" checked="">
                                        <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                        <span class="switcher-label">News and announcements</span>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="switcher">
                                        <input type="checkbox" class="switcher-input">
                                        <span class="switcher-indicator">
                                            <span class="switcher-yes"></span>
                                            <span class="switcher-no"></span>
                                        </span>
                                        <span class="switcher-label">Weekly product updates</span>
                                    </label>
                                </div>
                                

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-right mt-3">
            <button type="button" class="btn btn-secondary">Save changes</button>&nbsp;
      <button type="button" class="btn btn-default">Cancel</button>
        </div>
        <br />
        <br />
    </div>







</asp:Content>
