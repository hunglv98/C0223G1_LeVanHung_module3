package service;

import model.Customer;
import repo.CustomerRepo;

import java.util.List;

public class CustomerService implements ICustomerService {
    private CustomerRepo customerRepo = new CustomerRepo();
    @Override
    public List<Customer> getList() {
        return customerRepo.getList();
    }
}
