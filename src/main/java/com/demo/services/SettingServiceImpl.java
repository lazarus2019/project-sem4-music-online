package com.demo.services;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.ServicePackage;
import com.demo.entities.Setting;
import com.demo.entities.Track;
import com.demo.helpers.CalculateDateTimeHelper;
import com.demo.models.WeeklyTrackModel;
import com.demo.repositories.AccountRepository;
import com.demo.repositories.PackageRepository;
import com.demo.repositories.SettingRepository;
import com.demo.repositories.TrackRepository;
import com.fasterxml.jackson.core.format.InputAccessor.Std;

@Service("settingService")
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingRepository settingRepository;

	@Override
	public Setting find(int id) {
		return settingRepository.findById(id).get();
	}

}
