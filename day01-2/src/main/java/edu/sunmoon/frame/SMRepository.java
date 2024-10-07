package edu.sunmoon.frame;

public interface SMRepository<K, V> {
    void insert(V v);
    void update(V v);
    void delete(K k);
}
