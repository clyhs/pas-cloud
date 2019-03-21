package com.pas.cloud.trace.brave.http;

import lombok.Data;
import lombok.ToString;

import java.util.Map;


@Data
@ToString
public class HttpHeader {

    private Map<String,String> header;

}
