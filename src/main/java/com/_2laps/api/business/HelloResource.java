package com._2laps.api.business;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import org.springframework.stereotype.Component;

@Path("/")
@Component
public class HelloResource {

    @Inject
    private HelloService helloService;

    @GET
    public Hello sayHello() {
        return new Hello("Welcome " + helloService.getName() + "!");
    }
}
