package com._2laps.api.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class SpringContextInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        servletContext.setInitParameter("contextConfigLocation", "com._2laps.api.config");
        WebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
        if (rootAppContext != null) {
            servletContext.addListener(new ContextLoaderListener(rootAppContext));
        }
    }
}
