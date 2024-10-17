package edu.sunmoon.app.frame;

import java.util.List;

public interface SMRepository<K, V> {
    void insert(V v) throws Exception;
    void update(V v) throws Exception;
    void delete(K k) throws Exception;
    V select(K k) throws Exception;
    List<V> select() throws Exception;
}
