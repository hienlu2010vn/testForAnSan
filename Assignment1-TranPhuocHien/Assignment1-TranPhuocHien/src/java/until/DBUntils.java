/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package until;

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
public class DBUntils {

    private final static Logger log = Logger.getLogger(DBUntils.class);

    public static Connection getCon(){
        Connection conn = null;
        try {
            Context context = (Context) new InitialContext();
            Context end = (Context) context.lookup("java:comp/env");
            DataSource ds = (DataSource) end.lookup("dbCon");
            conn = ds.getConnection();
        } catch (NamingException | SQLException ex) {
            log.error(ex);
        }
        return conn;
    }

}
