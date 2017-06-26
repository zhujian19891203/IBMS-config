package com.morxeen.framework.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.morxeen.framework.query.pojo.QueryDefinition;

public class QueryListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent context) {

    }

    public void contextInitialized(ServletContextEvent context) {

        QueryDefinition.getInstance().initQuery();
    }

}
