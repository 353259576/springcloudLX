package org.ws.java.order.annotation;

import java.lang.annotation.*;

@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Authority {
    public String companyName() default "";

    public boolean onlyAllowAdmin() default false;

    public boolean auto() default false;

    public boolean onlyLogin() default false;

    public boolean isArray() default false;
}
