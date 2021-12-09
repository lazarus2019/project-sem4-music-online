package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Notification;
import com.demo.repositories.NotificationRepository;

@Service("notificationService")
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationRepository notificationRepository;

	@Override
	public List<Notification> getAllNewByStatus(int accountId) {
		return notificationRepository.getAllNewByStatus(accountId);
	}

	@Override
	public List<Notification> getAllReadByStatus(int accountId, int n) {
		return notificationRepository.getAllReadByStatus(accountId, n);
	}

	@Override
	public List<Notification> getAllByAccountId(int accountId) {
		return notificationRepository.getAllByAccountId(accountId);
	}

	@Override
	public Notification save(Notification notification) {
		return notificationRepository.save(notification);
	}

	@Override
	public void delete(int[] ids) {
		for (int id : ids) {
			notificationRepository.deleteById(id);
		}
	}

	@Override
	public Notification findById(int id) {
		return notificationRepository.findById(id).get();
	}

}
