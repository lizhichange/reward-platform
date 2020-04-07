package org.near.servicesupport.error;

public interface ServiceError {
    int getErrcode();

    String getErrmsg();
}
