package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.ServicePackage;
import com.demo.entities.Setting;
import com.demo.entities.Track;

@Repository("settingRepository")
public interface SettingRepository extends CrudRepository<Setting, Integer> {

}

