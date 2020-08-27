<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ButtonColumnFiresClientScriptWithRowId._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>How to attach a client-side event with a dynamic argument to a template button</title>
    <script type="text/javascript">
    function GridRowAction(rowId) {
        var parameters = 'RowClick;'  + rowId;
        callbackPanel.PerformCallback(parameters);
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="ID">
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="ID" VisibleIndex="0">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn VisibleIndex="1">
                    <DataItemTemplate>
                        <dxe:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="btnRowAction"
                            Text="..." AutoPostBack="false"
                            ClientSideEvents-Click='<%# "function(s, e) { GridRowAction(" + Container.KeyValue + "); }" %>'>
                        </dxe:ASPxButton>
                    </DataItemTemplate>
                </dxwgv:GridViewDataTextColumn>
            </Columns>
        </dxwgv:ASPxGridView>
        <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="200px" ClientInstanceName="callbackPanel" OnCallback="ASPxCallbackPanel1_Callback">
            <PanelCollection>
                <dxp:PanelContent runat="server"><dxe:ASPxLabel runat="server" Text="Click row button" ID="ASPxLabel1"></dxe:ASPxLabel>
</dxp:PanelContent>
            </PanelCollection>
        </dxcp:ASPxCallbackPanel>
    </div>
    </form>
</body>
</html>
