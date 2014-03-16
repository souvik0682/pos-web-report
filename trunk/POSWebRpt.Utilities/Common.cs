using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace POSWebRpt.Utilities
{
    #region Enumerations

    /// <summary>
    /// Specifies the exception severity.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public enum ExceptionSeverity
    {
        High = 1,
        Medium = 2,
        Low = 3
    }

    /// <summary>
    /// Specifies the exception type.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public enum ExceptionType
    {
        Error = 1,
        Warning = 2
    }

    /// <summary>
    /// Specifies the months.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public enum Month
    {
        January = 1,
        February = 2,
        March = 3,
        April = 4,
        May = 5,
        June = 6,
        July = 7,
        August = 8,
        September = 9,
        October = 10,
        November = 11,
        December = 12
    };

    /// <summary>
    /// Specifies the report format in which the report will be generated.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public enum ReportFormat
    {
        /// <summary>
        /// Report will be generated in PDF format.
        /// </summary>
        PDF = 1,
        /// <summary>
        /// Report will be generated in Ms-Excel format.
        /// </summary>
        Excel = 2,
        /// <summary>
        /// Report will be generated in XML format.
        /// </summary>
        Word = 3,
        /// <summary>
        /// Report will be generated in MS Word format.
        /// </summary>
        XML = 4
    }

    /// <summary>
    /// Specifies the type of the TextBox control (Alphabet, Numeric, Decimal).
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public enum TextBoxType
    {
        /// <summary>
        /// TextBox allows only alphabets.
        /// </summary>
        Alphabet = 1,
        /// <summary>
        /// TextBox allows only number.
        /// </summary>
        Numeric = 2,
        /// <summary>
        /// TextBox allows decimal number.
        /// </summary>
        Decimal = 3
    };

    /// <summary>
    /// Specifies the different modes of operation on data.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public enum DataOperationMode
    {
        View = 1,
        Add = 2,
        Edit = 3,
        Delete = 4
    };

    /// <summary>
    /// Specifies the page name.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public enum PageName
    {
        Home = 1,
        UserGroupMaster = 2,
        UserMaster = 3,
        ListType = 4,
        ListItem = 5,
        RoleMaster = 6
    };

    public enum UserRole
    {
        Admin = 1,
        Management = 2
    }

    public enum ResultType
    {
        RecordNotAffected = 0,
        Success = 1,
        Failure = 2
    }

    #endregion

    /// <summary>
    /// Represents a static class which contains constant variables used throughout the application.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>18/06/2013</createddate>
    public static class Constants
    {
        public const string DEFAULT_CULTURE = "en-GB";
        public const string DATA_VALUE_FIELD = "ListItemValue";
        public const string DATA_TEXT_FIELD = "ListItemText";
        public const string DROPDOWNLIST_DEFAULT_VALUE = "0";
        public const string DROPDOWNLIST_DEFAULT_TEXT = "--Select--";
        public const string DROPDOWNLIST_ALL_TEXT = "All";
        public const string DROPDOWNLIST_OTHER_TEXT = "OTHER";
        public const string NOT_AVAILABLE_TEXT = "Not Available";
        public const string SORT_EXPRESSION = "SortExpression";
        public const string SORT_DIRECTION = "SortDirection";
        public const string CURRENCY_FORMAT = "N2";
        public const string EMAIL_REGX_EXP = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
        public const string PHONE_REGX_EXP = @"^((\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*\/*)*$"; // @"^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$"; 
        public static readonly DateTime MinDateTime = new DateTime(1900, 1, 1);
        public static readonly DateTime MaxDateTime = new DateTime(3000, 12, 31);
        public const string DEFAULT_PASSWORD = "123";
        public const string DEFAULT_CONTENT_TYPE = @"image\jpg";
        public const int DEFAULT_COMPANY_ID = 1;

        #region Session Variables

        public const string SESSION_USER_INFO = "UserInfo";
        public const string SESSION_ERROR = "Error";
        public const string SESSION_SEARCH_CRITERIA = "SearchCriteria";
        public const string SESSION_USER_PERMISSION = "UserPermission";

        #endregion

        #region View State Variables

        public const string VS_SEARCH_CRITERIA = "SearchCriteria";

        #endregion

        #region Query String Variables

        #endregion
    }
}
