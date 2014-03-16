using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace POSWebRpt.DAL.DBManager
{
    /// <summary>
    /// Represents a collection of <see cref="System.Data.SqlClient.SqlParameter"/> objects.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createdate>27-Feb-2010</createdate>
    public sealed class ParameterCollection
    {
        #region Private Variables

        private List<SqlParameter> _sqlParamList = new List<SqlParameter>();

        #endregion

        #region Constructors

        /// <summary>
        /// Initializes a new instance of the <see cref="REC.DAL.DBManager.ParameterCollection"/> class.
        /// </summary>
        public ParameterCollection()
        {
            
        }

        #endregion

        #region Public Properties

        /// <summary>
        /// Returns an Integer that contains the number of elements in the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection.
        /// This property is Read-only.
        /// </summary>
        public int Count
        {
            get { return _sqlParamList.Count; }
        }

        #endregion

        #region Public Indexer

        /// <summary>
        /// Gets the <see cref="System.Data.SqlClient.SqlParameter"/> at the specified index.
        /// </summary>
        /// <param name="index">The zero-based index of the parameter to retrieve.</param>
        /// <returns>The <see cref="System.Data.SqlClient.SqlParameter"/> at the specified index.</returns>
        public SqlParameter this[int index]
        {
            get
            {
                if (index >= 0 && index + 1 <= _sqlParamList.Count)
                {
                    return (SqlParameter)this._sqlParamList[index];
                }
                else
                {
                    throw new IndexOutOfRangeException("Invalid index " + index.ToString() + " for this SqlParameterCollection with Count=" + _sqlParamList.Count + ".");
                }
            }
            set
            {
                this._sqlParamList[index] = value;
            }
        }

        /// <summary>
        /// Gets the <see cref="System.Data.SqlClient.SqlParameter"/> with the specified name.
        /// </summary>
        /// <param name="parameterName">The name of the parameter to retrieve.</param>
        /// <returns>The <see cref="System.Data.SqlClient.SqlParameter"/> with the specified name.</returns>
        public SqlParameter this[string parameterName]
        {
            get
            {
                SqlParameter sqlParam = null;

                foreach (SqlParameter param in _sqlParamList)
                {
                    if (param.ParameterName.Equals(parameterName))
                    {
                        sqlParam = param;
                        break;
                    }
                }

                if (sqlParam == null)
                    throw new IndexOutOfRangeException("An SqlParameter with ParameterName '" + parameterName + "' is not contained by this SqlParameterCollection.");

                return sqlParam;
            }
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// Adds the specified <see cref="System.Data.SqlClient.SqlParameter"/> object to the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection.
        /// </summary>
        /// <param name="value">The <see cref="System.Data.SqlClient.SqlParameter"/> to add to the collection.</param>
        /// <returns>A new <see cref="System.Data.SqlClient.SqlParameter"/> object.</returns>
        public SqlParameter Add(SqlParameter value)
        {
            _sqlParamList.Add(value);
            return value;
        }

        /// <summary>
        /// Adds a <see cref="System.Data.SqlClient.SqlParameter"/> to the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection
        /// with the given the parameter name and value.
        /// </summary>
        /// <param name="parameterName">The name of the parameter.</param>
        /// <param name="value">The Parameter value.</param>
        /// <returns>A new <see cref="System.Data.SqlClient.SqlParameter"/> object.</returns>
        public SqlParameter Add(string parameterName, object value)
        {
            SqlParameter param = new SqlParameter(parameterName, value);
            param.Direction = ParameterDirection.Input;
            _sqlParamList.Add(param);
            return param;
        }

        /// <summary>
        /// Adds a <see cref="System.Data.SqlClient.SqlParameter"/> to the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection
        /// given the parameter name and the data type.
        /// </summary>
        /// <param name="parameterName">The name of the parameter.</param>
        /// <param name="sqlDbType">The SQL Server specific data type of the parameter.</param>
        /// <param name="value">The Parameter value.</param>
        /// <returns>A new <see cref="System.Data.SqlClient.SqlParameter"/> object.</returns>
        public SqlParameter Add(string parameterName, SqlDbType sqlDbType, object value)
        {
            SqlParameter param = new SqlParameter(parameterName, sqlDbType);
            param.Direction = ParameterDirection.Input;
            param.Value = value;
            _sqlParamList.Add(param);
            return param;
        }

        /// <summary>
        /// Adds a <see cref="System.Data.SqlClient.SqlParameter"/> to the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection
        /// given the parameter name, the data type, and the column length.
        /// </summary>
        /// <param name="parameterName">The name of the parameter.</param>
        /// <param name="sqlDbType">The SQL Server specific data type of the parameter.</param>
        /// <param name="size">The size as an <see cref="System.Int32"/>.</param>
        /// <param name="value">The Parameter value.</param>
        /// <returns>A new <see cref="System.Data.SqlClient.SqlParameter"/> object.</returns>
        public SqlParameter Add(string parameterName, SqlDbType sqlDbType, int size, object value)
        {
            SqlParameter param = new SqlParameter(parameterName, sqlDbType, size);
            param.Direction = ParameterDirection.Input;
            param.Value = value;
            _sqlParamList.Add(param);
            return param;
        }

        /// <summary>
        /// Adds a <see cref="System.Data.SqlClient.SqlParameter"/> to the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection
        /// given the parameter name, the data type, and the column length.
        /// </summary>
        /// <param name="parameterName">The name of the parameter.</param>
        /// <param name="sqlDbType">The SQL Server specific data type of the parameter.</param>
        /// <param name="size">The size as an <see cref="System.Int32"/>.</param>
        /// <param name="sourceColumn">The name of the source column.</param>
        /// <param name="value">The Parameter value.</param>
        /// <returns>A new <see cref="System.Data.SqlClient.SqlParameter"/> object.</returns>
        public SqlParameter Add(string parameterName, SqlDbType sqlDbType, int size, string sourceColumn, object value)
        {
            SqlParameter param = new SqlParameter(parameterName, sqlDbType, size);
            param.Direction = ParameterDirection.Input;
            param.SourceColumn = sourceColumn;
            param.Value = value;
            _sqlParamList.Add(param);
            return param;
        }

        /// <summary>
        /// Adds an output parameter to the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection
        /// given the parameter name and the data type.
        /// </summary>
        /// <param name="parameterName">The name of the parameter.</param>
        /// <param name="sqlDbType">The SQL Server specific data type of the parameter.</param>
        /// <returns>A new <see cref="System.Data.SqlClient.SqlParameter"/> object.</returns>
        public SqlParameter Add(string parameterName, SqlDbType sqlDbType,ParameterDirection direction)
        {
            SqlParameter param = new SqlParameter(parameterName, sqlDbType);
            param.Direction = direction;
            _sqlParamList.Add(param);
            return param;
        }

        /// <summary>
        /// Adds an output parameter to the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection
        /// given the parameter name, the data type, and the column length..
        /// </summary>
        /// <param name="parameterName">The name of the parameter.</param>
        /// <param name="dbType">The SQL Server specific data type of the parameter.</param>
        /// <param name="size">The size as an <see cref="System.Int32"/>.</param>
        /// <returns>A new <see cref="System.Data.SqlClient.SqlParameter"/> object.</returns>
        public SqlParameter Add(string parameterName, SqlDbType sqlDbType, int size, ParameterDirection direction)
        {
            SqlParameter param = new SqlParameter(parameterName, sqlDbType, size);
            param.Direction = direction;
            _sqlParamList.Add(param);
            return param;
        }

        /// <summary>
        /// Removes the specified <see cref="System.Data.SqlClient.SqlParameter"/> from the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection.
        /// </summary>
        /// <param name="value">A <see cref="System.Data.SqlClient.SqlParameter"/> object to remove from the collection.</param>
        public void Remove(SqlParameter value)
        {
            _sqlParamList.Remove(value);
        }

        /// <summary>
        /// Removes all the <see cref="System.Data.SqlClient.SqlParameter"/> objects from the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection.
        /// </summary>
        public void Clear()
        {
            _sqlParamList.Clear();
        }

        #endregion
    }
}
