package edu.sunmoon.app.repository;

import edu.sunmoon.app.dto.AdminDto;
import edu.sunmoon.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface AdminRepository extends SMRepository<String, AdminDto> {
}
