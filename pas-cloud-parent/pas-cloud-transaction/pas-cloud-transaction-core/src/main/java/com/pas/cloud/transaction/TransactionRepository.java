package com.pas.cloud.transaction;


import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.pas.cloud.transaction.api.TransactionXid;

/**
 * Created by changmingxie on 11/12/15.
 */
public interface TransactionRepository {

    int create(Transaction transaction);

    int update(Transaction transaction);

    int delete(Transaction transaction);

    Transaction findByXid(TransactionXid xid);

    List<Transaction> findAllUnmodifiedSince(Date date);

}
