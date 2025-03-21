package com.mindskip.xzs.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class StorageProperties {
    @Value("${file.storage.location}")
    private String location;

    public String getLocation() {
        return location;
    }
}