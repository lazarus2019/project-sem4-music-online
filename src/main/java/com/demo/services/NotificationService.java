package com.demo.services;

import java.util.*;

import com.demo.entities.*;

public interface NotificationService {

	public List<Notification> getAllNewByStatus(int accountId);

	public List<Notification> getAllReadByStatus(int accountId, int n);

	public List<Notification> getAllByAccountId(int accountId);

	public Notification save(Notification notification);

	public void delete(int[] ids);
	
	public Notification findById(int id);

}
