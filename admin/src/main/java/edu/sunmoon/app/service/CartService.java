package edu.sunmoon.app.service;

import edu.sunmoon.app.dto.CartDTO;
import edu.sunmoon.app.frame.SMService;
import edu.sunmoon.app.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements SMService<Integer, CartDTO> {
    final CartRepository cartRepository;

    @Override
    public void add(CartDTO cartDTO) throws Exception {
        cartRepository.insert(cartDTO);
    }

    @Override
    public void modify(CartDTO cartDTO) throws Exception {
        cartRepository.update(cartDTO);
    }

    @Override
    public void delete(Integer integer) throws Exception {
        cartRepository.delete(integer);
    }

    @Override
    public CartDTO get(Integer integer) throws Exception {
        return cartRepository.selectOne(integer);
    }

    @Override
    public List<CartDTO> get() throws Exception {
        return cartRepository.select();
    }

    public List<CartDTO> getByCustomerId(String customerId) throws Exception {
        return cartRepository.selectByCustomerId(customerId);
    }

    public List<CartDTO> getByItemName(CartDTO cartDTO) throws Exception {
        return cartRepository.selectByItemName(cartDTO);
    }

}
