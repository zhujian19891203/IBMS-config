package com.billJiang.framework.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.billJiang.framework.query.pojo.QueryDefinition;

public class QueryListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent context) {

    }

    public void contextInitialized(ServletContextEvent context) {

        QueryDefinition.getInstance();
    }

}
