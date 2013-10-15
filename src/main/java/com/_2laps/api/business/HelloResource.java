package com._2laps.api.business;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

@Path("/")
public class HelloResource {

    @GET
    public String sayHello() {
        return "Welcome!";
    }
}
