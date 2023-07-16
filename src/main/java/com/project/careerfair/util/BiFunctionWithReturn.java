package com.project.careerfair.util;

@FunctionalInterface
public interface BiFunctionWithReturn<T, U> {
    Integer apply(T t, U u);
}
