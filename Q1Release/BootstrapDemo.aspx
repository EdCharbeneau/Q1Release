<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BootstrapDemo.aspx.cs" Inherits="Q1Release.BootstrapDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .RadInput, .RadDropDownList_Bootstrap {
            width: 100%;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login</h3>
                    </div>
                    <div class="panel-body">

                        <div class="form-group">
                            <!-- Email -->
                            <asp:Label AssociatedControlID="EmailAddress" runat="server" ID="EmailLabel" Text="Email address"></asp:Label>
                            <telerik:RadTextBox runat="server" ID="EmailAddress" EmptyMessage="Enter email"></telerik:RadTextBox>
                        </div>

                        <!-- Password -->
                        <div class="form-group">
                            <asp:Label AssociatedControlID="Password" runat="server" ID="PasswordLabel" Text="Password"></asp:Label>
                            <telerik:RadTextBox runat="server" ID="Password" EmptyMessage="Password" TextMode="Password"></telerik:RadTextBox>
                        </div>

                        <!-- Drop down -->
                        <div class="form-group">
                            <asp:Label AssociatedControlID="AgeSelection" runat="server" ID="AgeSelectionLabel" Text="Your age"></asp:Label>
                            <telerik:RadDropDownList ID="AgeSelection" runat="server">
                                <Items>
                                    <telerik:DropDownListItem Text="below 18"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="18-22"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="23-29" Selected="True"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="30-39"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="40-49"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="50-59"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="60 and above"></telerik:DropDownListItem>
                                </Items>
                            </telerik:RadDropDownList>
                        </div>

                        <!-- Remember me -->
                        <div class="form-group">
                            <div class="checkbox-inline">
                                <asp:CheckBox runat="server" Checked="true" Text="Remember me" ID="RemberMe" />
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group">
                            <telerik:RadButton ID="CancelButton" runat="server" Text="Cancel"></telerik:RadButton>
                            <telerik:RadButton ID="SubmitButton" runat="server" Text="Login" CssClass="rbPrimaryButton"></telerik:RadButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
