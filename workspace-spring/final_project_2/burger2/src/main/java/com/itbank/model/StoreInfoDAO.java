package com.itbank.model;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;

@RestController
public interface StoreInfoDAO {

	List<StoreInfoDTO> selectStore(String info);

}
