using Hotel.Domain.Interfaces;
using Hotel.Domain.Model;
using Hotel.Persistence.Exceptions;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Persistence.Repositories
{
    public class CustomerRepository : ICustomerRepository
    {
        private string connectionString;

        public CustomerRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IReadOnlyList<Customer> GetCustomers(string filter)
        {
            try
            {
                List<Customer> customers = new List<Customer>();
                string sql = @"
                                SELECT 
                                    k.Id, 
                                    k.Name, 
                                    ci.Id AS ContactInfoId, 
                                    ci.Email, 
                                    ci.Phone, 
                                    a.Id AS AddressId, 
                                    a.City, 
                                    a.Street, 
                                    a.PostalCode, 
                                    a.HouseNumber, 
                                    m.Id AS MemberId, 
                                    m.Name AS MemberName, 
                                    m.Birthday
                                FROM 
                                    Klant k
                                INNER JOIN 
                                    ContactInfo ci ON k.ContactInfoId = ci.Id
                                INNER JOIN 
                                    Address a ON ci.AddressId = a.Id
                                LEFT JOIN 
                                    Member m ON k.Id = m.KlantId
                                WHERE 
                                    (k.Name LIKE @filter OR ci.Email LIKE @filter) AND IsActive = 1";

                using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@filter", $"%{filter}%");

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        var customerDict = new Dictionary<int, Customer>();

                        while (reader.Read())
                        {
                            int customerId = reader.GetInt32(reader.GetOrdinal("Id"));
                            if (!customerDict.TryGetValue(customerId, out Customer customer))
                            {
                                customer = new Customer(
                                    customerId,
                                    reader.GetString(reader.GetOrdinal("Name")),
                                    reader.GetInt32(reader.GetOrdinal("ContactInfoId")),
                                    new ContactInfo(
                                        reader.GetString(reader.GetOrdinal("Email")),
                                        reader.GetString(reader.GetOrdinal("Phone")),
                                        reader.GetInt32(reader.GetOrdinal("AddressId")),
                                        new Address(
                                            reader.GetString(reader.GetOrdinal("City")),
                                            reader.GetString(reader.GetOrdinal("Street")),
                                            reader.GetString(reader.GetOrdinal("PostalCode")),
                                            reader.GetString(reader.GetOrdinal("HouseNumber"))
                                        )
                                    )
                                );
                                customerDict.Add(customerId, customer);
                                customers.Add(customer);
                            }

                            if (!reader.IsDBNull(reader.GetOrdinal("MemberId")))
                            {
                                customer.AddMember(new Member(
                                    reader.GetString(reader.GetOrdinal("MemberName")),
                                    DateOnly.FromDateTime(reader.GetDateTime(reader.GetOrdinal("Birthday")))
                                ));
                            }
                        }
                    }
                }

                return customers;
            }
            catch (Exception ex)
            {
                throw new CustomerRepositoryException("Error retrieving customers", ex);
            }
        }

        public Customer GetCustomerById(int customerId)
        {
            try
            {
                Customer customer = null;
                string sql = @"
                        SELECT 
                            k.Id, 
                            k.Name, 
                            ci.Id AS ContactInfoId, 
                            ci.Email, 
                            ci.Phone, 
                            a.Id AS AddressId, 
                            a.City, 
                            a.Street, 
                            a.PostalCode, 
                            a.HouseNumber, 
                            m.Id AS MemberId, 
                            m.Name AS MemberName, 
                            m.Birthday
                        FROM 
                            Klant k
                        INNER JOIN 
                            ContactInfo ci ON k.ContactInfoId = ci.Id
                        INNER JOIN 
                            Address a ON ci.AddressId = a.Id
                        LEFT JOIN 
                            Member m ON k.Id = m.KlantId
                        WHERE 
                            k.Id = @CustomerId";

                using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        var members = new List<Member>();

                        while (reader.Read())
                        {
                            if (customer == null)
                            {
                                customer = new Customer(
                                    reader.GetInt32(reader.GetOrdinal("Id")),
                                    reader.GetString(reader.GetOrdinal("Name")),
                                    reader.GetInt32(reader.GetOrdinal("ContactInfoId")),
                                    new ContactInfo(
                                        reader.GetString(reader.GetOrdinal("Email")),
                                        reader.GetString(reader.GetOrdinal("Phone")),
                                        reader.GetInt32(reader.GetOrdinal("AddressId")),
                                        new Address(
                                            reader.GetString(reader.GetOrdinal("City")),
                                            reader.GetString(reader.GetOrdinal("Street")),
                                            reader.GetString(reader.GetOrdinal("PostalCode")),
                                            reader.GetString(reader.GetOrdinal("HouseNumber"))
                                        )
                                    )
                                );
                            }

                            if (!reader.IsDBNull(reader.GetOrdinal("MemberId")))
                            {
                                Member member = new Member(
                                    reader.GetString(reader.GetOrdinal("MemberName")),
                                    DateOnly.FromDateTime(reader.GetDateTime(reader.GetOrdinal("Birthday")))
                                );
                                members.Add(member);
                            }
                        }

                        if (customer != null)
                        {
                            foreach (var member in members)
                            {
                                customer.AddMember(member);
                            }
                        }
                    }
                }

                return customer;
            }
            catch (Exception ex)
            {
                throw new CustomerRepositoryException("Error retrieving customer by ID", ex);
            }
        }

        public void UpdateCustomer(Customer customer)
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (var sqlTransaction = conn.BeginTransaction())
                    using (var cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.Transaction = sqlTransaction;

                        try
                        {
                            // Update Klant table
                            cmd.CommandText = "UPDATE Klant SET Name = @name WHERE Id = @klantId";
                            cmd.Parameters.AddWithValue("@name", customer.Name);
                            cmd.Parameters.AddWithValue("@klantId", customer.Id);
                            cmd.ExecuteNonQuery();

                            // Update ContactInfo table
                            cmd.CommandText = "UPDATE ContactInfo SET Email = @email, Phone = @phone WHERE Id = @contactInfoId";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@email", customer.Contact.Email);
                            cmd.Parameters.AddWithValue("@phone", customer.Contact.Phone);
                            cmd.Parameters.AddWithValue("@contactInfoId", customer.ContactInfoId);
                            cmd.ExecuteNonQuery();

                            // Update Address table
                            cmd.CommandText = "UPDATE Address SET City = @city, Street = @street, PostalCode = @postalCode, HouseNumber = @houseNumber WHERE Id = @addressId";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@city", customer.Contact.Address.City);
                            cmd.Parameters.AddWithValue("@street", customer.Contact.Address.Street);
                            cmd.Parameters.AddWithValue("@postalCode", customer.Contact.Address.PostalCode);
                            cmd.Parameters.AddWithValue("@houseNumber", customer.Contact.Address.HouseNumber);
                            cmd.Parameters.AddWithValue("@addressId", customer.Contact.AddressId);
                            cmd.ExecuteNonQuery();

                            var currentMembers = GetCurrentMembers(customer.Id, conn, sqlTransaction);

                            // Remove old members
                            foreach (var currentMember in currentMembers)
                            {
                                bool NameInclude = false;
                                foreach (var membertt in customer.GetMembers())
                                {
                                    if (membertt.Name == currentMember.Name)
                                    {
                                        NameInclude = true;
                                    }    
                                }
                                if (!NameInclude)
                                {
                                    cmd.CommandText = "DELETE FROM Member WHERE Name = @memberName AND KlantId = @klantId";
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("@memberName", currentMember.Name);
                                    cmd.Parameters.AddWithValue("@KlantId", customer.Id);
                                    cmd.ExecuteNonQuery();
                                }
                            }

                            // Update Members
                            //Insert Members(assuming you have a list of members in your Customer object)
                            foreach (Member member in customer.GetMembers())
                            {
                                if (!currentMembers.Contains(member))
                                {
                                    cmd.CommandText = "INSERT INTO Member(Name, Birthday, KlantId) VALUES (@memberName, @birthday, @klantId)";
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("@memberName", member.Name);
                                    cmd.Parameters.AddWithValue("@birthday", member.Birthday.ToDateTime(TimeOnly.MinValue));
                                    cmd.Parameters.AddWithValue("@klantId", customer.Id);
                                    cmd.ExecuteNonQuery();
                                }                                
                            }

                            sqlTransaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            sqlTransaction.Rollback();
                            throw new CustomerRepositoryException("Error updating customer", ex);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new CustomerRepositoryException("Database operation failed", ex);
            }
        }

        private List<Member> GetCurrentMembers(int customerId, SqlConnection conn, SqlTransaction transaction)
        {
            var members = new List<Member>();
            var sql = @"
        SELECT Name, Birthday
        FROM Member
        WHERE KlantId = @customerId";

            using (var cmd = new SqlCommand(sql, conn, transaction))
            {
                cmd.Parameters.AddWithValue("@customerId", customerId);

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var member = new Member
                        {
                            Name = reader.GetString(reader.GetOrdinal("Name")),
                            Birthday = DateOnly.FromDateTime(reader.GetDateTime(reader.GetOrdinal("Birthday")))
                        };

                        members.Add(member);
                    }
                }

                return members;
            }
        }


        public void SoftDeleteCustomer(int? customerId)
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                using (var cmd = new SqlCommand("UPDATE Klant SET IsActive = 0 WHERE Id = @klantId", conn))
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@klantId", customerId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new CustomerRepositoryException("Error soft-deleting customer", ex);
            }
        }

        public void AddCustomer(Customer customer)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlTransaction sqlTransaction = conn.BeginTransaction())
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.Transaction = sqlTransaction;

                        try
                        {
                            // Insert into Address
                            cmd.CommandText = "INSERT INTO Address(City, Street, PostalCode, HouseNumber) OUTPUT INSERTED.Id VALUES(@city, @street, @postalCode, @houseNumber)";
                            cmd.Parameters.AddWithValue("@city", customer.Contact.Address.City);
                            cmd.Parameters.AddWithValue("@street", customer.Contact.Address.Street);
                            cmd.Parameters.AddWithValue("@postalCode", customer.Contact.Address.PostalCode);
                            cmd.Parameters.AddWithValue("@houseNumber", customer.Contact.Address.HouseNumber);
                            int addressId = (int)cmd.ExecuteScalar();

                            // Insert into ContactInfo
                            cmd.CommandText = "INSERT INTO ContactInfo(Email, Phone, AddressId) OUTPUT INSERTED.Id VALUES(@email, @phone, @addressId)";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@email", customer.Contact.Email);
                            cmd.Parameters.AddWithValue("@phone", customer.Contact.Phone);
                            cmd.Parameters.AddWithValue("@addressId", addressId);
                            int contactInfoId = (int)cmd.ExecuteScalar();

                            // Insert into Klant
                            cmd.CommandText = "INSERT INTO Klant(Name, ContactInfoId) VALUES(@name, @contactInfoId)";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@name", customer.Name);
                            cmd.Parameters.AddWithValue("@contactInfoId", contactInfoId);
                            cmd.ExecuteNonQuery();
                            int customerId = contactInfoId;

                            // Insert Members (assuming you have a list of members in your Customer object)
                            foreach (Member member in customer.GetMembers())
                            {
                                cmd.CommandText = "INSERT INTO Member(Name, Birthday, KlantId) VALUES (@memberName, @birthday, @klantId)";
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("@memberName", member.Name);
                                cmd.Parameters.AddWithValue("@birthday", member.Birthday.ToDateTime(TimeOnly.MinValue));
                                cmd.Parameters.AddWithValue("@klantId", customerId); // Assuming this sets the correct KlantId
                                cmd.ExecuteNonQuery();
                            }

                            sqlTransaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            sqlTransaction.Rollback();
                            throw new CustomerRepositoryException("Error adding customer", ex);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new CustomerRepositoryException("Database operation failed", ex);
            }
        }

        public List<Member> GetMembersByCustomerId(int? customerId)
        {
            List<Member> members = new List<Member>();

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = @"
                    SELECT Name, Birthday 
                    FROM Member 
                    WHERE KlantId = @klantId";

                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@klantId", customerId);

                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Member member = new Member(
                                    reader.GetString(reader.GetOrdinal("Name")),
                                    DateOnly.FromDateTime(reader.GetDateTime(reader.GetOrdinal("Birthday")))
                                );
                                members.Add(member);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving members", ex);
            }

            return members;
        }

        public void AddMemberToCustomer(int customerId, Member member)
        {
            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = @"
                        INSERT INTO Member (Name, Birthday, KlantId) 
                        VALUES (@name, @birthday, @klantId)";

                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@name", member.Name);
                        cmd.Parameters.AddWithValue("@birthday", member.Birthday.ToDateTime(TimeOnly.MinValue));
                        cmd.Parameters.AddWithValue("@klantId", customerId);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error adding member to customer", ex);
            }
        }


    }
}
