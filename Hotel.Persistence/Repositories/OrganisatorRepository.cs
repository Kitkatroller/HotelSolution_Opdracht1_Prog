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
    public class OrganisatorRepository : IOrganisatorRepository
    {
        private string connectionString;

        public OrganisatorRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IReadOnlyList<Organisator> GetOrganisators(string filter)
        {
            try
            {
                List<Organisator> organisators = new List<Organisator>();
                string sql = @"SELECT o.Id, o.Name, ci.Email, ci.Phone, a.City, a.Street, a.PostalCode, a.HouseNumber
                       FROM Organisator o
                       INNER JOIN ContactInfo ci ON o.ContactInfoId = ci.Id
                       INNER JOIN Address a ON ci.AddressId = a.Id
                       WHERE o.Name LIKE @filter OR ci.Email LIKE @filter";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@filter", $"%{filter}%");
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Organisator organisator = new Organisator(
                                    reader.GetInt32(reader.GetOrdinal("Id")),
                                    reader.GetString(reader.GetOrdinal("Name")),
                                    new ContactInfo(
                                        reader.GetString(reader.GetOrdinal("Email")),
                                        reader.GetString(reader.GetOrdinal("Phone")),
                                        new Address(
                                            reader.GetString(reader.GetOrdinal("City")),
                                            reader.GetString(reader.GetOrdinal("Street")),
                                            reader.GetString(reader.GetOrdinal("PostalCode")),
                                            reader.GetString(reader.GetOrdinal("HouseNumber"))
                                        )
                                    )
                                );
                                organisators.Add(organisator);
                            }
                        }
                    }

                    //// Retrieve Activiteiten for each Organisator
                    //foreach (var organisator in organisators)
                    //{
                    //    string activiteitenSql = @"SELECT * FROM Activiteit WHERE OrganisatorId = @organisatorId";
                    //    using (SqlCommand activiteitenCmd = new SqlCommand(activiteitenSql, conn))
                    //    {
                    //        activiteitenCmd.Parameters.AddWithValue("@organisatorId", organisator.Id);
                    //        using (SqlDataReader activiteitenReader = activiteitenCmd.ExecuteReader())
                    //        {
                    //            while (activiteitenReader.Read())
                    //            {
                    //                Activiteit activiteit = new Activiteit(
                    //                    activiteitenReader.GetInt32(activiteitenReader.GetOrdinal("Id")),
                    //                    activiteitenReader.GetString(activiteitenReader.GetOrdinal("Description")),
                    //                    activiteitenReader.GetString(activiteitenReader.GetOrdinal("Location")),
                    //                    activiteitenReader.GetTimeSpan(activiteitenReader.GetOrdinal("Duration")), // Assuming Duration is a TimeSpan
                    //                    activiteitenReader.GetString(activiteitenReader.GetOrdinal("Name")),
                    //                    activiteitenReader.GetDateTime(activiteitenReader.GetOrdinal("Date")),
                    //                    activiteitenReader.GetInt32(activiteitenReader.GetOrdinal("AvailablePlaces")),
                    //                    (float)activiteitenReader.GetDouble(activiteitenReader.GetOrdinal("AdultPrice")),
                    //                    (float)activiteitenReader.GetDouble(activiteitenReader.GetOrdinal("ChildPrice")),
                    //                    (float)activiteitenReader.GetDouble(activiteitenReader.GetOrdinal("Discount")),
                    //                    organisator.Id
                    //                );
                    //                organisator.AddActiviteit(activiteit);
                    //            }
                    //        }
                    //    }
                    //}

                }

                return organisators;
            }
            catch (Exception ex)
            {
                throw new OrganisatorRepositoryException("Error retrieving organisators", ex);
            }
        }

        public Organisator GetOrganisator(int id)
        {
            try
            {
                Organisator organisator = null;

                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Query to get Organisator details
                    string sql = @"
                SELECT o.Id, o.Name, ci.Email, ci.Phone, a.City, a.Street, a.PostalCode, a.HouseNumber
                FROM Organisator o
                INNER JOIN ContactInfo ci ON o.ContactInfoId = ci.Id
                INNER JOIN Address a ON ci.AddressId = a.Id
                WHERE o.Id = @organisatorId";

                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@organisatorId", id);

                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                organisator = new Organisator(
                                    reader.GetInt32(reader.GetOrdinal("Id")),
                                    reader.GetString(reader.GetOrdinal("Name")),
                                    new ContactInfo(
                                        reader.GetString(reader.GetOrdinal("Email")),
                                        reader.GetString(reader.GetOrdinal("Phone")),
                                        new Address(
                                            reader.GetString(reader.GetOrdinal("City")),
                                            reader.GetString(reader.GetOrdinal("Street")),
                                            reader.GetString(reader.GetOrdinal("PostalCode")),
                                            reader.GetString(reader.GetOrdinal("HouseNumber"))
                                        )
                                    )
                                );
                            }
                        }
                    }

                    // Query to get Activiteit details associated with the Organisator
                    if (organisator != null)
                    {
                        string activiteitenSql = @"
                    SELECT * FROM Activiteit WHERE OrganisatorId = @organisatorId";

                        using (var activiteitenCmd = new SqlCommand(activiteitenSql, conn))
                        {
                            activiteitenCmd.Parameters.AddWithValue("@organisatorId", id);

                            using (var activiteitenReader = activiteitenCmd.ExecuteReader())
                            {
                                while (activiteitenReader.Read())
                                {
                                    Activiteit activiteit = new Activiteit(
                                        activiteitenReader.GetInt32(activiteitenReader.GetOrdinal("Id")),
                                        activiteitenReader.GetString(activiteitenReader.GetOrdinal("Description")),
                                        activiteitenReader.GetString(activiteitenReader.GetOrdinal("Location")),
                                        (TimeSpan)activiteitenReader["Duration"], // Directly cast to TimeSpan
                                        activiteitenReader.GetString(activiteitenReader.GetOrdinal("Name")),
                                        activiteitenReader.GetDateTime(activiteitenReader.GetOrdinal("Date")),
                                        activiteitenReader.GetInt32(activiteitenReader.GetOrdinal("AvailablePlaces")),
                                        (float)activiteitenReader.GetDouble(activiteitenReader.GetOrdinal("AdultPrice")),
                                        (float)activiteitenReader.GetDouble(activiteitenReader.GetOrdinal("ChildPrice")),
                                        (float)activiteitenReader.GetDouble(activiteitenReader.GetOrdinal("Discount")),
                                        id
                                    );

                                    organisator.AddActiviteit(activiteit);
                                }
                            }
                        }
                    }
                }

                return organisator;
            }
            catch (Exception ex)
            {
                throw new OrganisatorRepositoryException("Error retrieving organisator", ex);
            }
        }

        public void UpdateOrganisator(Organisator organisator)
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
                            // Update Organisator table
                            cmd.CommandText = "UPDATE Organisator SET Name = @name WHERE Id = @organisatorId";
                            cmd.Parameters.AddWithValue("@name", organisator.Name);
                            cmd.Parameters.AddWithValue("@organisatorId", organisator.Id);
                            cmd.ExecuteNonQuery();

                            // Assuming ContactInfoId is stored in Organisator entity
                            int contactInfoId = organisator.ContactInfoId; // Or retrieve it as needed

                            // Update ContactInfo table
                            cmd.CommandText = "UPDATE ContactInfo SET Email = @email, Phone = @phone WHERE Id = @contactInfoId";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@email", organisator.Contact.Email);
                            cmd.Parameters.AddWithValue("@phone", organisator.Contact.Phone);
                            cmd.Parameters.AddWithValue("@contactInfoId", contactInfoId);
                            cmd.ExecuteNonQuery();

                            // Assuming AddressId is stored in ContactInfo entity
                            int addressId = organisator.Contact.AddressId; // Or retrieve it as needed

                            // Update Address table
                            cmd.CommandText = "UPDATE Address SET City = @city, Street = @street, PostalCode = @postalCode, HouseNumber = @houseNumber WHERE Id = @addressId";
                            cmd.Parameters.Clear();
                            Address address = organisator.Contact.Address;
                            cmd.Parameters.AddWithValue("@city", address.City);
                            cmd.Parameters.AddWithValue("@street", address.Street);
                            cmd.Parameters.AddWithValue("@postalCode", address.PostalCode);
                            cmd.Parameters.AddWithValue("@houseNumber", address.HouseNumber);
                            cmd.Parameters.AddWithValue("@addressId", addressId);
                            cmd.ExecuteNonQuery();

                            sqlTransaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            sqlTransaction.Rollback();
                            throw new OrganisatorRepositoryException("Error updating organisator", ex);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new OrganisatorRepositoryException("Database operation failed", ex);
            }
        }

        public void AddOrganisator(Organisator organisator)
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
                            cmd.Parameters.AddWithValue("@city", organisator.Contact.Address.City);
                            cmd.Parameters.AddWithValue("@street", organisator.Contact.Address.Street);
                            cmd.Parameters.AddWithValue("@postalCode", organisator.Contact.Address.PostalCode);
                            cmd.Parameters.AddWithValue("@houseNumber", organisator.Contact.Address.HouseNumber);
                            int addressId = (int)cmd.ExecuteScalar();

                            // Insert into ContactInfo
                            cmd.CommandText = "INSERT INTO ContactInfo(Email, Phone, AddressId) OUTPUT INSERTED.Id VALUES(@email, @phone, @addressId)";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@email", organisator.Contact.Email);
                            cmd.Parameters.AddWithValue("@phone", organisator.Contact.Phone);
                            cmd.Parameters.AddWithValue("@addressId", addressId);
                            int contactInfoId = (int)cmd.ExecuteScalar();

                            // Insert into Organisator
                            cmd.CommandText = "INSERT INTO Organisator(Name, ContactInfoId) VALUES(@name, @contactInfoId)";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@name", organisator.Name);
                            cmd.Parameters.AddWithValue("@contactInfoId", contactInfoId);
                            cmd.ExecuteNonQuery();

                            sqlTransaction.Commit();
                        }
                        catch (Exception ex)
                        {
                            sqlTransaction.Rollback();
                            throw new OrganisatorRepositoryException("Error adding organisator", ex);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new OrganisatorRepositoryException("Database operation failed", ex);
            }
        }
    }
}
