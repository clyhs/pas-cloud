package com.pas.cloud.transaction.repository;




import javax.sql.DataSource;
import javax.transaction.xa.Xid;

import org.apache.log4j.Logger;

import com.pas.cloud.transaction.Transaction;
import com.pas.cloud.transaction.utils.CollectionUtils;
import com.pas.cloud.transaction.utils.SerializationUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by changmingxie on 10/30/15.
 */
public class JdbcTransactionRepository extends CachableTransactionRepository {
	
	private static Logger log = Logger.getLogger(JdbcTransactionRepository.class);

    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public DataSource getDataSource() {
        return dataSource;
    }

    protected int doCreate(Transaction transaction) {

        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = this.getConnection();

            StringBuilder builder = new StringBuilder();
            builder.append("INSERT INTO TCC_TRANSACTION " +
                    "(GLOBAL_TX_ID,BRANCH_QUALIFIER,TRANSACTION_TYPE,CONTENT,STATUS,RETRIED_COUNT,CREATE_TIME,LAST_UPDATE_TIME,VERSION)" +
                    "VALUES(?,?,?,?,?,?,?,?,?)");

            stmt = connection.prepareStatement(builder.toString());
            
            log.info(builder.toString());
            log.info("insert xid-gid:"+transaction.getXid().getGlobalTransactionId());
            log.info("insert xid-qua:"+transaction.getXid().getBranchQualifier());
            log.info("insert xid-version:"+transaction.getVersion());

//            stmt.setString(1, transaction.getXid().getGlobalTransactionId().toString());
//            stmt.setString(2, transaction.getXid().getBranchQualifier().toString());

            stmt.setBytes(1, transaction.getXid().getGlobalTransactionId());
            stmt.setBytes(2, transaction.getXid().getBranchQualifier());

            stmt.setInt(3, transaction.getTransactionType().getId());
            stmt.setBytes(4, SerializationUtils.serialize(transaction));
            stmt.setInt(5, transaction.getStatus().getId());
            stmt.setInt(6, transaction.getRetriedCount());
            stmt.setTimestamp(7, new java.sql.Timestamp(transaction.getCreateTime().getTime()));
            stmt.setTimestamp(8, new java.sql.Timestamp(transaction.getLastUpdateTime().getTime()));
            stmt.setLong(9, transaction.getVersion());

            return stmt.executeUpdate();

        } catch (SQLException e) {
            throw new TransactionIOException(e);
        } finally {
            closeStatement(stmt);
            this.releaseConnection(connection);
        }
    }

    protected int doUpdate(Transaction transaction) {
        Connection connection = null;
        PreparedStatement stmt = null;


        transaction.updateTime();
        transaction.updateVersion();

        try {
            connection = this.getConnection();

            StringBuilder builder = new StringBuilder();
            builder.append("UPDATE TCC_TRANSACTION SET " +
                    "CONTENT = ?,STATUS = ?,LAST_UPDATE_TIME = ?, RETRIED_COUNT = ?,VERSION = VERSION+1 WHERE GLOBAL_TX_ID = ? AND BRANCH_QUALIFIER = ? AND VERSION = ?");

            log.info(builder.toString());
            
            stmt = connection.prepareStatement(builder.toString());
            
            log.info("update xid-gid:"+transaction.getXid().getGlobalTransactionId());
            log.info("update xid-qua:"+transaction.getXid().getBranchQualifier());
            log.info("update xid-version:"+transaction.getVersion());

            stmt.setBytes(1, SerializationUtils.serialize(transaction));
            stmt.setInt(2, transaction.getStatus().getId());
            stmt.setTimestamp(3, new Timestamp(transaction.getLastUpdateTime().getTime()));

            stmt.setInt(4, transaction.getRetriedCount());
            stmt.setBytes(5, transaction.getXid().getGlobalTransactionId());
            stmt.setBytes(6, transaction.getXid().getBranchQualifier());
            stmt.setLong(7, transaction.getVersion() - 1);

            int result = stmt.executeUpdate();
            
            log.info("result:"+result);

            return result;

        } catch (Throwable e) {
        	e.printStackTrace();
            throw new TransactionIOException(e);
        } finally {
            closeStatement(stmt);
            this.releaseConnection(connection);
        }
    }

    protected int doDelete(Transaction transaction) {
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = this.getConnection();

            StringBuilder builder = new StringBuilder();
            builder.append("DELETE FROM TCC_TRANSACTION " +
                    " WHERE GLOBAL_TX_ID = ? AND BRANCH_QUALIFIER = ?");

            stmt = connection.prepareStatement(builder.toString());
            
            log.info("delete xid-gid:"+transaction.getXid().getGlobalTransactionId());
            log.info("delete xid-qua:"+transaction.getXid().getBranchQualifier());
            stmt.setBytes(1, transaction.getXid().getGlobalTransactionId());
            stmt.setBytes(2, transaction.getXid().getBranchQualifier());

            return stmt.executeUpdate();

        } catch (SQLException e) {
            throw new TransactionIOException(e);
        } finally {
            closeStatement(stmt);
            this.releaseConnection(connection);
        }
    }

    protected Transaction doFindOne(Xid xid) {

        List<Transaction> transactions = doFind(Arrays.asList(xid));

        if (!CollectionUtils.isEmpty(transactions)) {
            return transactions.get(0);
        }
        return null;
    }

    @Override
    protected List<Transaction> doFindAllUnmodifiedSince(java.util.Date date) {

        List<Transaction> transactions = new ArrayList<Transaction>();

        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = this.getConnection();

            StringBuilder builder = new StringBuilder();
            builder.append("SELECT GLOBAL_TX_ID, BRANCH_QUALIFIER, CONTENT,STATUS,TRANSACTION_TYPE,CREATE_TIME,LAST_UPDATE_TIME,RETRIED_COUNT,VERSION" +
                    "  FROM TCC_TRANSACTION WHERE LAST_UPDATE_TIME < ? AND TRANSACTION_TYPE = 1");

            stmt = connection.prepareStatement(builder.toString());

            stmt.setTimestamp(1, new Timestamp(date.getTime()));

            ResultSet resultSet = stmt.executeQuery();

            while (resultSet.next()) {
                byte[] transactionBytes = resultSet.getBytes(3);
                Transaction transaction = (Transaction) SerializationUtils.deserialize(transactionBytes);
                transactions.add(transaction);
            }
        } catch (Throwable e) {
            throw new TransactionIOException(e);
        } finally {
            closeStatement(stmt);
            this.releaseConnection(connection);
        }

        return transactions;
    }

    protected List<Transaction> doFind(List<Xid> xids) {

        List<Transaction> transactions = new ArrayList<Transaction>();

        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            connection = this.getConnection();

            StringBuilder builder = new StringBuilder();
            builder.append("SELECT GLOBAL_TX_ID, BRANCH_QUALIFIER, CONTENT,STATUS,TRANSACTION_TYPE,CREATE_TIME,LAST_UPDATE_TIME,RETRIED_COUNT,VERSION" +
                    "  FROM TCC_TRANSACTION ");

            if (!CollectionUtils.isEmpty(xids)) {
                builder.append(" WHERE ");
                for (Xid xid : xids) {
                    builder.append("( GLOBAL_TX_ID = ? AND BRANCH_QUALIFIER = ? )");
                }
            }

            stmt = connection.prepareStatement(builder.toString());

            if (!CollectionUtils.isEmpty(xids)) {

                int i = 0;

                for (Xid xid : xids) {
                    stmt.setBytes(++i, xid.getGlobalTransactionId());
                    stmt.setBytes(++i, xid.getBranchQualifier());
                }
            }

            ResultSet resultSet = stmt.executeQuery();

            while (resultSet.next()) {

                byte[] transactionBytes = resultSet.getBytes(3);
                Transaction transaction = (Transaction) SerializationUtils.deserialize(transactionBytes);
                transactions.add(transaction);
            }
        } catch (Throwable e) {
            throw new TransactionIOException(e);
        } finally {
            closeStatement(stmt);
            this.releaseConnection(connection);
        }

        return transactions;
    }


    protected Connection getConnection() {
        try {
            return this.dataSource.getConnection();
        } catch (SQLException e) {
            throw new TransactionIOException(e);
        }
    }

    protected void releaseConnection(Connection con) {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            throw new TransactionIOException(e);
        }
    }

    private void closeStatement(Statement stmt) {
        try {
            if (stmt != null && !stmt.isClosed()) {
                stmt.close();
            }
        } catch (Exception ex) {
            throw new TransactionIOException(ex);
        }
    }
}
