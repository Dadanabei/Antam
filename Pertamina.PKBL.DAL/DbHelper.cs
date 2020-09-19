using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Configuration;

namespace Pertamina.PKBL.DAL
{
    public class DbHelper
    {
        string strConn = ConfigurationManager.ConnectionStrings["DBConnStr"].ToString();
        SqlConnection conn;

        public int ExecuteNonQuery(string query, Hashtable parameters)
        {
            if (conn == null)
            {
                conn = new SqlConnection(strConn);
            }
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandTimeout = 3600;
                foreach (DictionaryEntry item in parameters)
                {
                    string[] temp = item.Key.ToString().Split('-');
                    if (temp[1].ToLower() == "varchar")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.VarChar, int.Parse(temp[2])).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "nvarchar")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.NVarChar).Value = item.Value;

                    }
                    else if (temp[1].ToLower() == "int")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Int).Value = (item.Value == DBNull.Value)? item.Value:int.Parse(item.Value.ToString());

                    }
                    else if (temp[1].ToLower() == "date")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Date).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "bit")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Bit).Value = item.Value;
                    }

                    else if (temp[1].ToLower() == "datetime")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.DateTime).Value = item.Value;
                    }

                    else if (temp[1].ToLower() == "char")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Char, int.Parse(temp[2].ToString())).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "decimal")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Decimal).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "smallint")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.SmallInt).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "nchar")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.NChar).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "varbinary")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.VarBinary).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "text")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Text).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "structured")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Structured).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "float")
                    {
                        cmd.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Float).Value = item.Value;
                    } 

                }
                return cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                //conn.Dispose();
            }
        }


        public DataTable GetData(string query, Hashtable parameters)
        {
            DataTable data = new DataTable("data");
            if (conn == null)
            {
                conn = new SqlConnection(strConn);
            }

            try
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //da.SelectCommand.Connection.ConnectionTimeout = 3600;
                da.SelectCommand.CommandTimeout = 7200;

                foreach (DictionaryEntry item in parameters)
                {
                    string[] temp = item.Key.ToString().Split('-');
                    if (temp[1].ToLower() == "varchar")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.VarChar).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "nvarchar")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.NVarChar, int.Parse(temp[2])).Value = item.Value;

                    }
                    else if (temp[1].ToLower() == "int")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Int).Value = int.Parse(item.Value.ToString());

                    }
                    else if (temp[1].ToLower() == "date")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Date).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "bit")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Bit).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "datetime")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.DateTime).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "char")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Char, int.Parse(temp[2].ToString())).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "decimal")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Decimal).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "smallint")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.SmallInt).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "nchar")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.NChar).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "varbinary")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.VarBinary).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "structured")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Structured).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "float")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Float).Value = item.Value;
                    }
                    else if (temp[1].ToLower() == "text")
                    {
                        da.SelectCommand.Parameters.Add(temp[0].ToString(), System.Data.SqlDbType.Text).Value = item.Value;
                    } 
                }
                //ini waktu eksekusi query
                da.Fill(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return data;
        }

        public int ExecuteNonQuery2(string query, Hashtable parameters)
        {
            if (conn == null)
            {
                conn = new SqlConnection(strConn);
            }
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                foreach (DictionaryEntry item in parameters)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value);
                }
                return cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable GetData2(string query, Hashtable parameters)
        {
            DataTable data = new DataTable("data");
            if (conn == null)
            {
                conn = new SqlConnection(strConn);
            }

            try
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                foreach (DictionaryEntry item in parameters)
                {
                    da.SelectCommand.Parameters.AddWithValue(item.Key.ToString(), item.Value);
                }
                //ini waktu eksekusi query
                da.Fill(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return data;
        }

        public DataTable GetDataQuery(string query)
        {
            DataTable data = new DataTable("data");
            if (conn == null)
            {
                conn = new SqlConnection(strConn);
            }

            try
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.CommandType = CommandType.Text;
                da.Fill(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return data;
        }
    }
}
