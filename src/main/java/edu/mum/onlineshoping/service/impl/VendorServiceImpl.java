package edu.mum.onlineshoping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.onlineshoping.model.Vendor;
import edu.mum.onlineshoping.repository.ProductRepository;
import edu.mum.onlineshoping.repository.VendorRepository;
import edu.mum.onlineshoping.service.VendorService;

@Service
@Transactional
public class VendorServiceImpl implements VendorService {
	@Autowired
	VendorRepository vendorRepository;
	
//	private final VendorRepository vendorRepository;
//		
//	@Autowired
//	public VendorServiceImpl(VendorRepository vendorRepository) {
//		this.vendorRepository = vendorRepository;
//	}

	@Override
	public Vendor save(Vendor vendor) {		
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder(12);
		vendor.getUser().setPassword(encoder.encode(vendor.getUser().getPassword()));
		vendorRepository.save(vendor);
		return vendor;
	}

	@Override
	public Vendor findByVendorId(Long vendorId) {
		return vendorRepository.findOne(vendorId);
	}

	@Override
	public List<String> findWeeks(String username) {
		// TODO Auto-generated method stub
		return vendorRepository.findWeeks(username);
	}
	
	@Override
	public Vendor findByUser_Username(String username) {
		// TODO Auto-generated method stub
		return this.vendorRepository.findByUser_Username(username);
		
	}

	@Override
	public void update(Vendor vendor) {
		// TODO Auto-generated method stub
		vendorRepository.save(vendor);
	}
	
	@Override
	public List<Vendor> findAll() {
		return (List<Vendor>) vendorRepository.findAll();
	}

	@Override
	public void delete(Long id) {
		vendorRepository.delete(id);
		
	}

	@Override
	public Vendor findOne(Long id) {
		return vendorRepository.findOne(id);
	}
}
