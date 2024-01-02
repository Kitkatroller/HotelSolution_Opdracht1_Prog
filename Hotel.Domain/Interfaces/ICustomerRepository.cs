using Hotel.Domain.Model;
using System.Collections.Generic;

namespace Hotel.Domain.Interfaces
{
    public interface ICustomerRepository
    {
        void AddCustomer(Customer customer);
        IReadOnlyList<Customer> GetCustomers(string filter);
        Customer GetCustomerById(int customerId);
        void UpdateCustomer(Customer customer);
        void SoftDeleteCustomer(int? customerId);
        List<Member> GetMembersByCustomerId(int? customerId);
        void AddMemberToCustomer(int customerId, Member member);
    }
}
