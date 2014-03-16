using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace POSWebRpt.DAL.DBManager  
{
    /// <summary>
    /// Represents a wrapper class for performing database related operations.
    /// This class cannot be inherited.
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createdate>27/02/2010</createdate>
    /// </summary>
    public sealed class SqlDataHelper : IDisposable
    {
        #region Private Variables

        private SqlConnection _connection = null;
        private SqlCommand _command = null;
        private SqlDataReader _reader = null;
        private SqlTransaction _transaction = null;
        private CommandType _commandType = CommandType.Text;
        private string _commandText = string.Empty;
        private int _commandTimeout = 30;
        private ParameterCollection _sqlParamList = new ParameterCollection();
        private string _connectionString = string.Empty;

        #endregion

        #region Constructors

        /// <summary>
        /// Initializes a new instance of the <see cref="REC.DAL.DBManager.SqlDataHelper"/> class.
        /// </summary>
        public SqlDataHelper()
        {

        }

        /// <summary>
        /// Initializes a new instance of the <see cref="REC.DAL.DBManager.SqlDataHelper"/> class.
        /// </summary>
        /// <param name="connectionString">The connection used to open the SQL Server database.</param>
        public SqlDataHelper(string connectionString)
        {
            _connectionString = connectionString;
        }

        #endregion

        #region Public Properties

        /// <summary>
        /// Gets or sets the string used to open a SQL Server database.
        /// </summary>
        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }

        /// <summary>
        /// Gets or sets the Transact-SQL statement, table name or stored procedure to
        /// execute at the data source. The default is an empty string.
        /// </summary>
        public string CommandText
        {
            get { return _commandText; }
            set { _commandText = value; }
        }

        /// <summary>
        /// Gets or sets a value indicating how the <see cref="System.Data.SqlClient.SqlCommand.CommandText"/> 
        /// property is to be interpreted. The default is Text.
        /// </summary>
        public CommandType CommandType
        {
            get { return _commandType; }
            set { _commandType = value; }
        }

        /// <summary>
        /// Gets or sets the wait time before terminating the attempt to execute a command
        /// and generating an error.The default is 30 seconds.
        /// </summary>
        public int CommandTimeout
        {
            get { return _commandTimeout; }
            set { _commandTimeout = value; }
        }

        /// <summary>
        /// Gets the <see cref="System.Data.SqlClient.SqlConnection"/> used by this instance of the class.
        /// </summary>
        public SqlConnection Connection
        {
            get { return _connection; }
        }

        /// <summary>
        /// Gets the <see cref="System.Data.SqlClient.SqlTransaction"/> used by this instance of the class.
        /// </summary>
        public SqlTransaction Transaction
        {
            get { return _transaction; }
        }

        /// <summary>
        /// Gets the <see cref="System.Data.SqlClient.SqlCommand"/> used by this instance of the class.
        /// </summary>
        public SqlCommand Command
        {
            get { return _command; }
        }

        /// <summary>
        /// Gets the <see cref="System.Data.SqlClient.SqlDataReader"/> object.
        /// </summary>
        public SqlDataReader DataReader
        {
            get { return _reader; }
        }

        /// <summary>
        /// Gets the <see cref="REC.DAL.DBManager.ParameterCollection"/> collection.
        /// </summary>
        public ParameterCollection Parameters
        {
            get { return _sqlParamList; }
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// Opens a database connection with the property settings specified by the ConnectionString.
        /// </summary>
        public void Open()
        {
            if (_connection == null) _connection = new SqlConnection(_connectionString);
            if (_connection.State != ConnectionState.Open) _connection.Open();
            if (_command == null) _command = new SqlCommand();
        }

        /// <summary>
        /// Closes the connection to the database.
        /// </summary>
        public void Close()
        {
            if (_connection != null && _connection.State != ConnectionState.Closed) _connection.Close();
        }

        /// <summary>
        /// Releases all resources used by the <see cref="REC.DAL.DBManager.SqlDataHelper"/> 
        /// </summary>
        public void Dispose()
        {
            try
            {
                Close();
                CloseReader();
            }
            finally
            {
                this._reader = null;
                this._connection = null;
                this._command = null;
                this._transaction = null;
                GC.SuppressFinalize(this);
            }
        }

        /// <summary>
        /// Starts a database transaction.
        /// </summary>
        public void BeginTransaction()
        {
            if (_connection == null || _command == null || _connection.State != ConnectionState.Open)
                throw new InvalidOperationException("Invalid operation. The connection is closed.");

            if (_transaction == null) _transaction = _connection.BeginTransaction();
            _command.Transaction = _transaction;
        }

        /// <summary>
        /// Starts a database transaction with the specified isolation level.
        /// </summary>
        /// <param name="iso">The isolation level under which the transaction should run.</param>
        public void BeginTransaction(IsolationLevel iso)
        {
            if (_connection == null || _command == null || _connection.State != ConnectionState.Open)
                throw new InvalidOperationException("Invalid operation. The connection is closed.");

            if (_transaction == null) _transaction = _connection.BeginTransaction(iso);
            _command.Transaction = _transaction;
        }

        /// <summary>
        /// Starts a database transaction with the specified transaction name.
        /// </summary>
        /// <param name="transactionName">The name of the transaction.</param>
        public void BeginTransaction(string transactionName)
        {
            if (_connection == null || _command == null || _connection.State != ConnectionState.Open)
                throw new InvalidOperationException("Invalid operation. The connection is closed.");

            if (_transaction == null) _transaction = _connection.BeginTransaction(transactionName);
            _command.Transaction = _transaction;
        }

        /// <summary>
        /// Starts a database transaction with the specified isolation level and transaction name.
        /// </summary>
        /// <param name="iso">The isolation level under which the transaction should run.</param>
        /// <param name="transactionName">The name of the transaction.</param>
        public void BeginTransaction(IsolationLevel iso, string transactionName)
        {
            if (_connection == null || _command == null || _connection.State != ConnectionState.Open)
                throw new InvalidOperationException("Invalid operation. The connection is closed.");

            if (_transaction == null) _transaction = _connection.BeginTransaction(iso, transactionName);
            _command.Transaction = _transaction;
        }

        /// <summary>
        /// Commits the database transaction.
        /// </summary>
        public void CommitTransaction()
        {
            if (_transaction != null) _transaction.Commit();

            Close();
            this._transaction = null;
        }

        /// <summary>
        /// Rolls back a transaction from a pending state.
        /// </summary>
        public void RollbackTransaction()
        {
            if (_transaction != null) _transaction.Rollback();

            Close();
            this._transaction = null;
        }

        /// <summary>
        /// Rolls back a transaction from a pending state, and specifies the transaction or savepoint name.
        /// </summary>
        /// <param name="transactionName">The name of the transaction to roll back, or the savepoint to which to roll back.</param>
        public void RollbackTransaction(string transactionName)
        {
            if (_transaction != null) _transaction.Rollback(transactionName);

            Close();
            this._transaction = null;
        }

        /// <summary>
        /// Closes the <see cref="System.Data.SqlClient.SqlDataReader"/> object.
        /// </summary>
        public void CloseReader()
        {
            if (_reader != null && !_reader.IsClosed)
                _reader.Close();
        }

        /// <summary>
        /// Executes a Transact-SQL statement against the connection and returns the
        /// return value.
        /// </summary>
        /// <returns>The return value.</returns>
        public int ExecuteNonQuery()
        {
            int returnValue = -1;

            if (_connection == null || _command == null)
                throw new InvalidOperationException("ExecuteNonQuery: Connection property has not been initialized.");

            BuildCommand(true);
             _command.ExecuteNonQuery();
            returnValue = (int)_command.Parameters["ReturnValue"].Value;

            if (_command != null) _command.Parameters.Clear();

            return returnValue;
        }

        /// <summary>
        /// Executes the query, and returns the first column of the first row in the
        /// result set returned by the query. Additional columns or rows are ignored.
        /// </summary>
        /// <returns>
        /// The first column of the first row in the result set, or a null reference
        /// (Nothing in Visual Basic) if the result set is empty.
        /// </returns>
        public object ExecuteScalar()
        {
            object obj = null;

            if (_connection == null || _command == null)
                throw new InvalidOperationException("ExecuteScalar: Connection property has not been initialized.");

            BuildCommand(true);
            obj = _command.ExecuteScalar();

            if (_command != null) _command.Parameters.Clear();

            return obj;
        }

        /// <summary>
        /// Executes a Transact-SQL statement against the connection and returns the resulting DataSet.
        /// </summary>
        /// <returns>The <see cref="System.Data.DataSet"/> containing the result set.</returns>
        public DataSet ExecuteDataSet()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();

            if (_connection == null || _command == null)
                throw new InvalidOperationException("ExecuteDataSet: Connection property has not been initialized.");

            BuildCommand(true);
            da.SelectCommand = _command;
            da.Fill(ds);

            if (_command != null) _command.Parameters.Clear();

            return ds;
        }

        /// <summary>
        /// Sends the <see cref="System.Data.SqlClient.SqlCommand.CommandText"/> to the <see cref="System.Data.SqlClient.SqlCommand.Connection"/>,
        /// and builds a <see cref="System.Data.SqlClient.SqlDataReader"/>.
        /// </summary>
        /// <returns>A <see cref="System.Data.SqlClient.SqlDataReader"/> object.</returns>
        public SqlDataReader ExecuteReader()
        {
            if (_connection == null || _command == null)
                throw new InvalidOperationException("ExecuteReader: Connection property has not been initialized.");

            BuildCommand(false);
            _reader = _command.ExecuteReader(CommandBehavior.CloseConnection);

            if (_command != null) _command.Parameters.Clear();

            return _reader;
        }

        /// <summary>
        /// Sends the <see cref="System.Data.SqlClient.SqlCommand.CommandText"/> to the <see cref="System.Data.SqlClient.SqlCommand.Connection"/>,
        /// and builds a <see cref="System.Data.SqlClient.SqlDataReader"/> using one of the <see cref="System.Data.CommandBehavior"/> values.
        /// </summary>
        /// <param name="behavior">The <see cref="System.Data.CommandBehavior"/>.</param>
        /// <returns>A <see cref="System.Data.SqlClient.SqlDataReader"/> object.</returns>
        public SqlDataReader ExecuteReader(CommandBehavior behavior)
        {
            if (_connection == null || _command == null)
                throw new InvalidOperationException("ExecuteReader: Connection property has not been initialized.");

            BuildCommand(false);
            _reader = _command.ExecuteReader(behavior);

            if (_command != null) _command.Parameters.Clear();

            return _reader;
        }

        /// <summary>
        /// Reset all the property of the <see cref="REC.DAL.DBManager.SqlDataHelper"/> instance.
        /// </summary>
        public void Reset()
        {
            if (_command != null) _command.Parameters.Clear();

            _sqlParamList.Clear();
            _commandText = string.Empty;
            _commandType = System.Data.CommandType.Text;
            _commandTimeout = 30;
        }

        #endregion

        #region Private Methods

        /// <summary>
        /// Builds the <see cref="System.Data.SqlClient.SqlCommand"/> object.
        /// </summary>
        /// <param name="bIncludeReturnParameter">Indicates whether to include return parameter.</param>
        private void BuildCommand(bool bIncludeReturnParameter)
        {
            _command.Connection = _connection;
            _command.CommandType = _commandType;
            _command.CommandText = _commandText;
            _command.CommandTimeout = _commandTimeout;

            BuildParameters(bIncludeReturnParameter);
        }

        /// <summary>
        /// Adds the specified <see cref="System.Data.SqlClient.SqlParameter"/> object to the 
        /// <see cref="System.Data.SqlClient.SqlParameterCollection"/> property of the <see cref="System.Data.SqlClient.SQLCommand"/>.
        /// </summary>
        /// <param name="bIncludeReturnValue">Indicates whether to include return parameter.</param>
        private void BuildParameters(bool bIncludeReturnParameter)
        {
            if (bIncludeReturnParameter)
            {
                SqlParameter paramReturnValue = new SqlParameter("ReturnValue", SqlDbType.Int, 4, ParameterDirection.ReturnValue, false, 0, 0, String.Empty, DataRowVersion.Default, null);
                _sqlParamList.Add(paramReturnValue);
            }


            for (int index = 0; index < _sqlParamList.Count; index++)
            {
                if (_sqlParamList[index].Direction == ParameterDirection.InputOutput && _sqlParamList[index].Value == null)
                    _sqlParamList[index].Value = DBNull.Value;

                _command.Parameters.Add(_sqlParamList[index]);
            }
        }

        #endregion
    }
}
