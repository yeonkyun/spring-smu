package edu.sunmoon.app.frame;

import java.util.List;

public interface SMService<K, V> {
    void add(V v) throws Exception;
    void modify(V v) throws Exception;
    void delete(K k) throws Exception;
    V get(K k) throws Exception;
    List<V> get() throws Exception;
}
