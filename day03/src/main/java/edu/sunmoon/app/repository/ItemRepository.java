package edu.sunmoon.app.repository;

import com.github.pagehelper.Page;
import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.dto.Search;
import edu.sunmoon.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ItemRepository extends SMRepository<Integer, ItemDTO> {
    List<ItemDTO> SelectByName(String name) throws Exception;

    @Select("SELECT * FROM item")
    @ResultType(ItemDTO.class)
    Page<ItemDTO> getpage() throws Exception;

    Page<ItemDTO> search(Search search) throws Exception;
}
