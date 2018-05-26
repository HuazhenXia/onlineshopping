package edu.mum.onlineshoping.service;

import java.util.List;

import edu.mum.onlineshoping.model.Customer;
import edu.mum.onlineshoping.model.User;

public interface UserService {
public Customer save(Customer customer);
public List<Customer> findAll();
public Customer findOne(Long id);
public void delete(Long id);
public void edit(Customer customer);
public Customer findOneWithName(String name);
public int findUserWithName(String name);
}
