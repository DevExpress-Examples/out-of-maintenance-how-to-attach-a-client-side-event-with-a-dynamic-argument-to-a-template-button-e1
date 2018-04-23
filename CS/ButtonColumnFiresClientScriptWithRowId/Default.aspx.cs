using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace ButtonColumnFiresClientScriptWithRowId {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Init(object sender, EventArgs e) {
            ASPxGridView1.DataSource = GetDataTable();
        }

        protected void Page_Load(object sender, EventArgs e) {
            ASPxGridView1.DataBind();
        }

        private DataTable GetDataTable() {
            DataTable table = new DataTable();
            table.Columns.Add("ID", typeof(int));
            for(int i = 1; i <= 5; i++)
                table.Rows.Add(new object[] { i });
            return table;
        }

        protected void ASPxCallbackPanel1_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e) {
            string[] parameters = e.Parameter.Split(';');
            if(parameters.Length == 2 && parameters[0] == "RowClick") {
                int rowId = Convert.ToInt32(parameters[1]);
                ASPxLabel1.Text = string.Format("Row clicked: {0}", rowId);
            }
        }
    }
}
