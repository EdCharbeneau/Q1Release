<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageLayout.aspx.cs" Inherits="Default" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="ContentArea1" runat="server">
    <%--Open this page in chrome and use F12 tools device emulation to see it respond on mobile--%>
    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" UpdatePanelCssClass="" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ShowAnalysisButton">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="AnalysisPanel" UpdatePanelCssClass="" />
                    <telerik:AjaxUpdatedControl ControlID="RadHtmlChart1" UpdatePanelCssClass="" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div>
        <!-- Page Layout -->
        <telerik:RadPageLayout ID="RadPageLayout1" runat="server" GridType="Fluid">
            <Rows>
                <telerik:LayoutRow ID="LayoutRow1" runat="server" AccessKey="" HtmlTag="Div" RowType="Row" WrapperHtmlTag="None">
                    <Columns>
                        <telerik:LayoutColumn ID="LayoutColumn1" runat="server" HtmlTag="Div" Span="6" SpanMd="12" SpanSm="12" SpanXs="12" ToolTip="">
                            <!-- Left Column -->
                            <telerik:RadGrid ID="RadGrid1" runat="server" GroupPanelPosition="Top" RenderMode="Auto" SelectMethod="BindProducts"  CellSpacing="-1" GridLines="Both" AllowPaging="true" PageSize="15">
                                <MasterTableView SelectMethod="GetProducts" AutoGenerateColumns="False" EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="ProductID" DataType="System.Int32" FilterControlAltText="Filter ProductID column" HeaderText="ProductID" SortExpression="ProductID" UniqueName="ProductID">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ProductName" FilterControlAltText="Filter ProductName column" HeaderText="ProductName" SortExpression="ProductName" UniqueName="ProductName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="UnitPrice" DataType="System.Decimal" FilterControlAltText="Filter UnitPrice column" HeaderText="UnitPrice" SortExpression="UnitPrice" UniqueName="UnitPrice">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="UnitsInStock" DataType="System.Int32" FilterControlAltText="Filter UnitsInStock column" HeaderText="UnitsInStock" SortExpression="UnitsInStock" UniqueName="UnitsInStock">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCheckBoxColumn DataField="Discontinued" DataType="System.Boolean" FilterControlAltText="Filter Discontinued column" HeaderText="Discontinued" SortExpression="Discontinued" UniqueName="Discontinued">
                                        </telerik:GridCheckBoxColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowColumnHide="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <FilterMenu RenderMode="Auto">
                                </FilterMenu>
                                <HeaderContextMenu RenderMode="Auto">
                                </HeaderContextMenu>
                            </telerik:RadGrid>
                        </telerik:LayoutColumn>
                        <telerik:LayoutColumn ID="LayoutColumn2" runat="server" HtmlTag="Div" Span="6" SpanMd="12" SpanSm="12" SpanXs="12">
                            <!-- Right Column -->
                            <asp:Panel ID="AnalysisPanel" runat="server" Visible="false" CssClass="analysis-panel-action">
                                <telerik:RadButton ID="ShowAnalysisButton" runat="server" CssClass="rbPrimaryButton" OnClick="ShowAnalysisButton_Click" ButtonType="SkinnedButton" Text="Show Inventory Analysis"></telerik:RadButton>
                            </asp:Panel>
                            <telerik:RadHtmlChart ID="RadHtmlChart1" runat="server" RenderMode="Auto" SelectMethod="GetInventoryAnalysis" ChartTitle-Text="Inventory Analysis" Width="100%">
                                <PlotArea>
                                    <Series>
                                        <telerik:PieSeries NameField="InventoryType" DataFieldY="Percent" StartAngle="90">
                                        </telerik:PieSeries>
                                    </Series>
                                </PlotArea>
                            </telerik:RadHtmlChart>
                        </telerik:LayoutColumn>
                    </Columns>
                </telerik:LayoutRow>
            </Rows>
        </telerik:RadPageLayout>


        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
    </div>
</asp:Content>
