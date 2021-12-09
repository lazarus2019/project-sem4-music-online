package com.demo.services;

import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.entities.PackageInfo;
import com.demo.entities.ServicePackage;
import com.demo.models.PackageChartModel;
import com.demo.repositories.PackageInfoRepository;
import com.demo.repositories.PackageRepository;
import com.fasterxml.jackson.databind.node.IntNode;

@Service("packageInfoService")
public class PackageInfoServiceImpl implements PackageInfoService {

	@Autowired
	private PackageInfoRepository packageInfoRepository;

	@Autowired
	private PackageRepository packageRepository;

	@Override
	public List<PackageInfo> findAll() {
		return (List<PackageInfo>) packageInfoRepository.findAll();
	}

	@Override
	public List<PackageChartModel> getPackageChart() {
		List<PackageChartModel> packChartModels = new ArrayList<PackageChartModel>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int thisMonth = calendar.get(Calendar.MONTH) + 1;
		int totalCount = packageInfoRepository.countAll(thisMonth);
		List<ServicePackage> servicePackages = (List<ServicePackage>) packageRepository.findAll();
		System.out.println("size pack: " + servicePackages.size());
		for (ServicePackage servicePackage : packageRepository.findAll()) {
			PackageChartModel packageChartModel = new PackageChartModel();
			packageChartModel.setPackageId(servicePackage.getId());
			packageChartModel.setName(servicePackage.getName());
			packageChartModel.setPrice(servicePackage.getPrice());
			packageChartModel.setMonth(new DateFormatSymbols().getMonths()[thisMonth - 1]);
			packageChartModel.setAmount(packageInfoRepository.countByPackageId(servicePackage.getId(), thisMonth));
			int perPackageCount = packageChartModel.getAmount();
			long average = perPackageCount * 100 / totalCount;
			packageChartModel.setAverage(average);
			packChartModels.add(packageChartModel);
		}
		System.out.println(packChartModels.size());
		List<PackageChartModel> top3package = new ArrayList<PackageChartModel>();
		int packModelSize = packChartModels.size();
		for (int i = 0; i < packModelSize; i++) {
			PackageChartModel max = packChartModels.get(0);
			for (int j = 0; j < packChartModels.size(); j++) {
				if (packChartModels.get(j).getAmount() > max.getAmount()) {
					max = packChartModels.get(j);
				}
			}
			if (top3package.size() < 3) {
				top3package.add(max);
			}
			packChartModels.remove(max);

			if (top3package.size() == 3) {
				break;
			}

		}
		System.out.println("top 3: " + top3package.size());
		return top3package;
	}

	@Override
	public List<Account> getAccountsSignPackageById(int packageId) {
		return packageInfoRepository.getAccountsSignPackageById(packageId);
	}

	@Override
	public int getAmountAccountSignPackageById(int packageId) {
		List<Account> accounts = packageInfoRepository.getAccountsSignPackageById(packageId);
		return accounts.size();
	}

	@Override
	public List<PackageInfo> getPackageInfosById(int packageId) {
		return packageInfoRepository.getPackageInfosById(packageId);
	}

	@Override
	public List<Double> getTotalPricePerMonth() {
		List<Double> totalprices = new ArrayList<Double>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		int thisYear = calendar.get(Calendar.YEAR);
		int thisMonth = calendar.get(Calendar.MONTH);
		for (int i = 1; i <= thisMonth + 1; i++) {
			double price = packageInfoRepository.totalPrice(thisYear, i);
			double formatPrice = Math.ceil((price * 100) / 100);
			totalprices.add(formatPrice);
		}
		return totalprices;
	}

	@Override
	public PackageInfo save(PackageInfo packageInfo) {
		return packageInfoRepository.save(packageInfo);
	}

}
