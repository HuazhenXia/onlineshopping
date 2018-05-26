package edu.mum.onlineshoping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.onlineshoping.model.Orders;
import edu.mum.onlineshoping.repository.OrderRepository;
import edu.mum.onlineshoping.service.OrderService;

@Service
@Transactional
public class OrderServiceImp implements OrderService{

	@Autowired
	OrderRepository orderRepository;
	
	@Override
	public void addToOrderList(Orders orders) {
		// TODO Auto-generated method stub
		orderRepository.save(orders);
	}

	@Override
	public List<Orders> getAllOrdersByCustomerId(long id) {
		// TODO Auto-generated method stub
		return (List<Orders>)orderRepository.getAllOrdersByCustomerId(id);
	}

	@Override
	public Orders getOrderById(long id) {
		// TODO Auto-generated method stub
		return orderRepository.findOne(id);
	}

}
