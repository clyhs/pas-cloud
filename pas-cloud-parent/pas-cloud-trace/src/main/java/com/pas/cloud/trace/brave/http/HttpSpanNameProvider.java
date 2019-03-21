package com.pas.cloud.trace.brave.http;

import com.github.kristofa.brave.http.HttpRequest;
import com.github.kristofa.brave.http.SpanNameProvider;


public class HttpSpanNameProvider  implements SpanNameProvider {

    @Override
    public String spanName(HttpRequest request) {
        return request.getUri().getPath();
    }
}
