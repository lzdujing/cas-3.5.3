package org.jasig.cas.util;

import org.jasig.cas.authentication.handler.PasswordEncoder;

public class DefaultPasswordEncoder implements PasswordEncoder {
    @Override
    public String encode(String password) {
        return password;
    }
}
