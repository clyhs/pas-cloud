package com.pas.cloud.transaction;


import java.io.Serializable;

import com.pas.cloud.transaction.api.TransactionXid;

/**
 * Created by changmingxie on 10/27/15.
 */
public class Participant implements Serializable {

    private static final long serialVersionUID = 4127729421281425247L;
    private TransactionXid xid;

    private Terminator terminator;

    public Participant(TransactionXid xid, Terminator terminator) {
        this.xid = xid;
        this.terminator = terminator;
    }

    public void rollback() {
        terminator.rollback();
    }

    public void commit() {
        terminator.commit();
    }

}
