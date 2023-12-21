using Hotel.Domain.Exceptions;
using Hotel.Domain.Interfaces;
using Hotel.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Domain.Managers
{
    public class CustomerManager
    {
        private ICustomerRepository _customerRepository;

        public CustomerManager(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }

        public IReadOnlyList<Customer> GetCustomers(string filter)
        {
            try
            {
                return _customerRepository.GetCustomers(filter);
            }
            catch(Exception ex)
            {
                throw new CustomerManagerException("GetCustomers");
            }
        }

        public void AddCustomer(Customer customer)
        {
            try
            {
                _customerRepository.AddCustomer(customer);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("AddCustomer", ex);
            }
        }

        public void UpdateCustomer(Customer customer)
        {
            try
            {
                _customerRepository.UpdateCustomer(customer);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("UpdateCustomer", ex);
            }
        }

        public void SoftDeleteCustomer(int? customerId)
        {
            try
            {
                _customerRepository.SoftDeleteCustomer(customerId);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("SoftDeleteCustomer", ex);
            }
        }

        public Customer GetCustomerById(int customerId)
        {
            try
            {
                return _customerRepository.GetCustomer(customerId);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomerById", ex);
            }
        }
    }
}
