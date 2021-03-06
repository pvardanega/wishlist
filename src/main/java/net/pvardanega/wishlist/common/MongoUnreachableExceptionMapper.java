package net.pvardanega.wishlist.common;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import org.springframework.stereotype.Service;

@Service
@Provider
public class MongoUnreachableExceptionMapper implements ExceptionMapper<MongoUnreachableException> {

    @Override
    public Response toResponse(MongoUnreachableException e) {
        // TODO : log the error
        return Response.serverError().build();
    }
}
