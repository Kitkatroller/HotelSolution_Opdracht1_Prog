using Hotel.Domain.Model;
using Hotel.Persistence.Repositories;

namespace ConsoleAppDL
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            string conn = @"Data Source=RAZER-LAPTOP-EP\SQLEXPRESS;Initial Catalog=Hotel;Integrated Security=True";

            CustomerRepository repo = new CustomerRepository(conn);

            //Adds a customer
            //Customer c = new Customer("piet", new ContactInfo("piet@yahoo", "013456", new Address("Gent", "Kerkstraat", "9000", "185")));
            //c.AddMember(new Member("paul", new DateOnly(2000, 5, 8)));
            //c.AddMember(new Member("rudy", new DateOnly(1987, 1, 1)));
            //repo.AddCustomer(c);

            //Gets an existing customer
            var x = repo.GetCustomers("pi");
            Console.WriteLine(x[0].Contact.Address);           

            //Updates a customer
            var customerToUpdate = repo.GetCustomerById(1);

            // Make changes to the customer
            //customerToUpdate.Name = "Updated Name"; // Example change
            //customerToUpdate.Contact.Email = "updated_email@example.com"; // Example change
            //customerToUpdate.Contact.Phone = "dasdsdada"; // Example change
            //customerToUpdate.Contact.Address.City = "Updated City"; // Example change
            //customerToUpdate.Contact.Address.Street = "Updated Street"; // Example change
            //customerToUpdate.Contact.Address.PostalCode = "Updated PostalCode"; // Example change
            //customerToUpdate.Contact.Address.HouseNumber = "Updated HouseNumber"; // Example change

            //// Update the customer in the database
            //repo.UpdateCustomer(customerToUpdate);
            //Console.WriteLine("Customer updated successfully.");

            //Soft Delete Customer
            //repo.SoftDeleteCustomer(1);
            //Console.WriteLine("Customer with ID 1 has been soft deleted.");
        }
    }
}