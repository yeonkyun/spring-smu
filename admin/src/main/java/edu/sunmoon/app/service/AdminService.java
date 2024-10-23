package edu.sunmoon.app.service;

import edu.sunmoon.app.dto.AdminDto;
import edu.sunmoon.app.frame.SMService;
import edu.sunmoon.app.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminService implements SMService<String, AdminDto> {

    private final AdminRepository adminRepository;

    @Override
    public void add(AdminDto adminDto) throws Exception {
    }

    @Override
    public void delete(String s) throws Exception {
    }

    @Override
    public void modify(AdminDto adminDto) throws Exception {
    }

    @Override
    public AdminDto get(String s) throws Exception {
        return adminRepository.selectOne(s);
    }

    @Override
    public List<AdminDto> get() throws Exception {
        return adminRepository.select();
    }
}
