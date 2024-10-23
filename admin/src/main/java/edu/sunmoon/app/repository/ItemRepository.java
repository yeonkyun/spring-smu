package edu.sunmoon.app.repository;

import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ItemRepository extends SMRepository<Integer, ItemDTO> {
    List<ItemDTO> SelectByName(String name) throws Exception;
}
