package edu.sunmoon.frame;

public interface SMService<K, V> {
    void register(V v);
    void modify(V v);
    void remove(K k);
}
