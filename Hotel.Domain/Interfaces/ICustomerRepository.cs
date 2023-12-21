using Hotel.Domain.Model;
using System.Collections.Generic;

namespace Hotel.Domain.Interfaces
{
    public interface ICustomerRepository
    {
        void AddCustomer(Customer customer);
        IReadOnlyList<Customer> GetCustomers(string filter);
        Customer GetCustomer(int id);
        void UpdateCustomer(Customer customer);
        void SoftDeleteCustomer(int? customerId);
    }
}
