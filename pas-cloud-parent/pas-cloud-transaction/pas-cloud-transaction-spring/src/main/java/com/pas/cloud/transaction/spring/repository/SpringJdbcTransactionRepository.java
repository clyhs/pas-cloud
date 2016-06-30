package com.pas.cloud.transaction.spring.repository;


import org.springframework.jdbc.datasource.DataSourceUtils;

import com.pas.cloud.transaction.repository.JdbcTransactionRepository;

import java.sql.Connection;

/**
 * Created by changmingxie on 10/30/15.
 */
public class SpringJdbcTransactionRepository extends JdbcTransactionRepository {

    protected Connection getConnection() {
        return DataSourceUtils.getConnection(this.getDataSource());
    }

    protected void releaseConnection(Connection con) {
        DataSourceUtils.releaseConnection(con, this.getDataSource());
    }
}
