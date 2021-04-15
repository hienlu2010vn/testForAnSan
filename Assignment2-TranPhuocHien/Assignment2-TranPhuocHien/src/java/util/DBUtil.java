/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.apache.log4j.Logger;

/**
 *
 * @author hienl
 */
public class DBUtil {

    private final static Logger LOG = Logger.getLogger(DBUtil.class);

    public static Connection getCon() {
        Connection conn = null;
        try {
            Context context = (Context) new InitialContext();
            Context end = (Context) context.lookup("java:comp/env");
            DataSource ds = (DataSource) end.lookup("dbCon");
            conn = ds.getConnection();
        } catch (NamingException | SQLException ex) {
            LOG.error(ex);
        }
        return conn;
    }

}
