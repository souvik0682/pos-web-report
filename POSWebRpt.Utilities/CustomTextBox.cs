using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.ComponentModel;

namespace POSWebRpt.Utilities
{
    public class CustomTextBox:TextBox
    {
        /// <summary>
        /// Gets or sets the type of the TextBox control.
        /// </summary>
        /// <value>The type.</value>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        [DefaultValue(typeof(TextBoxType), "Numeric")]
        [Browsable(true)]
        public TextBoxType Type { get; set; }

        /// <summary>
        /// Gets or sets the precision.
        /// </summary>
        /// <value>The precision.</value>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        [DefaultValue(typeof(int), "0")]
        [Browsable(true)]
        public int Precision { get; set; }

        /// <summary>
        /// Gets or sets the scale.
        /// </summary>
        /// <value>The scale.</value>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        [DefaultValue(typeof(int), "0")]
        [Browsable(true)]
        public int Scale { get; set; }

        /// <summary>
        /// Renders the <see cref="OCTMPWeb.CustomControls.CustomTextBox"/> control to the specified <see cref="System.Web.UI.HtmlTextWriter"/> object.
        /// </summary>
        /// <param name="writer">The <see cref="System.Web.UI.HtmlTextWriter"/> that receives the rendered output.</param>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        protected override void Render(HtmlTextWriter writer)
        {
            string type = string.Empty;

            switch (Type)
            {
                case TextBoxType.Alphabet:
                    type = "alphabet";
                    break;
                case TextBoxType.Decimal:
                    type = "decimal";
                    break;
                case TextBoxType.Numeric:
                    type = "numeric";
                    break;
                default:
                    type = "numeric";
                    break;
            }

            if (type == "decimal" || type == "numeric")
                this.CssClass = "numerictextbox";
            else
                this.CssClass = "textbox";

            this.Attributes.Add("onpaste", "return false");
            this.Attributes.Add("ondragover", "_False(event)");
            //this.Attributes.Add("ondragenter", "_False(event)");
            this.Attributes.Add("ondrop", "return _StopDrop(event,this);");
            this.Attributes.Add("oncontextmenu", "return false;");
            this.Attributes.Add("onkeypress", "return _Validate(event,'" + type + "'," + Scale.ToString() + "," + Precision.ToString() + ",this)");

            if (type == "decimal")
            {
                this.Attributes.Add("onkeydown", "_SetText(this)");
                this.Attributes.Add("onkeyup", "_CheckText(this," + Precision.ToString() + ")");
                this.Attributes.Add("onblur", "return _FormatDecimal(this,'" + type + "'," + Scale.ToString() + "," + Precision.ToString() + ")");
            }

            base.Render(writer);
        }
    }
}
