package net.pvardanega.wishlist.common;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;

public class MongoUnreachableExceptionMapper implements ExceptionMapper<MongoUnreachableException> {

    @Override
    public Response toResponse(MongoUnreachableException e) {
        // TODO : log the error
        return Response.serverError().build();
    }
}
