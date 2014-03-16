using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using POSWebRpt.BLL;
using POSWebRpt.DAL.DBManager;

namespace POSWebRpt.BLL.Settings
{
    public sealed class Settings
    {
        #region Private Static Member Variables

        private static string _connectionString = string.Empty;
        private static string _cultureName = string.Empty;
        private static string _uploadedDocPath = string.Empty;
        private static string _logFileName = string.Empty;
        private static Int32 _pageSize = 0;

        #endregion

        #region Public Static Properties

        public static string ConnectionString
        {
            get { return _connectionString; }
        }

        public static string CultureName
        {
            get { return _cultureName; }
        }

        public static string UploadedDocPath
        {
            get { return _uploadedDocPath; }
        }

        public static string LogFileName
        {
            get { return _logFileName; }
        }

        public static Int32 PageSize
        {
            get { return _pageSize; }
        }

        #endregion

        #region Public Static Methods

        public static void Load()
        {
            _connectionString = GetConnectionString("ConnectionString");
            _cultureName = GetConfigurationValue("Culture");
            _uploadedDocPath = GetConfigurationValue("UploadedDocPath");
            _logFileName = GetConfigurationValue("LogFileName");
            Int32.TryParse(GetConfigurationValue("PageSize"), out _pageSize);

            DataServiceBase.ConnectionString = _connectionString;
            DataServiceBase.CultureName = _cultureName;
            BLLBase.LogFileName = GetConfigurationValue("LogFileName");
        }

        #endregion

        #region Private Static Methods

        private static string GetConfigurationValue(string key)
        {
            return Convert.ToString(ConfigurationManager.AppSettings[key]);
        }

        private static string GetConnectionString(string key)
        {
            return Convert.ToString(ConfigurationManager.ConnectionStrings[key]);
        }

        #endregion
    }
}
