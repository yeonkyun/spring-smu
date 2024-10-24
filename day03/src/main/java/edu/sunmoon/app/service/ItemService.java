package edu.sunmoon.app.service;

import com.github.pagehelper.PageHelper;
import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.dto.Search;
import edu.sunmoon.app.frame.SMService;
import edu.sunmoon.app.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements SMService<Integer, ItemDTO> {
    final ItemRepository itemRepository;

    @Override
    public void add(ItemDTO itemDTO) throws Exception {
        itemRepository.insert(itemDTO);
    }

    @Override
    public void modify(ItemDTO itemDTO) throws Exception {
        itemRepository.update(itemDTO);
    }

    @Override
    public void delete(Integer integer) throws Exception {
        itemRepository.delete(integer);
    }

    @Override
    public ItemDTO get(Integer integer) throws Exception {
        return itemRepository.selectOne(integer);
    }

    @Override
    public List<ItemDTO> get() throws Exception {
        return itemRepository.select();
    }

    public List<ItemDTO> getByName(String name) throws Exception {
        return itemRepository.SelectByName(name);
    }

    public List<ItemDTO> getpage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return itemRepository.getpage();
    }

    public List<ItemDTO> search(Search search, int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return itemRepository.search(search);
    }
}
