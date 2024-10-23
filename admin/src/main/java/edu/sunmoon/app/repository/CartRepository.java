package edu.sunmoon.app.repository;

import edu.sunmoon.app.dto.CartDTO;
import edu.sunmoon.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CartRepository extends SMRepository<Integer, CartDTO> {
    List<CartDTO> selectByCustomerId(String customerId) throws Exception;
    List<CartDTO> selectByItemName(CartDTO cartDTO) throws Exception;
}
