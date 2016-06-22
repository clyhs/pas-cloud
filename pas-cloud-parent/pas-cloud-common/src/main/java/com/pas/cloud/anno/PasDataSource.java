package com.pas.cloud.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午3:59:54
 */
@Target({ElementType.METHOD, ElementType.TYPE})  
@Retention(RetentionPolicy.RUNTIME)  
@Documented  
public @interface PasDataSource {  
    String value() default "dataSource_0";  
}