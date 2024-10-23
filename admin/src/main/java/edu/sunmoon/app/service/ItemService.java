package edu.sunmoon.app.service;

import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.frame.SMService;
import edu.sunmoon.app.repository.ItemRepository;
import edu.sunmoon.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService implements SMService<Integer, ItemDTO> {
    final ItemRepository itemRepository;

    @Value("${app.dir.uploadimgdir}")
    String imgdir;

    @Override
    public void add(ItemDTO itemDTO) throws Exception {
        FileUploadUtil.saveFile(itemDTO.getImage(), imgdir);
        itemRepository.insert(itemDTO);
    }

    @Override
    public void modify(ItemDTO itemDTO) throws Exception {
        if (itemDTO.getImage().isEmpty()) {
            itemRepository.update(itemDTO);
        } else {
            String oldimg = itemDTO.getImgName();
            itemDTO.setImgName(itemDTO.getImage().getOriginalFilename());
            itemRepository.update(itemDTO);
            FileUploadUtil.saveFile(itemDTO.getImage(), imgdir);
            FileUploadUtil.deleteFile(oldimg, imgdir);
        }
    }

    @Override
    public void delete(Integer integer) throws Exception {
        String imgName = itemRepository.selectOne(integer).getImgName();
        FileUploadUtil.deleteFile(imgName, imgdir);
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
}
