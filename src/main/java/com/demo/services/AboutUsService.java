package com.demo.services;

import com.demo.entities.Aboutus;

public interface AboutUsService {

	public Iterable<Aboutus> findAlls();

	public Aboutus save(Aboutus aboutus);

	public Aboutus findById(int id);

	public void delete(int id);

}
